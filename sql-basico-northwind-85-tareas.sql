--🧠 SQL BÁSICO — LISTA GRANDE DE TAREAS (NORTHWIND)
-----Geudis Martinez-----
--🟢 BLOQUE 1: SELECT, FROM, ALIAS

--1. Lista todos los productos.

SELECT *
FROM Products;

--2. Muestra solo ProductName y UnitPrice.

SELECT 
	ProductName AS Descripcion,
	UnitPrice AS PrecioUnitario
FROM Products;

--3. Cambia los nombres de columnas a español usando AS.

SELECT 
	ProductName AS Descripcion,
	UnitPrice AS PrecioUnitario
FROM Products;

--4. Muestra ProductID, ProductName, UnitsInStock.

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion,
	UnitsInStock AS Inventario
FROM Products;

--5. Lista todos los clientes mostrando nombre de empresa y país.

SELECT 
	CompanyName AS Nombre,
	Country AS Pais
FROM Customers;

--6. Muestra empleados con nombre y apellido en columnas separadas.
	
SELECT 
	EmployeeID AS EmpleadoID,
	FirstName AS Nombre,
	LastName AS Apellido
FROM Employees;

--7. Muestra empleados con nombre completo (sin CONCAT).

SELECT 
	FirstName+' '+LastName AS NombreCompleto
FROM Employees;

--8. Lista todos los proveedores.

SELECT	
	SupplierID AS SuplidorID,
	CompanyName AS Nombre,
	ContactTitle AS Cargo,
	Address AS Direccion ,
	City AS Ciudad,
	PostalCode AS CodigoPostal,
	Country AS Pais,
	Phone AS Telefono
FROM Suppliers;

--🟢 BLOQUE 2: WHERE (FILTROS SIMPLES)

--9. Productos con precio mayor a 20.

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion,
	UnitPrice AS PrecioUnitario
FROM Products
WHERE UnitPrice >= 20;

--10. Productos con precio menor o igual a 10.

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion,
	UnitPrice AS PrecioUnitario
FROM Products
WHERE UnitPrice <= 10;

--11. Clientes que viven en USA.

SELECT 
	CustomerID AS ClienteID,
	CompanyName AS Nombre,
	Country AS Pais
FROM Customers 
WHERE Country = 'USA';

--12. Empleados que viven en London.

SELECT 
	EmployeeID AS EmpleadoID,
	FirstName AS Nombre,
	LastName AS Apellido,
	City AS Ciudad
FROM Employees 
WHERE City = 'London';

--13. Productos con UnitsInStock igual a 0.

SELECT 
	ProductID AS Codigo,
	ProductName AS descripcion,
	UnitPrice AS PrecioUnitario,
	UnitsInStock AS Inventario
FROM Products
WHERE UnitsInStock = 0;

--14. Órdenes con Freight mayor a 50.

SELECT 
	OrderID AS Ordenes,
	CustomerID AS Cliente,
	OrderDate AS FechaOrden,
	YEAR(OrderDate) AS Anio,
	MONTH(OrderDate) AS Mes,
	DAY(OrderDate) AS Dia,
	Freight AS Flete
FROM Orders
WHERE Freight > 50;

--15. Órdenes realizadas después de 1997-01-01.

SELECT 
	OrderID AS OrdenID,
	CustomerID AS ClienteID,
	OrderDate AS FechaOrden
FROM Orders
WHERE OrderDate > '1997-01-01';

--16. Productos cuyo nombre sea exactamente "Chai".

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion
FROM Products
WHERE ProductName = 'Chai';

--17. Clientes cuyo país NO sea Germany.

SELECT 
	CustomerID AS ClienteID,
	CompanyName AS Empresa,
	Country AS Pais
FROM Customers
WHERE Country NOT IN ('Germany');

--🟢 BLOQUE 3: OPERADORES LÓGICOS

--18. Productos con precio entre 10 y 30.

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion,
	UnitPrice AS PrecioUnitario
FROM Products
WHERE UnitPrice BETWEEN 10 AND 30;

--19. Productos con precio mayor a 20 y stock mayor a 0.

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion,
	UnitPrice AS PrecioUnitario,
	UnitsInStock AS Inventario
FROM Products
WHERE UnitPrice > 20 AND UnitsInStock > 0;

--20. Clientes de USA o Canada.

SELECT 
	CustomerID AS ClienteID,
	CompanyName AS Empresa,
	ContactName AS Contacto,
	Country AS Pais
FROM Customers
WHERE Country = 'Canada' OR Country = 'USA';

--21. Órdenes con Freight entre 20 y 60.

SELECT 
	OrderID AS Ordenes,
	CustomerID AS ClienteID,
	Freight AS Flete
FROM Orders
WHERE Freight BETWEEN 20 AND 60;

--22. Empleados de London y con cargo “Sales Representative”.

SELECT 
	EmployeeID AS EmpleadoID,
	CONCAT(FirstName,' ',LastName) AS NombreCompleto,
	Title AS Cargo,
	City AS Ciudad 
FROM Employees
WHERE Title = 'Sales Representative' AND City = 'London';

--23. Productos con stock 0 o en reorder.

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion,
	UnitsInStock AS Inventario,
	UnitsOnOrder AS Reaorden
FROM Products
WHERE UnitsInStock = 0 OR UnitsOnOrder > 0;

--🟢 BLOQUE 4: LIKE, IN, BETWEEN

--24. Clientes cuyo nombre empiece con A.

SELECT 
	CustomerID AS ClienteID,
	CompanyName AS Empresa
FROM Customers
WHERE CompanyName LIKE 'A%';

--25. Clientes cuyo nombre termine en S.

SELECT 
	CustomerID AS ClienteID,
	CompanyName AS Empresa
FROM Customers
WHERE CompanyName LIKE '%s';

--26. Productos que contengan la palabra “cheese”.

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion 
FROM Products
WHERE ProductName LIKE '%Que%'; -- Nota: en Northwind no existen productos con "cheese" en el nombre.
-- Se usa "Que" como aproximación.

--27. Clientes de Germany, France o Spain.

SELECT 
	CustomerID AS ClienteID,
	CompanyName AS Empresa,
	ContactName AS Contacto,
	Country AS Pais
FROM Customers
WHERE Country IN ('Germany','France','Spain');

--28. Órdenes entre 1996 y 1997.

SELECT 
	OrderID AS OrdenID,
	CustomerID AS ClienteID,
	OrderDate AS FechaOrden,
	YEAR(OrderDate) AS Anio,
	MONTH(OrderDate) AS Mes,
	DAY(OrderDate) AS Dia
FROM Orders
WHERE YEAR(OrderDate) IN (1996, 1997);

--29. Productos con categoría 1, 3 o 5.

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion,
	CategoryID AS CategoriaID
FROM Products
WHERE CategoryID IN (1, 3, 5);

--30 Empleados cuyo apellido empiece con B.

SELECT 
	EmployeeID AS EmpleadoID,
	FirstName AS Nombre,
	LastName AS Apellido
FROM Employees
WHERE LastName LIKE 'B%';

--🟢 BLOQUE 5: ORDER BY, TOP

--31. Productos ordenados por precio ascendente.

SELECT 
	ProductID AS Codigo,
	ProductName AS Nombre,
	UnitPrice AS PrecioUnitario
FROM Products
ORDER BY PrecioUnitario ASC;

--32. Productos ordenados por precio descendente.

SELECT 
	ProductID AS Codigo,
	ProductName AS Nombre,
	UnitPrice AS PrecioUnitario
FROM Products
ORDER BY PrecioUnitario DESC;

--33. Clientes ordenados por país.

SELECT 
	CustomerID ClienteID, 
	CompanyName AS Empresa,
	Country AS Pais
FROM Customers
ORDER BY Pais ASC;

--34. Órdenes ordenadas por fecha más reciente.

SELECT 
	OrderID AS OrdenID,
	CustomerID AS ClienteID,
	OrderDate AS FechaOrden
FROM Orders
ORDER BY FechaOrden DESC;

--35. Top 5 productos más caros.

SELECT TOP 5
	ProductID AS Codigo,
	ProductName AS Descripcion,
	UnitPrice AS PrecioUnitario
FROM Products
ORDER BY PrecioUnitario DESC;

--36. Top 10 órdenes con mayor flete.

SELECT TOP 10
	OrderID AS OrdenID,
	CustomerID AS ClienteID,
	OrderDate AS FechaOrden,
	Freight AS Flete
FROM Orders
ORDER BY Flete DESC;

--37. Primeros 3 clientes alfabéticamente.

SELECT TOP 3
	CustomerID AS ClienteID,
	CompanyName AS Empresa,
	Country AS Pais
FROM Customers 
ORDER BY Empresa ASC;

--🟢 BLOQUE 6: DISTINCT, NULL

--38. Lista países únicos de clientes.

SELECT DISTINCT COUNTRY
FROM Customers;

--39. Lista ciudades únicas de empleados.

SELECT DISTINCT City
FROM Employees;

--40. Órdenes que no han sido enviadas.

SELECT 
	OrderID AS OrdenID,
	CustomerID AS ClienteID,
	OrderDate AS FechaOrden,
	ShippedDate AS FechaEntrega
FROM Orders
WHERE ShippedDate IS NULL
ORDER BY OrdenID ASC;

--41. Órdenes con fecha de envío.

SELECT 
	OrderID AS OrdenID,
	CustomerID AS ClienteID,
	OrderDate AS FechaOrden,
	ShippedDate AS FechaEntrega
FROM Orders
WHERE ShippedDate IS NOT NULL
ORDER BY OrdenID ASC;


--42. Productos sin proveedor asignado (si existen).

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion,
	SupplierID AS SuplidorID
FROM Products
WHERE SupplierID IS NULL; --TODAS TIENEN SUPLIDOR

--43. Clientes sin región.

SELECT
	CustomerID AS ClienteID,
	CompanyName AS Empresa,
	Region
FROM Customers
WHERE Region IS NULL
ORDER BY ClienteID ASC;

--🟢 BLOQUE 7: FUNCIONES DE AGREGACIÓN

--44. Cantidad total de productos.

SELECT 
	COUNT(*) AS TotalProductos
FROM Products;

--45. Precio promedio de productos.

SELECT 
	AVG(UnitPrice) AS PromedioProductos
FROM Products;

--46. Precio más alto.

SELECT
	MAX(UnitPrice) AS PrecioMasCaro
FROM Products;

--47. Precio más bajo.

SELECT
	MIN(UnitPrice) AS PrecioMasBajo
FROM Products;

--48. Total de órdenes.
	
SELECT 
	COUNT(*) AS TotalOrdenes
FROM Orders;

--49. Total de clientes.

SELECT 
	COUNT(*) AS TotalClientes
FROM Customers;

--50. Total de empleados.

SELECT 
	COUNT(*) AS TotalEmpleados
FROM Employees;

--51. Total de productos con stock 0.

SELECT 
	COUNT(UnitsInStock) AS TotalProductosAgotados
FROM Products
WHERE UnitsInStock = 0;

--🟢 BLOQUE 8: GROUP BY (SIN JOIN)

--52. Cantidad de productos por categoría.
	
SELECT 
	CategoryID AS CategoriaID,
	COUNT(ProductID) AS ProductosPorCategoria
FROM Products 
GROUP BY CategoryID
ORDER BY CategoriaID ASC;

--53. Cantidad de productos por proveedor.

SELECT 
	SupplierID AS Empresa,
	COUNT(ProductID) AS ProductosPorSuplidor
FROM Products 
GROUP BY SupplierID
ORDER BY Empresa ASC;

--54. Cantidad de clientes por país.

SELECT 
	Country AS Pais,
	COUNT(CustomerID) AS TotalClientes
FROM Customers 
GROUP BY Country
ORDER BY Pais ASC;

--55. Cantidad de empleados por ciudad.

SELECT
	City AS Ciudad,
	COUNT(EmployeeID) AS TotalEmpleados
FROM Employees 
GROUP BY City
ORDER BY Ciudad ASC;

--56. Cantidad de órdenes por año.

SELECT 
	YEAR(OrderDate) AS FechaOrden,
	COUNT(OrderID) AS TotalOrdenes
FROM Orders 
GROUP BY YEAR(OrderDate)
ORDER BY FechaOrden ASC;

--57. Cantidad de órdenes por cliente.

SELECT 
	CustomerID AS ClienteID,
	COUNT(OrderID) AS TotalOrdenes
FROM Orders
GROUP BY CustomerID
ORDER BY TotalOrdenes DESC;

--58. Promedio de precio por categoría.

SELECT 
	CategoryID AS CategoriaID,
	AVG(UnitPrice) AS PromedioPorCategoria
FROM Products 
GROUP BY CategoryID
ORDER BY CategoriaID ASC;

--59. Total de stock por categoría.

SELECT 
	CategoryID AS CategoriaID,
	SUM(UnitsInStock) AS TotalPorCategoria
FROM Products 
GROUP BY CategoryID
ORDER BY CategoriaID ASC;

--60. Total de órdenes por empleado.

SELECT 
	EmployeeID AS EmpleadoID,
	COUNT(OrderID) AS TotalOrdenes
FROM Orders 	
GROUP BY EmployeeID
ORDER BY EmpleadoID ASC;

--🟢 BLOQUE 9: CASE (BÁSICO)

--61. Clasifica productos:

--Stock Alto (>20)

--Stock Bajo (1–20)

--Agotado (0)

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion,
	UnitPrice AS PrecioUnitario,
	UnitsInStock AS Inventario,
	CASE
		WHEN UnitsInStock > 20 THEN 'Stock Alto'
		WHEN UnitsInStock BETWEEN 1 AND 20 THEN 'Stock Bajo'
		ELSE 'Agotado'
	END AS Estatus
FROM Products
ORDER BY Estatus ASC;

--62. Muestra cantidad de productos por estado de stock.

SELECT 
	CASE
		WHEN UnitsInStock > 20 THEN 'Stock Alto'
		WHEN UnitsInStock BETWEEN 1 AND 20 THEN 'Stock Bajo'
		ELSE 'Agotado'
	END AS Estatus,
	COUNT(ProductID) AS Total
FROM Products
GROUP BY 
	CASE
		WHEN UnitsInStock > 20 THEN 'Stock Alto'
		WHEN UnitsInStock BETWEEN 1 AND 20 THEN 'Stock Bajo'
		ELSE 'Agotado'
	END
ORDER BY Estatus ASC;

--63. Clasifica órdenes por flete:

--Bajo

--Medio

--Alto

SELECT 
	OrderID AS OrdenID,
	Freight AS Flete,
	CASE 
		WHEN Freight > (SELECT AVG(Freight) * 1.25 FROM Orders) THEN 'Alto'
		WHEN Freight BETWEEN 
				(SELECT AVG(Freight) * 0.75 FROM Orders)
			AND (SELECT AVG(Freight) * 1.25 FROM Orders) THEN 'Medio'
		ELSE 'Bajo'
	END AS Valoracion
FROM Orders
ORDER BY Valoracion ASC;


--64. Clasifica productos por precio.

SELECT 
	ProductID AS Codigo,
	ProductName AS Descripcion,
	UnitPrice AS PrecioUnitario,
	CASE 
		WHEN UnitPrice > 100 THEN 'Caro'
		WHEN UnitPrice > 50 THEN 'Asequible'
		ELSE 'Barato'
	END AS ClasificacionPrecio
FROM Products
ORDER BY PrecioUnitario DESC;

--🟢 BLOQUE 10: JOIN BÁSICOS

--65. Productos con nombre de categoría.

SELECT 
	p.ProductID AS Codigo,
	p.ProductName AS DescripcionProducto,
	c.CategoryName AS NombreCategoria
FROM Products p
INNER JOIN Categories c
	ON p.CategoryID = c.CategoryID
ORDER BY Codigo ASC;

--66. Productos con nombre de proveedor.

SELECT 
	p.ProductID AS Codigo,
	p.ProductName AS DescripcionProducto,
	s.CompanyName AS EmpresaCategoria
FROM Products p
JOIN Suppliers s
	ON p.SupplierID = s.SupplierID
ORDER BY Codigo ASC;

--67. Órdenes con nombre del cliente.

SELECT 
	o.OrderID AS OrdenID, 
	c.CompanyName AS Empresa
FROM Orders o
INNER JOIN Customers c
	ON o.CustomerID = c.CustomerID
ORDER BY OrdenID ASC;

--68. Órdenes con nombre del empleado.

SELECT 
	o.OrderID AS OrdenID, 
	CONCAT(e.FirstName,' ',e.LastName) AS Nombre
FROM Orders o
INNER JOIN Employees e
	ON o.EmployeeID = e.EmployeeID
ORDER BY OrdenID ASC;

--69. Órdenes con nombre del transportista.

SELECT 
	o.OrderID AS OrdenID, 
	s.CompanyName AS Empresa
FROM Orders o
INNER JOIN Shippers s
	ON o.ShipVia = s.ShipperID
ORDER BY OrdenID ASC;

--70. Empleados con nombre del jefe.

SELECT 
    e.EmployeeID AS EmpleadoID,
    CONCAT(e.FirstName, ' ', e.LastName) AS NombreEmpleado,
    e.Title AS Cargo,
    CONCAT(s.FirstName, ' ', s.LastName) AS Supervisor
FROM Employees e
LEFT JOIN Employees s
    ON e.ReportsTo = s.EmployeeID
ORDER BY EmpleadoID ASC;

--71. Productos vendidos con su cantidad.

SELECT 
	p.ProductID AS ProductosVendido,
	p.ProductName AS Descripcion,
	SUM(od.Quantity) AS TotalVendido
FROM [Order Details] od
INNER JOIN Products p
	ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalVendido DESC;

--🟢 BLOQUE 11: JOIN + GROUP BY

--72. Total de órdenes por cliente (ordenado de mayor a menor).

SELECT
	c.CustomerID AS ClienteID,
	c.CompanyName AS Empresa,
	COUNT(o.OrderID) AS TotalOrdenes
FROM Orders o
JOIN Customers c
	ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CompanyName 
ORDER BY TotalOrdenes DESC;

--73. Total de ventas por empleado.

SELECT 
	o.EmployeeID AS EmpleadoID,
	SUM(od.UnitPrice * od.Quantity) AS MontoTotalVendido,
	ROUND(SUM(od.UnitPrice * od.Quantity * (1.0 - od.Discount)),2) AS TotalNeto
FROM Orders o
INNER JOIN [Order Details] od
	ON o.OrderID = od.OrderID
GROUP BY o.EmployeeID
ORDER BY o.EmployeeID ASC;

--74. Total de productos vendidos por producto.

SELECT 
	p.ProductID AS Codigo,
	p.ProductName AS Descripcion,
	SUM(od.Quantity) AS CantidadTotal
FROM [Order Details] od
JOIN Products p
	ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName;

--75. Total de ventas por categoría.

SELECT 
	c.CategoryID AS CategoriaID,
	c.CategoryName AS Nombre,
	SUM(od.UnitPrice * od.Quantity) AS MontoTotal,
	ROUND(SUM(od.UnitPrice * od.Quantity * (1.0 - od.Discount)),2) AS TotalNeto 
FROM [Order Details] od
INNER JOIN Products p
	ON od.ProductID = p.ProductID
INNER JOIN Categories c
	ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY CategoriaID ASC;

--76. Total de órdenes por transportista.

SELECT 
	s.ShipperID AS TransportistaID,
	s.CompanyName AS Empresa,
	COUNT(o.OrderID) AS TotalOrdenes
FROM Orders o
JOIN Shippers s
	ON o.ShipVia = s.ShipperID
GROUP BY s.ShipperID, s.CompanyName;

--77. Total de ventas por cliente.

SELECT 
	o.CustomerID AS ClienteID,
	SUM(od.UnitPrice * od.Quantity) AS MontoTotal,
	ROUND(SUM(od.UnitPrice * od.Quantity * (1.0 - od.Discount)),2) AS TotalNeto
FROM Orders o
INNER JOIN [Order Details] od
	ON o.OrderID = od.OrderID
GROUP BY o.CustomerID
ORDER BY TotalNeto DESC;

--78. Total de ventas por año.

SELECT 
	YEAR(o.OrderDate) AS Anio,
	SUM(od.UnitPrice * od.Quantity) AS MontoTotal,
	ROUND(SUM(od.UnitPrice * od.Quantity * (1.0 - od.Discount)),2) AS TotalNeto
FROM Orders o
INNER JOIN [Order Details] od
	ON o.OrderID = od.OrderID
GROUP BY YEAR(o.OrderDate)
ORDER BY TotalNeto DESC;

--79. Total de ventas por país.

SELECT 
	o.ShipCountry AS PaisDestino,
	SUM(od.UnitPrice * od.Quantity) AS MontoTotal,
	ROUND(SUM(od.UnitPrice * od.Quantity * (1.0 - od.Discount)),2) AS TotalNeto
FROM Orders o
INNER JOIN [Order Details] od
	ON o.OrderID = od.OrderID
GROUP BY o.ShipCountry
ORDER BY TotalNeto DESC;

--🟢 BLOQUE 12: MINI-RETOS

--80. Cliente con más órdenes.

SELECT TOP 1
	c.CustomerID AS ClienteID,
	c.CompanyName AS Empresa,
	COUNT(o.OrderID) AS TotalOrdenes
FROM Customers c
INNER JOIN Orders o
	ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalOrdenes DESC;

--81. Producto más vendido (cantidad).

SELECT TOP 1
	p.ProductID AS Codigo,
	p.ProductName AS Descripcion,
	SUM(od.Quantity) AS Cantidad
FROM Products p
INNER JOIN [Order Details] od
	ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Cantidad DESC;

--82. Categoría más vendida.

SELECT TOP 1
	t.CategoryID AS CategoriaID,
	t.CategoryName AS Nombre,
	SUM(od.Quantity) AS CantidadVendida	
FROM [Order Details] od JOIN (
		SELECT
			p.ProductID,
			c.CategoryID,
			c.CategoryName
		FROM Products p
		INNER JOIN Categories c
			ON p.CategoryID = c.CategoryID)t
			ON t.ProductID = od.ProductID
GROUP BY t.CategoryID, t.CategoryName
ORDER BY CantidadVendida DESC;

--83. Empleado con más ventas.

SELECT TOP 1
	t.EmployeeID AS EmpleadoID,
	CONCAT(t.FirstName,' ',t.LastName) AS Nombre,
	SUM(od.UnitPrice * od.Quantity) AS Total,
	ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),2) AS TotalNeto
FROM [Order Details] od JOIN (
						SELECT 
							e.EmployeeID,
							e.FirstName,
							e.LastName,
							o.OrderID
						FROM Employees e
						INNER JOIN Orders o
							ON o.EmployeeID = e.EmployeeID)t
	ON od.OrderID = t.OrderID
GROUP BY t.EmployeeID, CONCAT(t.FirstName,' ',t.LastName)
ORDER BY TotalNeto DESC;

--84. Año con más ventas.

SELECT TOP 1
	YEAR(o.OrderDate) AS Anio,
	SUM(od.UnitPrice * od.Quantity) AS Total,
	ROUND(SUM(od.UnitPrice * od.Quantity * (1.0 - od.Discount)),2) AS TotalNeto
FROM Orders o
INNER JOIN [Order Details] od
	ON o.OrderID = od.OrderID
GROUP BY YEAR(o.OrderDate) 
ORDER BY TotalNeto DESC;

--85. País con más clientes.

SELECT TOP 1
	Country AS Pais,
	COUNT(CustomerID) AS Total
FROM Customers
GROUP BY Country
ORDER BY Total DESC;
