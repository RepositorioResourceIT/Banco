Delete from Carteira

DBCC CHECKIDENT ('Carteira', RESEED,0)

insert into Carteira(NomeCarteira,Ativo) Values('Carteira 1',1)
insert into Carteira(NomeCarteira,Ativo) Values('Carteira 2',1)
insert into Carteira(NomeCarteira,Ativo) Values('Carteira 3',1)
insert into Carteira(NomeCarteira,Ativo) Values('Carteira 4',1)