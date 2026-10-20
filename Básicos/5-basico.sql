select pedido_id, fecha_pedido, total, estado
from pedidos
where fecha_pedido between '2025-01-01' and '2025-01-31'
order by fecha_pedido
