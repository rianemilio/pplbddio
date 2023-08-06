-- criação do modelo refinado

CREATE DATABASE ecommerce_refinado;

USE ecommerce_refinado;

-- cria a tabela cliente
 CREATE TABLE clients(
	idClients INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(45) NOT NULL,
    Minit VARCHAR(3),
    Lname VARCHAR(45) NOT NULL,
    Adress VARCHAR(255) NOT NULL
);

-- cria a tabela para clientes pj
CREATE TABLE pj(
	idPJ INT AUTO_INCREMENT,
    CNPJ CHAR(14) NOT NULL,
    PJ_idClients INT,
    PRIMARY KEY (idPJ, PJ_idClients),
    CONSTRAINT FOREIGN KEY (PJ_idClients) REFERENCES clients(idClients)
);

-- cria a tabela para clientes pf
CREATE TABLE pf(
	idPF INT AUTO_INCREMENT,
    CPF CHAR(11),
    PF_idClients INT,
    PRIMARY KEY (idPF, PF_idClients),
    CONSTRAINT FOREIGN KEY (PF_idClients) REFERENCES clients(idClients)
);

-- 	cria a tabela pedido
CREATE TABLE orders(
	idOrders INT AUTO_INCREMENT,
    orders_idClients INT,
    PRIMARY KEY (idOrders,orders_idClients),
    CONSTRAINT FOREIGN KEY (orders_idClients) REFERENCES clients(idClients)
);

-- cria a tabela produto
CREATE TABLE products(
	idProducts INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    category VARCHAR(45),
    Pvalue FLOAT NOT NULL
);

-- cria a tabela fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(45) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    contact CHAR(11) NOT NULL
);

-- cria a tabela estoque 
CREATE TABLE storages(
	idStorage INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255)
);

-- cria a tabela terceiro - vendedor
CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(60) NOT NULL,
    abstName VARCHAR(45) NOT NULL,
    CNPJ CHAR(14),
    CPF CHAR(11),
    location VARCHAR(255) NOT NULL,
    contact CHAR(11) NOT NULL
);

-- cria a tabela pedido/produto
CREATE TABLE OrdersProducts(
	idOrdProd INT AUTO_INCREMENT,
    ordProd_idOrders INT,
    ordProd_idProducts INT,
    Quantity INT DEFAULT 0,
    PRIMARY KEY (idOrdProd, ordProd_idOrders, ordProd_idProducts),
	CONSTRAINT FOREIGN KEY (ordProd_idOrders) REFERENCES orders(idOrders),
    CONSTRAINT FOREIGN KEY (ordProd_idProducts) REFERENCES products(idProducts)
);

-- cria a tabela formas de pagamento
CREATE TABLE payments(
	idPayments INT AUTO_INCREMENT,
    paymentType ENUM('Boleto','Cartão','Dois Cartões'),
    payment_idOrdProd INT,
    PRIMARY KEY (idPayments, payment_idOrdProd),
	CONSTRAINT FOREIGN KEY (payment_idOrdProd) REFERENCES OrderSProducts(idOrdProd)
);

-- cria a tabela cartões
CREATE TABLE cards(
	cardNumber CHAR(16) NOT NULL,
    cvv CHAR(3) NOT NULL,
	expirationDate CHAR(5) NOT NULL,
    flag VARCHAR(30)NOT NULL,
    cards_idPayments INT,
    CONSTRAINT FOREIGN KEY (cards_idPayments) REFERENCES payments(idPayments)
);

-- cria a tabela entrega
CREATE TABLE delivery(
	delivery_idPayment INT,
    statusDelivery ENUM('Preparando', 'Enviado', 'Entregue') DEFAULT 'Preparando',
    sendValue FLOAT DEFAULT 5,
    trackingCode VARCHAR(20) NOT NULL,
    CONSTRAINT FOREIGN KEY (delivery_idPayment) REFERENCES payments(idPayments)
);

-- cria a tabela Fornecedor Produto
CREATE TABLE supProducts(
	SupProd_idStor INT,
    SupProd_idProducts INT,
    SupQuantity INT DEFAULT 0,
    PRIMARY KEY (SupProd_idStor, SupProd_idProducts),
    CONSTRAINT FOREIGN KEY (SupProd_idStor) REFERENCES storages(idStorage),
	CONSTRAINT FOREIGN KEY (SupProd_idProducts) REFERENCES products(idProducts)
);

-- cria a tabela Produto Em Estoqu
CREATE TABLE storProducts (
	StorProd_idStor INT,
    StorProd_idProducts INT,
    StorQuantity INT DEFAULT 0,
	PRIMARY KEY(StorProd_idStor, StorProd_idProducts),
    CONSTRAINT FOREIGN KEY (StorProd_idStor) REFERENCES storages(idStorage),
	CONSTRAINT FOREIGN KEY (StorProd_idProducts) REFERENCES products(idProducts)
    );

-- cria a tabela Vendedor Produto
CREATE TABLE selProducts (
	SelProd_idStor INT,
    SelProd_idProducts INT,
    SelQuantity INT DEFAULT 0,
    PRIMARY KEY(SelProd_idStor, SelProd_idProducts),
    CONSTRAINT FOREIGN KEY (SelProd_idStor) REFERENCES storages(idStorage),
	CONSTRAINT FOREIGN KEY (SelProd_idProducts) REFERENCES products(idProducts)
);
