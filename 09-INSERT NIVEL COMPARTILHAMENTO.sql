
DELETE FROM NivelCompartilhamento

DBCC CHECKIDENT ('NivelCompartilhamento', RESEED,0)


INSERT INTO NivelCompartilhamento (Descricao, DataInclusao, IdUsuarioInclusao)
VALUES ('TODOS', GETDATE(), 1)
, ('GERENCIAS', GETDATE(), 1)