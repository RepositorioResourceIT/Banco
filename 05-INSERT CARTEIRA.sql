Delete from Carteira

DBCC CHECKIDENT ('Carteira', RESEED,0)

insert into Carteira(NomeCarteira) Values('Carteira 1')
insert into Carteira(NomeCarteira) Values('Carteira 2')
insert into Carteira(NomeCarteira) Values('Carteira 3')
insert into Carteira(NomeCarteira) Values('Carteira 4')