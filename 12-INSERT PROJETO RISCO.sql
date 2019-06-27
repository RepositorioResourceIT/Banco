
DELETE FROM ProjetoRisco

DBCC CHECKIDENT ('ProjetoRisco', RESEED,0)

INSERT INTO ProjetoRisco (DescricaoProjetoRisco, DataInclusao, IdUsuarioInclusao)
VALUES ('A iniciar', GETDATE(), 1)
, ('Em andamento', GETDATE(), 1)
, ('Risco de atraso', GETDATE(), 1)
, ('Atrasado', GETDATE(), 1)
, ('Concluído', GETDATE(), 1)