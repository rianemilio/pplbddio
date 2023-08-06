-- inserção dos dados

use ecommerce;

-- idClient, Fname, Minit, Lname, CPF, Adress
INSERT INTO clients(Fname, Minit, Lname, CPF, Adress) VALUES 
('John', 'A', 'Doe', 12345678901, 'Main St, Anytown, EUA'),
('Emily', 'M', 'Johnson', '98765432109', '456 Elm Ave, Someville, EUA'),
('Michael', 'J', 'Smith', '24681357902', '789 Oak Rd, Nowville, EUA'),
('Sarah', 'R', 'Williams', '13579246802', '101 Pine St, Anytown, EUA'),
('David', 'L', 'Brown', '86420975132', '222 Maple Ln, Someville, EUA'),
('John', 'D', 'Smith', 78901234567, '123 Main St, Cityville');

-- idProduct, Pname, classification_kids, category, rating, size
INSERT INTO products(Pname, classification_kids, category, rating, size) VALUES
('Urso de Pelúcia' , True, 'Brinquedos' ,4 , '30 cm,'),
('Fone Bluetooth' , False, 'Eletrônico' ,4.2 , '15 cm'),
('Vestido de Festa ', False, 'Vestimenta' ,5 , '110 cm'),
('Biscoitos' , True, 'Alimentos' , 4.2, '5 cm'),
('Cadeira' , False, 'Móveis' , 4.8, '80 cm');

-- idOrder, Order_idCliente, orderStatus, orderDescription, SendValue, paymentCash
INSERT INTO orders(Order_idCliente, orderStatus, orderDescription, SendValue, paymentCash) VALUES
(1,'Em Processamento','compra realizada pelo celular', 53.0, false),
(2, 'Confirmado', null, 100.42, false),
(3, 'Cancelado', null, 65.62, false),
(4, 'Confirmado', null, 20.58, True),
(5, 'Confirmado', null, 28.52, false);

-- idPayment, typePayment ,limitAvailable ,validity ,payment_idClient ,payment_idOrders
INSERT INTO payments(typePayment ,limitAvailable ,validity ,payment_idClient ,payment_idOrders) VALUES
('Dois Cartões', 10000.0, '08/32', 1, 1),
('Cartão', 4000.0, '05/29', 2, 5),
('Cartão', 6000.0, '06/29', 3, 2),
('Cartão', 5000.0, '04/33', 4, 3),
('Boleto', null, null, 5, 4);


-- idSupplier, SocialName, CNPJ, Contact
INSERT INTO Supplier (SocialName, CNPJ, Contact) VALUES
('Empresa ABC Ltda.', 123456789012345, 9876543219),
('Comércio XYZ S/A', 987654321098765, 45678912345),
('Indústria 123 Ltda.' , 543216789012345, 10293847560),
('Serviços ABCD Eireli' , 456789012345678, 56789012345);

-- idSeller, SocialName, AbstName, CNPJ, CPF, Location, Contact
INSERT INTO Seller(SocialName, AbstName, CNPJ, CPF, Location, Contact) VALUES 
('Empresa ABC Ltda.', 'ABC Store', 123456789012345, 98765443109, 'Nova York, EUA', 9876543219),
('Comércio XYZ S/A', 'XYZ Shop', 987654321098765, 45678915345, 'Los Angeles, EUA', 45678912345),
('Indústria Global Ltda.', 'Global Industries', 543216789012365, 10295347560, 'Londres, Reino Unido', 86420954132),
('Serviços International Eireli', 'International Solutions', 456789012345653, 56659012345, 'Paris, França', 97148523690);

-- IdStorage, Location, Quantity
INSERT INTO productStorage(Location, Quantity) VALUES
('Nova York, EUA' , 7439),
('Tóquio, Japão' , 5121),
('Sydney, Austrália', 8793);

-- idProdSeller, idPproduct, ProdQuantity
INSERT INTO prodSeller(idProdSeller, idPproduct, ProdQuantity) values
(2, 1, 610),
(2, 2, 25142),
(3, 5, 642),
(1, 4, 1431),
(1, 3, 9520);

-- idPOproduct(idProduct), idPOrder(idOrder), PoQuantity, poStatus
INSERT INTO prodOrders(idPOproduct, idPOrder, PoQuantity, poStatus) VALUES 
(1, 1, 3, 'Disponível'),
(2, 5, 2, 'Disponível'),
(3, 4, 2, 'Disponível'),
(4, 3, 0, 'Sem Estoque'),
(5, 2, 1, 'Disponível');

-- idSLproduct(idProduct), idStorageL(IdStorage), Location
INSERT INTO StorageLocation (idSLproduct, idStorageL, Location) VALUES 
(4, 1, 'EUA'),
(3, 1, 'EUA'),
(1, 2, 'Japão'),
(2, 2, 'Japão'),
(5, 3, 'Austrália');

-- idProdSupplier (idSupplier), idProdSupProduct(idProduct), SupQuantity
INSERT INTO prodSupplier (idProdSupplier, idProdSupProduct, SupQuantity) VALUES 
(3, 1, 1423),
(3, 2, 46584),
(1, 3, 15890),
(2, 4, 5132),
(4, 5, 6420);





