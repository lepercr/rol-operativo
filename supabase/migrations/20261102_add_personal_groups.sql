alter table public.personal
  add column if not exists grupo text;

update public.personal
set grupo = case
  when lower(coalesce(funcion, '')) like '%escuadra 1%' then 'Escuadra 1'
  when lower(coalesce(funcion, '')) like '%escuadra 2%' then 'Escuadra 2'
  when lower(coalesce(funcion, '')) like '%escuadra 3%' then 'Escuadra 3'
  when lower(coalesce(funcion, '')) like '%escuadra 4%' then 'Escuadra 4'
  when lower(coalesce(funcion, '')) like '%operacion%' then 'Operaciones'
  when lower(coalesce(funcion, '')) like '%programa%' then 'Programas'
  when lower(coalesce(funcion, '')) like '%labor%mixt%' then 'Labores mixtas'
  when lower(coalesce(funcion, '')) like '%jefatur%' then 'Jefaturas'
  else grupo
end
where grupo is null;
