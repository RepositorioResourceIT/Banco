CREATE TABLE [dbo].[Area] (
    [IdArea] [int] NOT NULL IDENTITY,
    [Nome] [varchar](100) NOT NULL,
    [Descricao] [varchar](100),
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    CONSTRAINT [PK_dbo.Area] PRIMARY KEY ([IdArea])
)
CREATE TABLE [dbo].[Assunto] (
    [IdAssunto] [int] NOT NULL IDENTITY,
    [NomeAssunto] [varchar](100) NOT NULL,
    [DataExclusao] [datetime],
    [Ativo] [bit] NOT NULL,
    CONSTRAINT [PK_dbo.Assunto] PRIMARY KEY ([IdAssunto])
)
CREATE TABLE [dbo].[Carteira] (
    [IdCarteira] [int] NOT NULL IDENTITY,
    [NomeCarteira] [varchar](100) NOT NULL,
    [DataExclusao] [datetime],
    [Ativo] [bit] NOT NULL,
    CONSTRAINT [PK_dbo.Carteira] PRIMARY KEY ([IdCarteira])
)
CREATE TABLE [dbo].[DocumentoPost] (
    [IdDocumentoPost] [int] NOT NULL IDENTITY,
    [Titulo] [int] NOT NULL,
    [Descricao] [varchar](100),
    [DocumentoBin] [varbinary](max) NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    [IdPost] [int] NOT NULL,
    [IdUsuario] [int] NOT NULL,
    CONSTRAINT [PK_dbo.DocumentoPost] PRIMARY KEY ([IdDocumentoPost])
)
CREATE INDEX [IX_IdPost] ON [dbo].[DocumentoPost]([IdPost])
CREATE INDEX [IX_IdUsuario] ON [dbo].[DocumentoPost]([IdUsuario])
CREATE TABLE [dbo].[Post] (
    [IdPost] [int] NOT NULL IDENTITY,
    [Titulo] [varchar](100) NOT NULL,
    [Descricao] [ntext] NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    [Terceiros] [bit] NOT NULL,
    [IdUsuarioCriacao] [int] NOT NULL,
    [IdNivelCompartilhamento] [int] NOT NULL,
    CONSTRAINT [PK_dbo.Post] PRIMARY KEY ([IdPost])
)
CREATE INDEX [IX_IdUsuarioCriacao] ON [dbo].[Post]([IdUsuarioCriacao])
CREATE INDEX [IX_IdNivelCompartilhamento] ON [dbo].[Post]([IdNivelCompartilhamento])
CREATE TABLE [dbo].[NivelCompartilhamento] (
    [IdNivelCompartilhamento] [int] NOT NULL IDENTITY,
    [Descricao] [varchar](100),
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    [IdUsuarioInclusao] [int] NOT NULL,
    CONSTRAINT [PK_dbo.NivelCompartilhamento] PRIMARY KEY ([IdNivelCompartilhamento])
)
CREATE INDEX [IX_IdUsuarioInclusao] ON [dbo].[NivelCompartilhamento]([IdUsuarioInclusao])
CREATE TABLE [dbo].[Usuario] (
    [IdUsuario] [int] NOT NULL IDENTITY,
    [Nome] [varchar](150) NOT NULL,
    [Funcional] [int] NOT NULL,
    [RACF] [varchar](100) NOT NULL,
    [Senha] [varchar](100),
    [Email] [varchar](100),
    [Telefone] [varchar](100),
    [Cargo] [varchar](100) NOT NULL,
    [IdUsuarioPai] [int],
    [Ativo] [bit] NOT NULL,
    [Master] [bit] NOT NULL,
    [Terceiro] [bit] NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    [DataUltimaUtilizacao] [datetime],
    [IdArea] [int] NOT NULL,
    [IdPerfil] [int] NOT NULL,
    CONSTRAINT [PK_dbo.Usuario] PRIMARY KEY ([IdUsuario])
)
CREATE INDEX [IX_IdUsuarioPai] ON [dbo].[Usuario]([IdUsuarioPai])
CREATE INDEX [IX_IdArea] ON [dbo].[Usuario]([IdArea])
CREATE INDEX [IX_IdPerfil] ON [dbo].[Usuario]([IdPerfil])
CREATE TABLE [dbo].[Perfil] (
    [IdPerfil] [int] NOT NULL IDENTITY,
    [Nome] [varchar](150) NOT NULL,
    [Ativo] [bit] NOT NULL,
    [Comportamento] [varchar](100),
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    CONSTRAINT [PK_dbo.Perfil] PRIMARY KEY ([IdPerfil])
)
CREATE TABLE [dbo].[IntegrantesProjeto] (
    [IdIntegranteProjeto] [int] NOT NULL IDENTITY,
    [IdProjeto] [int] NOT NULL,
    [IdUsuarioIntegrante] [int] NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [IdUsuarioInclusao] [int] NOT NULL,
    [IdUsuarioExclusao] [int],
    CONSTRAINT [PK_dbo.IntegrantesProjeto] PRIMARY KEY ([IdIntegranteProjeto])
)
CREATE INDEX [IX_IdProjeto] ON [dbo].[IntegrantesProjeto]([IdProjeto])
CREATE INDEX [IX_IdUsuarioIntegrante] ON [dbo].[IntegrantesProjeto]([IdUsuarioIntegrante])
CREATE INDEX [IX_IdUsuarioInclusao] ON [dbo].[IntegrantesProjeto]([IdUsuarioInclusao])
CREATE INDEX [IX_IdUsuarioExclusao] ON [dbo].[IntegrantesProjeto]([IdUsuarioExclusao])
CREATE TABLE [dbo].[Projeto] (
    [IdProjeto] [int] NOT NULL IDENTITY,
    [NomeProjeto] [varchar](100) NOT NULL,
    [PercentualConclusao] [varchar](100),
    [IdProjetoStatus] [int] NOT NULL,
    [IdRisco] [int] NOT NULL,
    [DataAbertura] [datetime] NOT NULL,
    [DataInicio] [datetime],
    [DataEntega] [datetime],
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    [IdUsuarioExclusao] [int],
    [IdUsuarioInclusao] [int] NOT NULL,
    [IdUsuarioAlteracao] [int],
    [IdUsuarioAnalista] [int],
    [IdUsuarioDesenvolvedor] [int],
    [NumeroOY] [varchar](100),
    [DataFatal] [datetime],
    [DataMuro] [datetime],
    [DataLegal] [datetime],
    [DataTermino] [datetime],
    [DemandaLegal] [bit],
    [IdUsuarioPontoFocal] [int],
    [ProjetoNivelOY] [int] NOT NULL,
    [CustoHoras] [decimal](18, 2),
    [CustoPorHora] [decimal](18, 2),
    [OutrasInformacoes] [varchar](4000),
    CONSTRAINT [PK_dbo.Projeto] PRIMARY KEY ([IdProjeto])
)
CREATE INDEX [IX_IdProjetoStatus] ON [dbo].[Projeto]([IdProjetoStatus])
CREATE INDEX [IX_IdRisco] ON [dbo].[Projeto]([IdRisco])
CREATE INDEX [IX_IdUsuarioExclusao] ON [dbo].[Projeto]([IdUsuarioExclusao])
CREATE INDEX [IX_IdUsuarioInclusao] ON [dbo].[Projeto]([IdUsuarioInclusao])
CREATE INDEX [IX_IdUsuarioAlteracao] ON [dbo].[Projeto]([IdUsuarioAlteracao])
CREATE INDEX [IX_IdUsuarioAnalista] ON [dbo].[Projeto]([IdUsuarioAnalista])
CREATE INDEX [IX_IdUsuarioDesenvolvedor] ON [dbo].[Projeto]([IdUsuarioDesenvolvedor])
CREATE INDEX [IX_IdUsuarioPontoFocal] ON [dbo].[Projeto]([IdUsuarioPontoFocal])
CREATE TABLE [dbo].[ProjetoRisco] (
    [IdProjetoRisco] [int] NOT NULL IDENTITY,
    [DescricaoProjetoRisco] [varchar](100) NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataAlteracao] [datetime],
    [DataExclusao] [datetime],
    [IdUsuarioInclusao] [int] NOT NULL,
    [IdUsuarioAlteracao] [int],
    [IdUsuarioExclusao] [int],
    CONSTRAINT [PK_dbo.ProjetoRisco] PRIMARY KEY ([IdProjetoRisco])
)
CREATE INDEX [IX_IdUsuarioInclusao] ON [dbo].[ProjetoRisco]([IdUsuarioInclusao])
CREATE INDEX [IX_IdUsuarioAlteracao] ON [dbo].[ProjetoRisco]([IdUsuarioAlteracao])
CREATE INDEX [IX_IdUsuarioExclusao] ON [dbo].[ProjetoRisco]([IdUsuarioExclusao])
CREATE TABLE [dbo].[ProjetoStatus] (
    [IdProjetoStatus] [int] NOT NULL IDENTITY,
    [DescricaoProjetoStatus] [varchar](100) NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataAlteracao] [datetime],
    [DataExclusao] [datetime],
    [IdUsuarioInclusao] [int] NOT NULL,
    [IdUsuarioAlteracao] [int],
    [IdUsuarioExclusao] [int],
    CONSTRAINT [PK_dbo.ProjetoStatus] PRIMARY KEY ([IdProjetoStatus])
)
CREATE INDEX [IX_IdUsuarioInclusao] ON [dbo].[ProjetoStatus]([IdUsuarioInclusao])
CREATE INDEX [IX_IdUsuarioAlteracao] ON [dbo].[ProjetoStatus]([IdUsuarioAlteracao])
CREATE INDEX [IX_IdUsuarioExclusao] ON [dbo].[ProjetoStatus]([IdUsuarioExclusao])
CREATE TABLE [dbo].[Parametro] (
    [IdParametro] [int] NOT NULL IDENTITY,
    [Nome] [varchar](150) NOT NULL,
    [Valor] [ntext] NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    CONSTRAINT [PK_dbo.Parametro] PRIMARY KEY ([IdParametro])
)
CREATE TABLE [dbo].[PostComentario] (
    [IdPostComentario] [int] NOT NULL IDENTITY,
    [IdPost] [int] NOT NULL,
    [IdUsuarioComentario] [int] NOT NULL,
    [Descricao] [varchar](4000) NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [IdUsuarioExclusao] [int],
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    CONSTRAINT [PK_dbo.PostComentario] PRIMARY KEY ([IdPostComentario])
)
CREATE INDEX [IX_IdPost] ON [dbo].[PostComentario]([IdPost])
CREATE INDEX [IX_IdUsuarioComentario] ON [dbo].[PostComentario]([IdUsuarioComentario])
CREATE INDEX [IX_IdUsuarioExclusao] ON [dbo].[PostComentario]([IdUsuarioExclusao])
CREATE TABLE [dbo].[PostNivelCompartUsuario] (
    [IdPostNivelCompartUsuario] [int] NOT NULL IDENTITY,
    [IdPost] [int] NOT NULL,
    [IdUsuarioCompartilhado] [int] NOT NULL,
    CONSTRAINT [PK_dbo.PostNivelCompartUsuario] PRIMARY KEY ([IdPostNivelCompartUsuario])
)
CREATE INDEX [IX_IdPost] ON [dbo].[PostNivelCompartUsuario]([IdPost])
CREATE INDEX [IX_IdUsuarioCompartilhado] ON [dbo].[PostNivelCompartUsuario]([IdUsuarioCompartilhado])
CREATE TABLE [dbo].[ProjetoComentario] (
    [IdProjetoComentario] [int] NOT NULL IDENTITY,
    [IdProjeto] [int] NOT NULL,
    [IdUsuarioComentario] [int] NOT NULL,
    [Descricao] [varchar](4000) NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataAlteracao] [datetime],
    [DataExclusao] [datetime],
    [IdUsuarioAlteracao] [int],
    [IdUsuarioExclusao] [int],
    CONSTRAINT [PK_dbo.ProjetoComentario] PRIMARY KEY ([IdProjetoComentario])
)
CREATE INDEX [IX_IdProjeto] ON [dbo].[ProjetoComentario]([IdProjeto])
CREATE INDEX [IX_IdUsuarioComentario] ON [dbo].[ProjetoComentario]([IdUsuarioComentario])
CREATE INDEX [IX_IdUsuarioAlteracao] ON [dbo].[ProjetoComentario]([IdUsuarioAlteracao])
CREATE INDEX [IX_IdUsuarioExclusao] ON [dbo].[ProjetoComentario]([IdUsuarioExclusao])
CREATE TABLE [dbo].[ProjetoHorasTrabalhadas] (
    [IdProjetoHorasTrabalhadas] [int] NOT NULL IDENTITY,
    [IdProjeto] [int] NOT NULL,
    [DataTrabalhada] [datetime] NOT NULL,
    [HorasTrabalhadas] [decimal](18, 2) NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    [IdUsuarioInclusao] [int] NOT NULL,
    [IdUsuarioAlteracao] [int],
    [IdUsuarioExclusao] [int],
    CONSTRAINT [PK_dbo.ProjetoHorasTrabalhadas] PRIMARY KEY ([IdProjetoHorasTrabalhadas])
)
CREATE INDEX [IX_IdProjeto] ON [dbo].[ProjetoHorasTrabalhadas]([IdProjeto])
CREATE INDEX [IX_IdUsuarioInclusao] ON [dbo].[ProjetoHorasTrabalhadas]([IdUsuarioInclusao])
CREATE INDEX [IX_IdUsuarioAlteracao] ON [dbo].[ProjetoHorasTrabalhadas]([IdUsuarioAlteracao])
CREATE INDEX [IX_IdUsuarioExclusao] ON [dbo].[ProjetoHorasTrabalhadas]([IdUsuarioExclusao])
CREATE TABLE [dbo].[QuestionarioDocumentos] (
    [IdQuestionarioDocumentos] [int] NOT NULL IDENTITY,
    [NomeArquivo] [varchar](100) NOT NULL,
    [Descricao] [varchar](100) NOT NULL,
    [NomeOriginal] [varchar](100) NOT NULL,
    [Extensao] [varchar](100) NOT NULL,
    [Tamanho] [int] NOT NULL,
    [ContentType] [varchar](100) NOT NULL,
    [QuestionarioDocumentoBin] [varbinary](max) NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    [IdUsuarioCriacao] [int] NOT NULL,
    [IdUsuarioAlteracao] [int],
    [IdUsuarioExclusao] [int],
    [IdQuestionarioEstrategista] [int] NOT NULL,
    CONSTRAINT [PK_dbo.QuestionarioDocumentos] PRIMARY KEY ([IdQuestionarioDocumentos])
)
CREATE INDEX [IX_IdUsuarioCriacao] ON [dbo].[QuestionarioDocumentos]([IdUsuarioCriacao])
CREATE INDEX [IX_IdUsuarioAlteracao] ON [dbo].[QuestionarioDocumentos]([IdUsuarioAlteracao])
CREATE INDEX [IX_IdUsuarioExclusao] ON [dbo].[QuestionarioDocumentos]([IdUsuarioExclusao])
CREATE INDEX [IX_IdQuestionarioEstrategista] ON [dbo].[QuestionarioDocumentos]([IdQuestionarioEstrategista])
CREATE TABLE [dbo].[QuestionarioEstrategista] (
    [IdQuestionarioEstrategista] [int] NOT NULL IDENTITY,
    [NomeQuestionario] [varchar](100) NOT NULL,
    [DataPriorizacao] [datetime],
    [DataAbertura] [datetime],
    [Prioridade] [int] NOT NULL,
    [NecessarioTreinamento] [bit] NOT NULL,
    [DiasTotais] [int] NOT NULL,
    [Descricao] [varchar](2000) NOT NULL,
    [IdCarteira] [int] NOT NULL,
    [IdAssunto] [int] NOT NULL,
    [IdQuestionarioRisco] [int] NOT NULL,
    [IdResponsavelParametrizacao] [int] NOT NULL,
    [IdResponsavelHomologacao] [int] NOT NULL,
    [IdResponsavelTreinamento] [int],
    [IdResponsavelImplantacao] [int] NOT NULL,
    [IdQuestionarioEtapa] [int] NOT NULL,
    [IdUsuarioCriacao] [int] NOT NULL,
    [IdUsuarioExclusao] [int],
    [IdUsuarioPriorizacao] [int],
    [SLAParametrizacao] [int] NOT NULL,
    [SLAHomologacao] [int] NOT NULL,
    [SLATreinamento] [int],
    [SLAImplantacao] [int] NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    [DataImplantacao] [datetime],
    CONSTRAINT [PK_dbo.QuestionarioEstrategista] PRIMARY KEY ([IdQuestionarioEstrategista])
)
CREATE INDEX [IX_IdCarteira] ON [dbo].[QuestionarioEstrategista]([IdCarteira])
CREATE INDEX [IX_IdAssunto] ON [dbo].[QuestionarioEstrategista]([IdAssunto])
CREATE INDEX [IX_IdQuestionarioRisco] ON [dbo].[QuestionarioEstrategista]([IdQuestionarioRisco])
CREATE INDEX [IX_IdResponsavelParametrizacao] ON [dbo].[QuestionarioEstrategista]([IdResponsavelParametrizacao])
CREATE INDEX [IX_IdResponsavelHomologacao] ON [dbo].[QuestionarioEstrategista]([IdResponsavelHomologacao])
CREATE INDEX [IX_IdResponsavelTreinamento] ON [dbo].[QuestionarioEstrategista]([IdResponsavelTreinamento])
CREATE INDEX [IX_IdResponsavelImplantacao] ON [dbo].[QuestionarioEstrategista]([IdResponsavelImplantacao])
CREATE INDEX [IX_IdQuestionarioEtapa] ON [dbo].[QuestionarioEstrategista]([IdQuestionarioEtapa])
CREATE INDEX [IX_IdUsuarioCriacao] ON [dbo].[QuestionarioEstrategista]([IdUsuarioCriacao])
CREATE INDEX [IX_IdUsuarioExclusao] ON [dbo].[QuestionarioEstrategista]([IdUsuarioExclusao])
CREATE INDEX [IX_IdUsuarioPriorizacao] ON [dbo].[QuestionarioEstrategista]([IdUsuarioPriorizacao])
CREATE TABLE [dbo].[QuestionarioEtapa] (
    [IdQuestionarioEtapa] [int] NOT NULL IDENTITY,
    [NomeQuestionarioEtapa] [varchar](100) NOT NULL,
    CONSTRAINT [PK_dbo.QuestionarioEtapa] PRIMARY KEY ([IdQuestionarioEtapa])
)
CREATE TABLE [dbo].[QuestionarioRisco] (
    [IdQuestionarioRisco] [int] NOT NULL IDENTITY,
    [NomeQuestionarioRisco] [varchar](100) NOT NULL,
    CONSTRAINT [PK_dbo.QuestionarioRisco] PRIMARY KEY ([IdQuestionarioRisco])
)
CREATE TABLE [dbo].[QuestionarioEstrategistaReportQuinzenal] (
    [IdQuestionarioEstrategistaReportQuinzenal] [int] NOT NULL IDENTITY,
    CONSTRAINT [PK_dbo.QuestionarioEstrategistaReportQuinzenal] PRIMARY KEY ([IdQuestionarioEstrategistaReportQuinzenal])
)
CREATE TABLE [dbo].[QuestionarioEstrategistaStatus] (
    [IdQuestionarioEstrategistaStatus] [int] NOT NULL IDENTITY,
    CONSTRAINT [PK_dbo.QuestionarioEstrategistaStatus] PRIMARY KEY ([IdQuestionarioEstrategistaStatus])
)
CREATE TABLE [dbo].[TemplateCategoria] (
    [IdCategoria] [int] NOT NULL IDENTITY,
    [Nome] [varchar](100) NOT NULL,
    [Descricao] [varchar](100) NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    [IdUsuarioCriacao] [int] NOT NULL,
    [IdUsuarioAlteracao] [int],
    [IdUsuarioExclusao] [int],
    CONSTRAINT [PK_dbo.TemplateCategoria] PRIMARY KEY ([IdCategoria])
)
CREATE INDEX [IX_IdUsuarioCriacao] ON [dbo].[TemplateCategoria]([IdUsuarioCriacao])
CREATE INDEX [IX_IdUsuarioAlteracao] ON [dbo].[TemplateCategoria]([IdUsuarioAlteracao])
CREATE INDEX [IX_IdUsuarioExclusao] ON [dbo].[TemplateCategoria]([IdUsuarioExclusao])
CREATE TABLE [dbo].[TemplateDocumento] (
    [IdTemplateDocumento] [int] NOT NULL IDENTITY,
    [IdTemplateCategoria] [int] NOT NULL,
    [NomeArquivo] [varchar](100) NOT NULL,
    [Descricao] [varchar](2000) NOT NULL,
    [NomeOriginal] [varchar](100) NOT NULL,
    [Extensao] [varchar](100) NOT NULL,
    [Tamanho] [int] NOT NULL,
    [ContentType] [varchar](100) NOT NULL,
    [TemplateDocumentoBin] [varbinary](max) NOT NULL,
    [DataInclusao] [datetime] NOT NULL,
    [DataExclusao] [datetime],
    [DataAlteracao] [datetime],
    [IdUsuarioCriacao] [int] NOT NULL,
    [IdUsuarioAlteracao] [int],
    [IdUsuarioExclusao] [int],
    CONSTRAINT [PK_dbo.TemplateDocumento] PRIMARY KEY ([IdTemplateDocumento])
)
CREATE INDEX [IX_IdTemplateCategoria] ON [dbo].[TemplateDocumento]([IdTemplateCategoria])
CREATE INDEX [IX_IdUsuarioCriacao] ON [dbo].[TemplateDocumento]([IdUsuarioCriacao])
CREATE INDEX [IX_IdUsuarioAlteracao] ON [dbo].[TemplateDocumento]([IdUsuarioAlteracao])
CREATE INDEX [IX_IdUsuarioExclusao] ON [dbo].[TemplateDocumento]([IdUsuarioExclusao])
ALTER TABLE [dbo].[DocumentoPost] ADD CONSTRAINT [FK_dbo.DocumentoPost_dbo.Post_IdPost] FOREIGN KEY ([IdPost]) REFERENCES [dbo].[Post] ([IdPost])
ALTER TABLE [dbo].[DocumentoPost] ADD CONSTRAINT [FK_dbo.DocumentoPost_dbo.Usuario_IdUsuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[Post] ADD CONSTRAINT [FK_dbo.Post_dbo.NivelCompartilhamento_IdNivelCompartilhamento] FOREIGN KEY ([IdNivelCompartilhamento]) REFERENCES [dbo].[NivelCompartilhamento] ([IdNivelCompartilhamento])
ALTER TABLE [dbo].[Post] ADD CONSTRAINT [FK_dbo.Post_dbo.Usuario_IdUsuarioCriacao] FOREIGN KEY ([IdUsuarioCriacao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[NivelCompartilhamento] ADD CONSTRAINT [FK_dbo.NivelCompartilhamento_dbo.Usuario_IdUsuarioInclusao] FOREIGN KEY ([IdUsuarioInclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [FK_dbo.Usuario_dbo.Area_IdArea] FOREIGN KEY ([IdArea]) REFERENCES [dbo].[Area] ([IdArea])
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [FK_dbo.Usuario_dbo.Perfil_IdPerfil] FOREIGN KEY ([IdPerfil]) REFERENCES [dbo].[Perfil] ([IdPerfil])
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [FK_dbo.Usuario_dbo.Usuario_IdUsuarioPai] FOREIGN KEY ([IdUsuarioPai]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[IntegrantesProjeto] ADD CONSTRAINT [FK_dbo.IntegrantesProjeto_dbo.Projeto_IdProjeto] FOREIGN KEY ([IdProjeto]) REFERENCES [dbo].[Projeto] ([IdProjeto])
ALTER TABLE [dbo].[IntegrantesProjeto] ADD CONSTRAINT [FK_dbo.IntegrantesProjeto_dbo.Usuario_IdUsuarioExclusao] FOREIGN KEY ([IdUsuarioExclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[IntegrantesProjeto] ADD CONSTRAINT [FK_dbo.IntegrantesProjeto_dbo.Usuario_IdUsuarioInclusao] FOREIGN KEY ([IdUsuarioInclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[IntegrantesProjeto] ADD CONSTRAINT [FK_dbo.IntegrantesProjeto_dbo.Usuario_IdUsuarioIntegrante] FOREIGN KEY ([IdUsuarioIntegrante]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[Projeto] ADD CONSTRAINT [FK_dbo.Projeto_dbo.ProjetoRisco_IdRisco] FOREIGN KEY ([IdRisco]) REFERENCES [dbo].[ProjetoRisco] ([IdProjetoRisco])
ALTER TABLE [dbo].[Projeto] ADD CONSTRAINT [FK_dbo.Projeto_dbo.ProjetoStatus_IdProjetoStatus] FOREIGN KEY ([IdProjetoStatus]) REFERENCES [dbo].[ProjetoStatus] ([IdProjetoStatus])
ALTER TABLE [dbo].[Projeto] ADD CONSTRAINT [FK_dbo.Projeto_dbo.Usuario_IdUsuarioAlteracao] FOREIGN KEY ([IdUsuarioAlteracao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[Projeto] ADD CONSTRAINT [FK_dbo.Projeto_dbo.Usuario_IdUsuarioAnalista] FOREIGN KEY ([IdUsuarioAnalista]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[Projeto] ADD CONSTRAINT [FK_dbo.Projeto_dbo.Usuario_IdUsuarioDesenvolvedor] FOREIGN KEY ([IdUsuarioDesenvolvedor]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[Projeto] ADD CONSTRAINT [FK_dbo.Projeto_dbo.Usuario_IdUsuarioExclusao] FOREIGN KEY ([IdUsuarioExclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[Projeto] ADD CONSTRAINT [FK_dbo.Projeto_dbo.Usuario_IdUsuarioInclusao] FOREIGN KEY ([IdUsuarioInclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[Projeto] ADD CONSTRAINT [FK_dbo.Projeto_dbo.Usuario_IdUsuarioPontoFocal] FOREIGN KEY ([IdUsuarioPontoFocal]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoRisco] ADD CONSTRAINT [FK_dbo.ProjetoRisco_dbo.Usuario_IdUsuarioAlteracao] FOREIGN KEY ([IdUsuarioAlteracao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoRisco] ADD CONSTRAINT [FK_dbo.ProjetoRisco_dbo.Usuario_IdUsuarioExclusao] FOREIGN KEY ([IdUsuarioExclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoRisco] ADD CONSTRAINT [FK_dbo.ProjetoRisco_dbo.Usuario_IdUsuarioInclusao] FOREIGN KEY ([IdUsuarioInclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoStatus] ADD CONSTRAINT [FK_dbo.ProjetoStatus_dbo.Usuario_IdUsuarioAlteracao] FOREIGN KEY ([IdUsuarioAlteracao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoStatus] ADD CONSTRAINT [FK_dbo.ProjetoStatus_dbo.Usuario_IdUsuarioExclusao] FOREIGN KEY ([IdUsuarioExclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoStatus] ADD CONSTRAINT [FK_dbo.ProjetoStatus_dbo.Usuario_IdUsuarioInclusao] FOREIGN KEY ([IdUsuarioInclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[PostComentario] ADD CONSTRAINT [FK_dbo.PostComentario_dbo.Post_IdPost] FOREIGN KEY ([IdPost]) REFERENCES [dbo].[Post] ([IdPost])
ALTER TABLE [dbo].[PostComentario] ADD CONSTRAINT [FK_dbo.PostComentario_dbo.Usuario_IdUsuarioComentario] FOREIGN KEY ([IdUsuarioComentario]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[PostComentario] ADD CONSTRAINT [FK_dbo.PostComentario_dbo.Usuario_IdUsuarioExclusao] FOREIGN KEY ([IdUsuarioExclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[PostNivelCompartUsuario] ADD CONSTRAINT [FK_dbo.PostNivelCompartUsuario_dbo.Post_IdPost] FOREIGN KEY ([IdPost]) REFERENCES [dbo].[Post] ([IdPost])
ALTER TABLE [dbo].[PostNivelCompartUsuario] ADD CONSTRAINT [FK_dbo.PostNivelCompartUsuario_dbo.Usuario_IdUsuarioCompartilhado] FOREIGN KEY ([IdUsuarioCompartilhado]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoComentario] ADD CONSTRAINT [FK_dbo.ProjetoComentario_dbo.Projeto_IdProjeto] FOREIGN KEY ([IdProjeto]) REFERENCES [dbo].[Projeto] ([IdProjeto])
ALTER TABLE [dbo].[ProjetoComentario] ADD CONSTRAINT [FK_dbo.ProjetoComentario_dbo.Usuario_IdUsuarioAlteracao] FOREIGN KEY ([IdUsuarioAlteracao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoComentario] ADD CONSTRAINT [FK_dbo.ProjetoComentario_dbo.Usuario_IdUsuarioComentario] FOREIGN KEY ([IdUsuarioComentario]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoComentario] ADD CONSTRAINT [FK_dbo.ProjetoComentario_dbo.Usuario_IdUsuarioExclusao] FOREIGN KEY ([IdUsuarioExclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoHorasTrabalhadas] ADD CONSTRAINT [FK_dbo.ProjetoHorasTrabalhadas_dbo.Projeto_IdProjeto] FOREIGN KEY ([IdProjeto]) REFERENCES [dbo].[Projeto] ([IdProjeto])
ALTER TABLE [dbo].[ProjetoHorasTrabalhadas] ADD CONSTRAINT [FK_dbo.ProjetoHorasTrabalhadas_dbo.Usuario_IdUsuarioAlteracao] FOREIGN KEY ([IdUsuarioAlteracao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoHorasTrabalhadas] ADD CONSTRAINT [FK_dbo.ProjetoHorasTrabalhadas_dbo.Usuario_IdUsuarioExclusao] FOREIGN KEY ([IdUsuarioExclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[ProjetoHorasTrabalhadas] ADD CONSTRAINT [FK_dbo.ProjetoHorasTrabalhadas_dbo.Usuario_IdUsuarioInclusao] FOREIGN KEY ([IdUsuarioInclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[QuestionarioDocumentos] ADD CONSTRAINT [FK_dbo.QuestionarioDocumentos_dbo.QuestionarioEstrategista_IdQuestionarioEstrategista] FOREIGN KEY ([IdQuestionarioEstrategista]) REFERENCES [dbo].[QuestionarioEstrategista] ([IdQuestionarioEstrategista])
ALTER TABLE [dbo].[QuestionarioDocumentos] ADD CONSTRAINT [FK_dbo.QuestionarioDocumentos_dbo.Usuario_IdUsuarioAlteracao] FOREIGN KEY ([IdUsuarioAlteracao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[QuestionarioDocumentos] ADD CONSTRAINT [FK_dbo.QuestionarioDocumentos_dbo.Usuario_IdUsuarioCriacao] FOREIGN KEY ([IdUsuarioCriacao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[QuestionarioDocumentos] ADD CONSTRAINT [FK_dbo.QuestionarioDocumentos_dbo.Usuario_IdUsuarioExclusao] FOREIGN KEY ([IdUsuarioExclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[QuestionarioEstrategista] ADD CONSTRAINT [FK_dbo.QuestionarioEstrategista_dbo.Assunto_IdAssunto] FOREIGN KEY ([IdAssunto]) REFERENCES [dbo].[Assunto] ([IdAssunto])
ALTER TABLE [dbo].[QuestionarioEstrategista] ADD CONSTRAINT [FK_dbo.QuestionarioEstrategista_dbo.Carteira_IdCarteira] FOREIGN KEY ([IdCarteira]) REFERENCES [dbo].[Carteira] ([IdCarteira])
ALTER TABLE [dbo].[QuestionarioEstrategista] ADD CONSTRAINT [FK_dbo.QuestionarioEstrategista_dbo.QuestionarioEtapa_IdQuestionarioEtapa] FOREIGN KEY ([IdQuestionarioEtapa]) REFERENCES [dbo].[QuestionarioEtapa] ([IdQuestionarioEtapa])
ALTER TABLE [dbo].[QuestionarioEstrategista] ADD CONSTRAINT [FK_dbo.QuestionarioEstrategista_dbo.QuestionarioRisco_IdQuestionarioRisco] FOREIGN KEY ([IdQuestionarioRisco]) REFERENCES [dbo].[QuestionarioRisco] ([IdQuestionarioRisco])
ALTER TABLE [dbo].[QuestionarioEstrategista] ADD CONSTRAINT [FK_dbo.QuestionarioEstrategista_dbo.Usuario_IdUsuarioCriacao] FOREIGN KEY ([IdUsuarioCriacao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[QuestionarioEstrategista] ADD CONSTRAINT [FK_dbo.QuestionarioEstrategista_dbo.Usuario_IdUsuarioExclusao] FOREIGN KEY ([IdUsuarioExclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[QuestionarioEstrategista] ADD CONSTRAINT [FK_dbo.QuestionarioEstrategista_dbo.Usuario_IdUsuarioPriorizacao] FOREIGN KEY ([IdUsuarioPriorizacao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[QuestionarioEstrategista] ADD CONSTRAINT [FK_dbo.QuestionarioEstrategista_dbo.Usuario_IdResponsavelHomologacao] FOREIGN KEY ([IdResponsavelHomologacao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[QuestionarioEstrategista] ADD CONSTRAINT [FK_dbo.QuestionarioEstrategista_dbo.Usuario_IdResponsavelImplantacao] FOREIGN KEY ([IdResponsavelImplantacao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[QuestionarioEstrategista] ADD CONSTRAINT [FK_dbo.QuestionarioEstrategista_dbo.Usuario_IdResponsavelParametrizacao] FOREIGN KEY ([IdResponsavelParametrizacao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[QuestionarioEstrategista] ADD CONSTRAINT [FK_dbo.QuestionarioEstrategista_dbo.Usuario_IdResponsavelTreinamento] FOREIGN KEY ([IdResponsavelTreinamento]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[TemplateCategoria] ADD CONSTRAINT [FK_dbo.TemplateCategoria_dbo.Usuario_IdUsuarioAlteracao] FOREIGN KEY ([IdUsuarioAlteracao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[TemplateCategoria] ADD CONSTRAINT [FK_dbo.TemplateCategoria_dbo.Usuario_IdUsuarioCriacao] FOREIGN KEY ([IdUsuarioCriacao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[TemplateCategoria] ADD CONSTRAINT [FK_dbo.TemplateCategoria_dbo.Usuario_IdUsuarioExclusao] FOREIGN KEY ([IdUsuarioExclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[TemplateDocumento] ADD CONSTRAINT [FK_dbo.TemplateDocumento_dbo.TemplateCategoria_IdTemplateCategoria] FOREIGN KEY ([IdTemplateCategoria]) REFERENCES [dbo].[TemplateCategoria] ([IdCategoria])
ALTER TABLE [dbo].[TemplateDocumento] ADD CONSTRAINT [FK_dbo.TemplateDocumento_dbo.Usuario_IdUsuarioAlteracao] FOREIGN KEY ([IdUsuarioAlteracao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[TemplateDocumento] ADD CONSTRAINT [FK_dbo.TemplateDocumento_dbo.Usuario_IdUsuarioCriacao] FOREIGN KEY ([IdUsuarioCriacao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
ALTER TABLE [dbo].[TemplateDocumento] ADD CONSTRAINT [FK_dbo.TemplateDocumento_dbo.Usuario_IdUsuarioExclusao] FOREIGN KEY ([IdUsuarioExclusao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
