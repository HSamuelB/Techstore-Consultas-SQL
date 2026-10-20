select estado, count(*) as cantidad
from clientes
group by estado