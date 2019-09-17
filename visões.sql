--INSERT into Clientes(ID_cliente, Nome, Email, Senha) VALUES(2,'Greice Laguna', 'greice@asav',2525)
INSERT into Pedidos(ID_Pedidos, data_pedido, data_remesssa) VALUES(1,"2019-08-02", "2019-07-20")

--SELECT * FROM Clientes

drop VIEW Tempo_entrega;

CREATE VIEW Tempo_entrega AS 
	SELECT ID_Pedidos, (julianday(data_pedido) -  julianday(data_remesssa)) as tempo_atendimento FROM Pedidos
	where ID_Pedidos = 1;

SELECT * FROM Tempo_entrega;