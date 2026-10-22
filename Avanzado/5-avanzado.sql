select 
    c.cliente_id, 
    c.nombre, 
    c.apellido,
    current_date - max(p.fecha_pedido)::date as dias_sin_comprar,
    count(p.pedido_id) as total_pedidos,
    sum(p.total) as monto_total
from clientes c
join pedidos p using (cliente_id)
where p.estado <> 'cancelado'
group by c.cliente_id, c.nombre, c.apellido
order by monto_total desc;