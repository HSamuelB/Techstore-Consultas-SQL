select sum(total) as total_ventas, metodo_pago, count(*) as numero_pedidos_por_metodopago
from pedidos
where estado = 'entregado'
group by metodo_pago