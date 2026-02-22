CREATE TABLE public.book (
    book_id INTEGER GENERATED ALWAYS AS IDENTITY,
    isbn VARCHAR(13) NOT NULL,
    title VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    year SMALLINT NOT NULL,
    category VARCHAR(100) NOT NULL,
    available BOOLEAN NOT NULL,
    CONSTRAINT book_pkey PRIMARY KEY (book_id)
);