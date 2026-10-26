-- Stores RAP actions for each operational role.
create table if not exists public.rap_acciones (
  id uuid primary key default gen_random_uuid(),
  rol_id uuid not null references public.roles(id) on delete cascade,
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  zona text not null,
  actividad text not null,
  hora_inicio time not null,
  hora_fin time not null,
  asignado_a text not null,
  created_at timestamptz not null default now()
);

alter table public.rap_acciones enable row level security;

drop policy if exists "rap_acciones_owner_all" on public.rap_acciones;
create policy "rap_acciones_owner_all"
  on public.rap_acciones
  for all
  to authenticated
  using (auth.uid() = owner_id)
  with check (auth.uid() = owner_id);

grant select, insert, update, delete on public.rap_acciones to authenticated;
