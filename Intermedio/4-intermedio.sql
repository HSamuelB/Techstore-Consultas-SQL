select d.nombre, r.ranking, r.nombre, r.apellido, r.salario
from (
	select departamento_id, nombre, apellido, salario, 
	row_number() over(partition by departamento_id order by salario desc) as ranking
	from empleados
) as r
join departamentos d using (departamento_id)
where ranking <= 5
order by d.departamento_id, r.salario desc