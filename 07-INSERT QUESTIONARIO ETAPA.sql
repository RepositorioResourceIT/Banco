delete from QuestionarioEtapa

DBCC CHECKIDENT ('QuestionarioEtapa', RESEED,0)

insert into QuestionarioEtapa (NomeQuestionarioEtapa) values ('A Iniciar')
insert into QuestionarioEtapa (NomeQuestionarioEtapa) values ('Parametrização')
insert into QuestionarioEtapa (NomeQuestionarioEtapa) values ('Homologação')
insert into QuestionarioEtapa (NomeQuestionarioEtapa) values ('Treinamento')
insert into QuestionarioEtapa (NomeQuestionarioEtapa) values ('Implantação')
