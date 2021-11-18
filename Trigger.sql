--TRIGGER
--Trigger que impida que una persona sea registrada en una clínica cuando ha tenido mas de un incidente violento.
create or replace function tg_incidente() returns trigger
as
$tg_violento$
declare
incidente_v int;
maximo int=1;
begin
select max(incidente_violento) into incidente_v from ingreso where incidente_violento=new.incidente_violento;
if (incidente_v>maximo ) then
raise EXCEPTION 'Este usuario ha tenido más de un incidente violento';
else
raise notice 'Registrado!';
return new;
end if;
end;
$tg_violento$
language 'plpgsql';

create trigger tg_incidente after insert
on ingreso for each row
execute procedure tg_incidente();

--Comprobación
insert into ingreso (id_ingreso,id_paciente,fecha_ingreso,fecha_salida,
					 fecha_ceremoniadesalida,cantidad_ingresos,cantidadsalidas_correctas,
					 cantidadsalidas_incorrectas,incidente_violento)
values (7,4,'2020-10-05','2021-01-01','2021-01-15',2,1,1,2);
