CREATE TABLE public.book_author (
    author_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    CONSTRAINT book_author_pkey PRIMARY KEY (author_id, book_id),
    CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES public.author (author_id) ON DELETE CASCADE,
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES public.book (book_id) ON DELETE CASCADE
);