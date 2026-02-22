CREATE TABLE public.librarian (
    librarian_id INTEGER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(320) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT librarian_pkey PRIMARY KEY (librarian_id)
)