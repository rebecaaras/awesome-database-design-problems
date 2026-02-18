CREATE TABLE public.member (
    member_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    address TEXT,
    phone VARCHAR(15),
    email VARCHAR(320) NOT NULL,
    membership_date DATE NOT NULL,
    CONSTRAINT member_pkey PRIMARY KEY (member_id),
    CONSTRAINT unique_member_email UNIQUE (email)
);