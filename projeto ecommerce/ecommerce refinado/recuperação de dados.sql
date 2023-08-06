-- recuperação de dados
USE ecommerce_refinado;

-- recupera todos dados de clientes
SELECT * FROM clients;

-- recupera todos clientes registrados como pf
SELECT * FROM clients, pf WHERE pf_idClients = idClients;

--  recupera o id do client, primeiro nome e o numero de pedido, e cria grupos usando id do cliente
SELECT c.idClients, Fname, count(*) AS number_of_orders FROM clients c 
		INNER JOIN orders o ON c.idClients = o.Orders_idClients
		INNER JOIN OrdersProducts as po ON po.ordProd_idOrders = o.idOrders
	GROUP BY c.idClients
;

-- recupera o idPayment, o status do pedido, o nome do produto, o valor do produto vezes a quantidade, o valor do frete e 
-- a suma do valor do produto e do frete, de produtos que já foram enviados
SELECT pa.idPayments, d.statusDelivery,  pro.Pname, (op.Quantity * pro.Pvalue) AS P_Total_value, d.sendValue, round(((op.Quantity * pro.Pvalue) + d.sendValue), 2) AS total_value FROM delivery d, OrdersProducts op
	INNER JOIN payments pa, products pro
    WHERE d.delivery_idPayment = pa.idPayments AND pa.payment_idOrdProd = op.idOrdProd AND pro.idProducts = op.OrdProd_idProducts
	HAVING d.statusDelivery = 'Enviado'
;

--  recupera o nome completo, o nome do produto, quantidade comprada de cada produto e o valor total do pedido
SELECT concat(Fname, ' ', Minit, ' ', Lname) AS Full_Name, p.Pname AS Product_Name, op.Quantity, (p.Pvalue * op.Quantity) AS total_value
	FROM clients c, Orders o, products p, OrdersProducts op
		WHERE c.idClients = o.Orders_idClients AND 
        o.idOrders = op.ordProd_idOrders AND p.idProducts = op.ordProd_idProducts
        ORDER BY Full_Name
;

-- Fornecedores que também são vendedor
SELECT sup.SocialName, se.abstName, sup.CNPj, Location FROM supplier sup, seller se 
	WHERE sup.CNPJ = se.CNPJ
;

-- relação nome do fornecedor e nome do Produto
SELECT p.Pname, p.idProducts, s.SocialName, s.CNPJ, s.contact FROM products  p
		INNER JOIN supProducts AS ps ON ps.SupProd_idProducts = p.idProducts
		INNER JOIN Supplier AS s ON ps.SupProd_idStor = s.idSupplier
;
        
-- relação vendedor e produto
SELECT * FROM selProducts AS prod, products AS p WHERE p.idProducts = prod.SelProd_idProducts;
