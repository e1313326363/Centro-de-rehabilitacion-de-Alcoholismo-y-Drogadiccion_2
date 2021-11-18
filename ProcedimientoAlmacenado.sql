--PROCEDIMIENTO
--Procedimiento almacenado:  Ingresar nombre del paciente y que salga impreso por cada año cuantos tipos de terapia ha tenido el paciente
create or replace function paciente_tratamiento(Nombre char)
returns table (Fecha numeric,TipoTramiento character varying ,Total int)
as
$$
select 
extract(year from fecha_ingreso),
cast(tipo_tratamiento as varchar(50)) as TipoTratamiento,
count(tipo_tratamiento)
from paciente
inner join tratamiento on paciente.id_paciente=tratamiento.id_paciente
inner join profesional on paciente.id_profesional=profesional.id_profesional
inner join ingreso on paciente.id_paciente=ingreso.id_paciente
where nombre_paciente = $1 
group by nombre_paciente,tipo_tratamiento,fecha_ingreso;
$$
language SQL;

select paciente_tratamiento('Ian');