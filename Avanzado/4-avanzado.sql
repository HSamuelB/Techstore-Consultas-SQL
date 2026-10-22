with ventas_emp as (
    select 
        p.region_id,
        e.empleado_id,
        e.nombre, 
        e.apellido,
        sum(p.total) as total_ventas
    from pedidos p
    join empleados e using (empleado_id)
    where p.estado <> 'cancelado'
    group by p.region_id, e.empleado_id, e.nombre, e.apellido
),
ranking as (
    select 
        r.nombre as region,
        v.nombre,
        v.apellido,
        v.total_ventas,
        row_number() over(partition by v.region_id order by v.total_ventas desc) as ranking
    from ventas_emp v
    join regiones r using (region_id)
)
select region, nombre, apellido, total_ventas
from ranking
where ranking = 1
order by total_ventas desc;