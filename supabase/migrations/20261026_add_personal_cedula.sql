-- Adds an optional Costa Rican ID number without changing existing personnel rows.
-- Run this once in the Supabase SQL Editor before using the cédula field.
alter table public.personal
  add column if not exists cedula text;
