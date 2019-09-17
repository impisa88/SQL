create table itens_pedido(
		Quantidade int, 
		Valor_unitario int, 
		ID_Pedidos INT,
		ISBN INT, 
		PRIMARY KEY(ISBN, ID_Pedidos),
		FOREIGN KEY (ISBN)
		REFERENCES Livros(ISBN),
		FOREIGN KEY (ID_Pedidos)		
		REFERENCES Pedidos(ID_Pedidos))
		
create TABLE Compra (
		ID_cliente INT, 
		ID_Pedidos INT,
		PRIMARY KEY(ID_cliente,ID_Pedidos),
		FOREIGN KEY(ID_cliente)
		REFERENCES Clientes(ID_cliente),
		FOREIGN KEY (ID_Pedidos)		
		REFERENCES Pedidos(ID_Pedidos),
		UNIQUE (ID_Pedidos))
		

create TABLE Mora_em (
		ID_endereco char(50), 
		ID_cliente INT,
		PRIMARY KEY(ID_endereco,ID_cliente),
		FOREIGN KEY(ID_endereco) REFERENCES Endereco(ID_endereco),
		FOREIGN KEY(ID_cliente) REFERENCES Clientes(ID_cliente)
		ON DELETE CASCADE ON UPDATE NO ACTION)
		
--drop table Mora_em -- by Elvis