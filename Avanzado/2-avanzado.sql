select c.cliente_id, c.nombre, c.apellido
from clientes c
where exists (
    select 1 
    from pedidos p 
    where p.cliente_id = c.cliente_id 
      and extract(year from p.fecha_pedido) = 2023
      and p.estado <> 'cancelado'
)
and not exists (
    select 1 
    from pedidos p 
    where p.cliente_id = c.cliente_id 
      and extract(year from p.fecha_pedido) = 2024
      and p.estado <> 'cancelado'
)
order by c.nombre, c.apellido;