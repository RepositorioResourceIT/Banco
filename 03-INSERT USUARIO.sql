DELETE FROM Usuario

DBCC CHECKIDENT ('Usuario', RESEED,0)

insert into Usuario(Nome,Funcional,RACF,Senha,Email,Telefone,Cargo,Ativo,Master,DataInclusao,DataUltimaUtilizacao,IdArea,IdPerfil,Terceiro,IdUsuarioPai)
values('Administrador','0000000000', 'RACFTESTE', '%$#¨%$**$$','reinaldo@itau-correio.com', '0000000000','Coordenador', 1,1, GETDATE(),GETDATE(), 1,1,1,null)
