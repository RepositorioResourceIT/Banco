delete from QuestionarioEtapa

DBCC CHECKIDENT ('QuestionarioEtapa', RESEED,0)

insert into QuestionarioEtapa (NomeQuestionarioEtapa) values ('A Iniciar')
insert into QuestionarioEtapa (NomeQuestionarioEtapa) values ('Parametriza��o')
insert into QuestionarioEtapa (NomeQuestionarioEtapa) values ('Homologa��o')
insert into QuestionarioEtapa (NomeQuestionarioEtapa) values ('Treinamento')
insert into QuestionarioEtapa (NomeQuestionarioEtapa) values ('Implanta��o')
