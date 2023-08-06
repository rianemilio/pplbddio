-- inserção dos dados
USE ecommerce_refinado;

-- idClients, Fname, Minit, Lname, Adress
INSERT INTO clients (Fname, Minit, Lname, Adress) VALUES 
	('João', 'M', 'Silva', 'Rua das Flores, 123'),
	('Maria', 'A', 'Santos', 'Avenida das Palmeiras, 456'),
	('Pedro', 'L', 'Oliveira', 'Travessa dos Pássaros, 789'),
	('Ana', 'C', 'Pereira', 'Praça das Montanhas, 101'),
	('Carlos', 'E', 'Almeida', 'Alameda das Estrelas, 222'),
    ('Alice', 'C', 'Rodrigues', 'Rua das Margaridas, 456'),
	('Bruno', 'S', 'Fernandes', 'Avenida das Acácias, 123'),
	('Carolina', 'L', 'Silveira', 'Travessa das Oliveiras, 789'),
	('Diego', 'A', 'Albuquerque', 'Praça dos Ipês, 101'),
	('Eduarda', 'M', 'Gomes', 'Alameda das Orquídeas, 222')
;

-- pf
-- idPF, CPF, PF_idClients
INSERT INTO pf (CPF, PF_idClients) VALUES 
	(30261016478, 1),
	(56063368645, 2), 
	(96975080805, 3), 
	(35553613090, 4), 
	(54503519977, 5), 
	(48072906739, 8), 
	(53653190633, 9), 
	(45616331221, 10)
;

-- pj
-- idPJ, CNPJ, PJ_idClients
INSERT INTO pj (CNPJ, PJ_idClients) VALUES 
	(89219786095069, 6), 
    (35160334526775, 7)
;

-- orders
-- idOrders, Orders_idClients
INSERT INTO orders (Orders_idClients) VALUES 
	(1), 
	(3), 
	(4), 
	(5), 
	(6), 
	(7), 
	(9), 
	(10) 
;

-- products
-- idProducts, category, amount
INSERT INTO products (Pname, category, Pvalue) VALUES
	('Camiseta', 'Vestuário', 50), 
	('Notebook', 'Eletrônicos', 200), 
	('Livro', 'Papelaria', 10), 
	('Tênis', 'Calçados', 300), 
	('Mochila', 'Acessórios', 100), 
	('Bolsa', 'Acessórios', 200), 
	('Bicicleta', 'Esportes', 3000), 
	('Relógio', 'Acessórios', 300), 
	('Cafeteira', 'Eletrodomésticos', 1200) 
;

-- supplier
-- idSupplier, SocialName, CNPJ, contact
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
	('Alpha Tech Soluções Ltda.', 42459050753287, 97383982099),
	('Gama Ltda.', 79820384937723, 89459413503), 
	('Épsilon Moda e Acessórios Ltda.', 65399827990090, 27740467570) 
;

-- storages
-- idStorage, location
INSERT INTO storages (Location) VALUES 
	('Rua das Margaridas, 789, Cidade K'), 
	('Avenida das Violetas, 753, Cidade L'), 
	('Travessa dos Girassóis, 987, Cidade M'), 
	('Praça das Rosas, 246, Cidade N') 
;

-- seller
-- idSeller, SocialName, abstName, CNPJ, CPF, Location, contact
INSERT INTO seller (SocialName, abstName, CNPJ, CPF, Location, contact) VALUES 
('Alpha Tech Soluções Ltda.', 'Tech Solutions', 42459050753287, NULL, 'Avenida do Dinheiro, 999',97383982099),
('Empresa ABC Ltda.', 'TecnoTech', NULL, 50161042286, 'Rua dos Inventores, 123', 64024103653),
('Comércio XYZ Ltda.', 'SuperAlimentos', 81911275716520, 87791510301,'Avenida das Frutas, 456', 74285582903),
('Serviços 123 Ltda.', 'VitalCare', 23005048388151, NULL ,'Praça da Saúde, 101', 20020246994),
('Modas LTDA.', 'FashionCity', 85479483731949, 51703777646,'Alameda da Moda, 222', 21952219925),
('Engenharia OPQ Ltda.', 'InovaTech', 87496610311722, 44534515867,'Avenida da Engenharia, 777', 95340590046),
('Transportes RST Ltda.', 'ExpressLog', 97237418251242, NULL, 'Rua das Cargas, 888', 55950671134)
;

-- OrdersProducts
-- idOrdProd, ordProd_idOrders, ordProd_idProducts, Quantity
INSERT INTO OrdersProducts (ordProd_idOrders, ordProd_idProducts, Quantity) VALUES 
(1, 1, 4),
(1, 5, 3),
(2, 1, 2),
(2, 8, 1),
(3, 6, 2),
(3, 9, 1),
(4, 7, 2),
(5, 9, 5),
(6, 9, 3),
(7, 5, 3), 
(7, 2, 1),
(7, 4, 2),
(8, 2, 7)
;

-- payments
-- idPayments, paymentType('Boleto','Cartão','Dois Cartões'), payment_idOrdProd
INSERT INTO payments (paymentType, payment_idOrdProd) VALUES 
('Cartão', 1),
('Cartão', 2),

('Cartão', 3),
('Cartão', 4),

('Boleto', 5),
('Boleto', 6),

('Cartão', 7),

('Cartão', 8),

('Dois Cartões', 9),

('Cartão', 10),
('Cartão', 11),
('Cartão', 12),

('Boleto', 13)
;

-- cards
-- cardNumber, cvv, expirationDate, flag, cards_idPayments
INSERT INTO cards (cardNumber, cvv, expirationDate, flag, cards_idPayments) VALUES 
(1064780732135086, 162, '09/25', 'Visa', 1),
(1064780732135086, 162, '09/25', 'Visa', 2),

(5474392827716181, 509 , '05/26', 'Mastercard', 3),
(5474392827716181, 509 , '05/26', 'Mastercard', 4),

(3046366596797316, 389, '12/27', 'American Express', 7),

(1985996947157014, 817, '03/28', 'Discover', 8),

(6936150812272579 , 524, '06/24', 'Visa', 9),
(4199100398511217 , 156, '09/24', 'Visa', 9),

(2419820974320671 , 483, '11/25', 'Mastercard', 10),
(2419820974320671 , 483, '11/25', 'Mastercard', 11),
(2419820974320671 , 483, '11/25', 'Mastercard', 12)
;

-- delivery
-- delivery_idPayment, statusDelivery ('Preparando', 'Enviado', 'Entregue'), sendValue, trackingCode
INSERT INTO delivery (delivery_idPayment, statusDelivery, sendValue, trackingCode) VALUES 
(1, 'Preparando', 36.0, '3G64T9NKDHXV8EYC7LAP'),
(2, 'Entregue', 54.2, '7R2XWP9DT6VJLMYQ8GZS'),

(3, 'Enviado', 40, 'B9J6TNR7Y5MKH3QX2DZL'),
(4, 'Preparando', 28,'LSVFRAT8M9XN5CE6PHKZ'),

(5, 'Enviado', 19, '7QPT2LGYHX9SRJZVCKMF'),
(6, 'Preparando', 24,'5DGNMT2R9VJKZS8PLHQY'),

(7, 'Entregue', 41, 'TLDHM6K54E9N3P8QJZWX'),

(8, 'Enviado', 24,'RK6ZHQ52JND8PGTX9MLC'),

(9, 'Entregue', 26,'QX6VZMKL9R7Y4P8HTJWF'),

(10, 'Preparando', 24,'VTH6DQYRZ2NLGJMK8WX3'),
(11, 'Entregue', 24,'X4K7Q9R2PDJFN3VGLZWT'),
(12, 'Preparando', 24,'6CMRQTHXVW94NDJLYG7K'),

(13, 'Enviado', 27,'Z8LKNP3XWRH6QJDVT7MF')
;

-- supProducts
-- SupProd_idStor, SupProd_idProducts, SupQuantity
INSERT INTO supProducts (SupProd_idStor, SupProd_idProducts, SupQuantity) VALUES 
(1, 2, 6426),
(4, 5, 4521),
(2, 8, 5317);

-- storProducts
-- StorProd_idStor, StorProd_idProducts, StorQuantity
INSERT INTO storProducts(StorProd_idStor, StorProd_idProducts, StorQuantity) VALUES 
(3, 1, 93150),
(1, 4, 9512),
(2, 7, 5429);

-- selProducts
-- SelProd_idStor, SelProd_idProducts, SelQuantity
INSERT INTO selProducts(SelProd_idStor, SelProd_idProducts, SelQuantity) VALUES 
(2, 3, 10642),
(4, 6, 1046),
(3, 9, 5143);
