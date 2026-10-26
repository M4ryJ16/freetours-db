-- Per-tour switch for the "last-minute booking cutoff" rule.
--
-- cutoff_enabled = true  -> the booking page hides departures that start in
--                           less than BOOKING_CUTOFF_MINUTES (25) from now.
-- cutoff_enabled = false -> the cutoff margin is ignored: a departure stays
--                           bookable until its actual start time.
--
-- A tour with NO row here behaves as cutoff_enabled = true (the existing
-- behaviour), so no backfill is needed. The cutoff length itself stays in
-- the frontend script; this table only stores the on/off flag.
CREATE TABLE tour_booking_settings (
    tour_id        UUID PRIMARY KEY REFERENCES tours(id) ON DELETE CASCADE,
    cutoff_enabled BOOLEAN NOT NULL DEFAULT true,

    -- Audits
    created_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);