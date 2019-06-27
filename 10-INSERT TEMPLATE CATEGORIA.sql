
DELETE FROM TemplateCategoria

DBCC CHECKIDENT ('TemplateCategoria', RESEED,0)

INSERT INTO TemplateCategoria (Nome, Descricao, DataInclusao, IdUsuarioCriacao)
VALUES ('ESPECIFICAÇÃO DE PROJETO', 'Descrição das especificações de projetos', GETDATE(), 1)
, ('PLANILHAS DE CONTROLE DE PROJETO', 'Descrição das planilhas de controle de projetos', GETDATE(), 1)
, ('PLANILHAS DE CRONOGRAMA DE PROJETO', 'Descrição das planilhas de cronogramas de projetos', GETDATE(), 1)