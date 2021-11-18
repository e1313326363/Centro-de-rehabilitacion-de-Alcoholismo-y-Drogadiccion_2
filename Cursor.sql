--CURSOR
--Cursor en la que aparezca por cada año de funcionamiento cuantos ingresos he obtenido y cuantos totalmente rehabilitados tengo registrados.
do $$
declare
historico record;
cur_historico cursor for
select 
extract (year from ingreso.fecha_salida) Año,
sum(plan.precio_plan) as DineroTotal,
sum(ingreso.cantidadsalidas_correctas) as TotalSalidas
from pago
inner join plan on pago.id_plan=plan.id_plan
inner join ingreso on pago.id_ingreso=ingreso.id_ingreso 
where extract(year from fecha_salida) = '2021'
GROUP BY
extract (year from ingreso.fecha_salida);
begin
open cur_historico ;
fetch cur_historico into historico ;
while (found)loop 
raise notice 
'Año: %,   Total Precio: %,      Total Salidas: %',
historico.Año,historico.DineroTotal,historico.TotalSalidas;
fetch cur_historico into historico;
end loop;
end $$
language plpgsql;