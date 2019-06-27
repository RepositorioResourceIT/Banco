
DELETE FROM Assunto

DBCC CHECKIDENT ('Assunto', RESEED,0)


insert into Assunto (NomeAssunto, Ativo) Values('Asuunto 1', 1)
insert into Assunto (NomeAssunto, Ativo) Values('Asuunto 2', 1)
insert into Assunto (NomeAssunto, Ativo) Values('Asuunto 3', 1)
insert into Assunto (NomeAssunto, Ativo) Values('Asuunto 4', 1)
insert into Assunto (NomeAssunto, Ativo) Values('Asuunto 5', 1)