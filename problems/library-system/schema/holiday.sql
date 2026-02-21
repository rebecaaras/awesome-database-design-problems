CREATE TABLE public.holiday (
    holiday_date DATE NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT member_pkey PRIMARY KEY (holiday_date)
);