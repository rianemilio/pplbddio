-- recuperação de dados
USE ecommerce;

-- seleciona todos dados de clientes
SELECT * FROM clients;

-- ordena os dados do client pelo ordem alfabetica do nome dos clientes
SELECT concat(Fname,' ',Minit,' ',Lname) as Complete_Name, idClient, CPF, idOrder, orderStatus 
	FROM orders AS o
		INNER JOIN clients as c 
		WHERE c.idClient = o.Order_idCliente
		ORDER BY Complete_Name;

-- recupera o nome, id, categoria de produtos e estoque de produtos com mais de 4 em sua avaliação e ordena pelo id do produto
SELECT Pname, idProduct, ProdQuantity as Quantity, category, rating FROM prodSeller AS ps, products AS p 
	WHERE ps.idPproduct = p.idProduct
		HAVING p.rating > 4
        ORDER BY p.idProduct;

-- conta o número de clientes
SELECT count(*) AS number_of_clients FROM clients;

-- recupera todas informações relacionadas ao pedido e ao cliente
SELECT * FROM clients c , orders o WHERE c.idClient = o.Order_idCliente;

-- recupera nome completo, id do pedido e status do pedido
SELECT concat(Fname,' ',Minit,' ',Lname) AS Cliente, idOrder, orderStatus FROM clients AS c, orders AS o 
	WHERE c.idClient = o.Order_idCliente;

-- recupera todos os clientes, mesmo aqueles que não fizeram nenhum pedido
SELECT * FROM clients c LEFT OUTER JOIN orders ON c.idClient = Order_idCliente;

-- recupera todas informações que envolvem clients, orders e prodOrders 
SELECT * FROM clients c INNER JOIN orders o ON c.idClient = o.Order_idCliente
			INNER JOIN prodOrders p ON p.idPOrder = o.idOrder;

-- recupera quantas compras foram realizados por pessoa	
SELECT c.idClient, c.Fname, count(*) AS number_of_orders FROM clients c 
		INNER JOIN orders o ON c.idClient = o.Order_idCliente
		INNER JOIN prodOrders p ON p.idPOrder = o.idOrder
	GROUP BY idClient;

-- Algum Vendedor é também fornecedor?
SELECT * FROM Seller sel, Supplier sup WHERE sel.cnpj = sup.cnpj;

-- relação Produto e Vendedor
SELECT * FROM prodSeller AS prod, products AS p WHERE p.idProduct = idPproduct;

-- relação nome do fornecedor e nome do Produto
SELECT p.Pname, p.idProduct, s.SocialName, s.CNPJ, s.contact FROM products AS p
		INNER JOIN prodSupplier AS ps ON idProdSupProduct = p.idProduct
		INNER JOIN Supplier AS s ON ps.idProdSupProduct = s.idSupplier;

-- relação de produtos fornecedor e estoques
SELECT * FROM prodSupplier AS ps 
		INNER JOIN StorageLocation AS strl
	WHERE strl.idSLproduct = ps.idProdSupProduct;