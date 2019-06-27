delete from QuestionarioRisco

DBCC CHECKIDENT ('QuestionarioRisco', RESEED,0)

insert into QuestionarioRisco(NomeQuestionarioRisco) Values('A Iniciar')
insert into QuestionarioRisco(NomeQuestionarioRisco) Values('Em andamento')
insert into QuestionarioRisco(NomeQuestionarioRisco) Values('Risco de atraso')
insert into QuestionarioRisco(NomeQuestionarioRisco) Values('Em atraso')
insert into QuestionarioRisco(NomeQuestionarioRisco) Values('Concluídos')