alter table public.asignaciones
  add column if not exists cena time;

alter table public.asignaciones
  alter column desayuno drop not null,
  alter column almuerzo drop not null,
  alter column cafe drop not null,
  alter column cena drop not null;
