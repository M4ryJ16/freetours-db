-- This stores the available schedules (departure times) for each tour.
--
-- is_active lets a schedule be closed off without deleting it — deleting
-- is blocked once bookings reference it (bookings.tour_schedule_id), so
-- this is the same soft-archive pattern used by tours.is_active and
-- tour_dates.is_active.
CREATE TABLE tour_schedules (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    time TIME NOT NULL,
    tour_id UUID NOT NULL REFERENCES tours(id),
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);