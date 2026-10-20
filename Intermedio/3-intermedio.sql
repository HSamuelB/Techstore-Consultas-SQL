select c.tipo_cliente, round(avg(p.total)) as ticket_prom
from pedidos p
join clientes c using (cliente_id)
where p.estado <> 'cancelado'
group by c.tipo_cliente 
order by ticket_prom 
