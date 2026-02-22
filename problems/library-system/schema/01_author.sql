CREATE TABLE public.author (
    author_id INTEGER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(200) NOT NULL,
    CONSTRAINT author_pkey PRIMARY KEY (author_id)
);