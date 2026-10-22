select c.nombre as categoria,
    round(
        sum((prod.precio_venta - prod.precio_compra) * d.cantidad) / sum(prod.precio_compra * d.cantidad) * 100
    , 2) as margen_ganancia
from detalle_pedidos d
join productos prod using (producto_id)
join categorias c using (categoria_id)
join pedidos p using (pedido_id)
where p.estado <> 'cancelado'
group by c.nombre
order by margen_ganancia desc;