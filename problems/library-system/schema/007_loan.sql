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
    CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES public.book (member_id),
    CONSTRAINT fk_librarian_id FOREIGN KEY (librarian_id) REFERENCES public.book (librarian_id)
);

CREATE TRIGGER validate_loan_and_set_status
BEFORE INSERT OR UPDATE ON public.loan
FOR EACH ROW
EXECUTE FUNCTION validate_loan_and_set_status();

CREATE TRIGGER set_book_status
AFTER INSERT OR UPDATE ON public.loan
FOR EACH ROW
EXECUTE FUNCTION set_book_status();