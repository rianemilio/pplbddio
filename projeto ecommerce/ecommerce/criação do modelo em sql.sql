-- criação do banco de dados para o cenario de ecommerce
CREATE DATABASE ecommerce;

USE ecommerce;

-- criar tabela cliente
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit VARCHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Adress VARCHAR(30),
    CONSTRAINT unique_cpf_cliente UNIQUE(CPF)
);

-- criar tabela produto
CREATE TABLE products(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(20) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Moveis') NOT NULL, 
    rating FLOAT DEFAULT 0,
    size VARCHAR(10)
);

-- criar tabela pedido
CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    Order_idCliente INT,
    orderStatus ENUM('Cancelado','Confirmado','Em Processamento') DEFAULT 'Em Processamento',
    orderDescription VARCHAR(255),
    SendValue FLOAT DEFAULT 10,
    paymentCash BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_order_id_clients FOREIGN KEY (Order_idCliente) REFERENCES clients(idClient)
);

-- criar tabela pagamento
CREATE TABLE payments(
	idPayment INT AUTO_INCREMENT,
    typePayment ENUM ('Boleto','Cartão','Dois Cartões'),
    limitAvailable FLOAT,
    validity CHAR(5),
    payment_idClient INT,
    payment_idOrders INT,
    PRIMARY KEY (idPayment, payment_idClient, payment_idOrders),
    CONSTRAINT fk_payment_id_client FOREIGN KEY (payment_idClient) REFERENCES orders (order_idCliente),
    CONSTRAINT fk_payment_id_orders FOREIGN KEY (payment_idOrders) REFERENCES orders (idOrder)
);

-- criar tabela Estoque
CREATE TABLE productStorage(
	IdStorage INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(255),
    Quantity INT DEFAULT 0
);

-- criar tabela Fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
	SocialName VARCHAR (255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Contact CHAR(11) NOT NULL,
	CONSTRAINT unique_supplier UNIQUE(CNPJ)
);

-- criar tabela Terceiro - Vendedor
CREATE TABLE seller(	
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
	SocialName VARCHAR (255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(15),	
    CPF CHAR(11),
    Location VARCHAR(255),
    Contact CHAR(11) NOT NULL,
	CONSTRAINT unique_cnpj_supplier UNIQUE(CNPJ),
    CONSTRAINT unique_cpf_supplier UNIQUE(CPF)
);

-- criar tabela Produtos Vendedor
CREATE TABLE prodSeller(
	idProdSeller INT, 
    idPproduct INT,
    ProdQuantity INT DEFAULT 1,
    PRIMARY KEY(idProdSeller, idPproduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idProdSeller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES products(idProduct)
);
-- criar tabela Produto/Pedido
CREATE TABLE prodOrders(
	idPOproduct INT, 
    idPOrder INT,
    PoQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível','Sem Estoque') DEFAULT 'Disponível',
    PRIMARY KEY(idPOproduct, idPOrder),
    CONSTRAINT fk_order_product_seller FOREIGN KEY (idPOproduct) REFERENCES products(idProduct),
    CONSTRAINT fk_order_product_product FOREIGN KEY (idPOrder) REFERENCES orders(idOrder)
);
-- criar tabela Produto em Estoque
CREATE TABLE StorageLocation(
	idSLproduct INT, 
    idStorageL INT,
    Location VARCHAR(255),
    PRIMARY KEY(idSLproduct, idStorageL),
    CONSTRAINT fk_storagelocation_product FOREIGN KEY (idSLproduct) REFERENCES products(idProduct),
    CONSTRAINT fk_storagelocation_storage FOREIGN KEY (idStorageL) REFERENCES productStorage(IdStorage)
);

-- Criar tabela produto fornecedor
CREATE TABLE prodSupplier(
	idProdSupplier INT, 
    idProdSupProduct INT,
    SupQuantity INT NOT NULL,
    PRIMARY KEY(idProdSupplier, idProdSupProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idProdSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idProdSupProduct) REFERENCES products(idProduct)
);
