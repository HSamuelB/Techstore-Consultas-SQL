with ventas_mes as (
    select 
        date_trunc('month', fecha_pedido)::date as mes,
        sum(total) as total_ventas
    from pedidos
    where estado <> 'cancelado'
    group by date_trunc('month', fecha_pedido)
)
select 
    mes,
    total_ventas,
    lag(total_ventas) over (order by mes) as ventas_mes_anterior,
    round(
        (total_ventas - lag(total_ventas) over (order by mes)) / 
        lag(total_ventas) over (order by mes) * 100
    , 2) as porcentaje_cambio
from ventas_mes
order by mes;