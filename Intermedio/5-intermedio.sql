select p.cliente_id, c.nombre, c.apellido, extract( year from p.fecha_pedido) AS año, extract( month from p.fecha_pedido) AS mes,
       COUNT(*) AS numero_pedidos
from pedidos p
join clientes c using (cliente_id)
where p.estado <> 'cancelado'
group by p.cliente_id, c.nombre, c.apellido, extract(year from p.fecha_pedido), extract(month from p.fecha_pedido)
having COUNT(*) >= 3
order by año, mes;