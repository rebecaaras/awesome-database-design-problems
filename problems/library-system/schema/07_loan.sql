CREATE OR REPLACE FUNCTION calculate_due_date(borrow_date DATE) RETURNS DATE AS $$
DECLARE
  due_date DATE := borrow_date + 14;
BEGIN
  WHILE
    EXTRACT(DOW FROM due_date) IN (0, 6)
    OR EXISTS (
        SELECT 1
        FROM holiday h
        WHERE h.holiday_date = due_date
    )
  LOOP
    due_date := due_date + 1;
  END LOOP;

  RAISE NOTICE '%', due_date;
  RETURN due_date;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION book_unavailable(p_book_id INT)
RETURNS VOID AS $$
DECLARE
    p_available boolean;
BEGIN
    SELECT available INTO p_available FROM book WHERE book_id = p_book_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Book not found';
    END IF;

    IF p_available = FALSE THEN
      RAISE EXCEPTION 'Book is not available';
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION member_cannot_borrow(p_member_id INT)
RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (SELECT FROM member m WHERE m.member_id = p_member_id) THEN
        RAISE EXCEPTION 'Member not found';
    END IF;

    IF EXISTS (SELECT FROM loan l WHERE l.member_id = p_member_id AND l.status = 'overdue') THEN
        RAISE EXCEPTION 'member cannot borrow due to overdue books';
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validate_loan_and_set_status()
RETURNS trigger AS $validate_loan_and_set_status$
  BEGIN
    PERFORM member_cannot_borrow(NEW.member_id);
    PERFORM book_unavailable(NEW.book_id);

    NEW.borrow_date := COALESCE(NEW.borrow_date, current_date);
    NEW.due_date := COALESCE(NEW.due_date, calculate_due_date(NEW.borrow_date));

    NEW.status :=
        CASE
            WHEN NEW.due_date >= current_date THEN 'borrowed'
            WHEN NEW.due_date < current_date THEN 'overdue'
            WHEN NEW.return_date IS NOT NULL THEN 'returned'
        END;

    RETURN NEW;
  END
$validate_loan_and_set_status$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION set_book_status()
RETURNS TRIGGER AS $set_book_status$
DECLARE
    is_book_available boolean;
BEGIN
    is_book_available :=
      CASE
        WHEN NEW.status = 'borrowed' OR NEW.status = 'overdue' THEN FALSE
        WHEN NEW.status = 'returned' THEN TRUE
      END;
    UPDATE book SET available = is_book_available WHERE book_id = NEW.book_id;
  RETURN NULL;
END;
$set_book_status$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE close_overdue_loans()
AS $close_overdue_loans$
BEGIN
    UPDATE public.loan
    SET status = 'overdue'
    WHERE due_date < CURRENT_DATE
      AND status = 'borrowed';
END;
$close_overdue_loans$ LANGUAGE plpgsql;

CREATE TABLE public.loan (
    loan_id INTEGER GENERATED ALWAYS AS IDENTITY,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(8) NOT NULL,
    member_id INTEGER NOT NULL,
    librarian_id INTEGER,
    book_id INTEGER NOT NULL,
    CONSTRAINT loan_pkey PRIMARY KEY (loan_id),
    CONSTRAINT due_date_greater_than_borrow_date CHECK (due_date > borrow_date),
    CONSTRAINT return_date_greater_than_or_equal_to_borrow_date CHECK (
        return_date IS NULL
        OR return_date >= borrow_date
    ),
    CONSTRAINT return_date_today_or_before CHECK (return_date <= CURRENT_DATE),
    CONSTRAINT loan_status_valid CHECK (
        status IN (
            'borrowed',
            'returned',
            'overdue'
        )
    ),
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES public.book (book_id),
    CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES public.member (member_id),
    CONSTRAINT fk_librarian_id FOREIGN KEY (librarian_id) REFERENCES public.librarian (librarian_id)
);

CREATE TRIGGER validate_loan_and_set_status
BEFORE INSERT OR UPDATE ON public.loan
FOR EACH ROW
EXECUTE FUNCTION validate_loan_and_set_status();

CREATE TRIGGER set_book_status
AFTER INSERT OR UPDATE ON public.loan
FOR EACH ROW
EXECUTE FUNCTION set_book_status();