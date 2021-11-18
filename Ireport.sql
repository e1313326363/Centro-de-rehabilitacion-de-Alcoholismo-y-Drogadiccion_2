--Ireport
select
cast(extract (year from ingreso.fecha_salida) as varchar(10)) as Año,
cast(sum(plan.precio_plan) as numeric) as DineroTotal
from pago
inner join plan on pago.id_plan=plan.id_plan
inner join ingreso on pago.id_ingreso=ingreso.id_ingreso
where extract(year from fecha_ingreso) >= '2019' and extract(year from fecha_ingreso) <= '2021'
GROUP BY
extract (year from ingreso.fecha_salida);