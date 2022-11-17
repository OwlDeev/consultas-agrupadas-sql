create database desafio2_alfonso_sandoval_123

select * from inscritos

--¿Cuántos registros hay? = 16
select count(*) as registros from inscritos

--¿Cuántos inscritos hay en total?
select sum(cantidad) as cuentas_inscritas from inscritos

--¿Cuál o cuáles son los registros de mayor antigüedad?
select * from inscritos
where fecha = (select min(fecha) from inscritos)

--¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
select 
	distinct fecha as fecha_dia, 
	sum(cantidad) as inscritos_por_dia
from inscritos 
group by fecha_dia
order by fecha asc

--¿Cuántos inscritos hay por fuente?
select
	distinct fuente,
	sum(cantidad) as inscritos_fuente
from inscritos
group by fuente

--¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?

me falta este

--¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
select
	fecha as dia_mayor_cantidad,
	max(cantidad) as personas
from inscritos
where fuente = 'Blog'
group by fecha
order by personas desc
limit 1

--¿Cuántas personas en promedio se inscriben en un día?
select
	sum(cantidad / (select count(distinct fecha) from inscritos)) as promedio
from inscritos

--¿Qué días se inscribieron más de 50 personas?
select distinct fecha
from inscritos
where cantidad > 50
order by fecha

--¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
select
	sum(cantidad / (select count(distinct fecha) from inscritos)) as promedio
from inscritos
where fecha > '01/03/2021'