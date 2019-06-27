
DELETE FROM ProjetoStatus

DBCC CHECKIDENT ('ProjetoStatus', RESEED,0)

INSERT INTO ProjetoStatus (DescricaoProjetoStatus, DataInclusao, IdUsuarioInclusao)
VALUES ('Em Andamento', GETDATE(), 1)
, ('Pausado', GETDATE(), 1)
, ('Cancelado', GETDATE(), 1)
, ('Desenvolvimento', GETDATE(), 1)
, ('Implantação', GETDATE(), 1)
, ('Homologação', GETDATE(), 1)