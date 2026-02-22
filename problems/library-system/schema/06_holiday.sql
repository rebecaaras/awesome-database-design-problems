CREATE TABLE public.holiday (
    holiday_date DATE NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT holiday_pkey PRIMARY KEY (holiday_date)
);