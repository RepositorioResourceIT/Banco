DELETE FROM Area

DBCC CHECKIDENT ('Area', RESEED,0)

INSERT INTO Area (Nome, DataInclusao)
VALUES ('Superintendencia Jur�dica', GETDATE())
, ('Jur�dico', GETDATE())
