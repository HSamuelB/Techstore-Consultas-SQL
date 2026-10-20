select nombre, marca, stock, stock_minimo
from productos
where stock < stock_minimo
