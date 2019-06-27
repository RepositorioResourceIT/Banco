Delete from Parametro

DBCC CHECKIDENT ('Parametro', RESEED,0)

insert into Parametro(Nome, Valor,DataInclusao) values('SLAParametrizacao','5', GETDATE(),GETDATE()) 
insert into Parametro(Nome, Valor,DataInclusao) values('SLAHomologaçao','5', GETDATE(),GETDATE()) 
insert into Parametro(Nome, Valor,DataInclusao) values('SLATreinamento','5', GETDATE(),GETDATE()) 
insert into Parametro(Nome, Valor,DataInclusao) values('SLAImplantacao','5', GETDATE(),GETDATE()) 

INSERT INTO Parametro (Nome, Valor, DataInclusao)
VALUES ('NomePortal', 'Portal de Operações', GETDATE())

INSERT INTO Parametro (Nome,Valor,DataInclusao)
VALUES ('EmailTrocaFase'
, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width" />
    
	</script><style type="text/css">
        * {
            margin: 0;
            padding: 0;
            font-size: 100%;
            font-family: "Avenir Next", "Helvetica Neue", "Helvetica", Helvetica, Arial, sans-serif;
            line-height: 1.65;
        }
		
        body, .body-wrap {
            width: 100% !important;
            height: 100%;
            background: #f8f8f8;
        }

        h1, h2, h3, h4, h5, h6 {
            line-height: 1.25;
        }

        h1 {
            font-size: 32px;
        }

        h2 {
            font-size: 28px;
        }

        h3 {
            font-size: 24px;
        }

        h4 {
            font-size: 20px;
        }

        h5 {
            font-size: 16px;
        }
		
		td {word-wrap: break-word; word-break: break-all;}

        .container {
            display: block !important;
            clear: both !important;
            margin: 0 auto !important;
            max-width: 1024px !important;
        }

        .container table {
            width: 100% !important;
            border-collapse: collapse;
        }

        .container .masthead {
            padding: 25px 0;
            background: #00008b;
            color: white;
        }

        .container .masthead h1 {
            margin: 0 auto !important;
            max-width: 90%;
            text-transform: uppercase;
        }

        .container .content {
            background: white;
            padding: 30px 35px;
            color: #67757c
        }

        .container .content.footer {
            background: none;
			padding: 25px;
        }

        .container .content.footer p {
            margin-bottom: 0;
            color: #888;
            text-align: center;
            font-size: 14px;
        }
		
		.container .content.footer span {
			font-weight: bold;
			text-decoration: underline;
			font-style: italic;
		}
		
        .container .content.footer a {
            color: #888;
            text-decoration: none;
            font-weight: bold;
        }

        .container .content.footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <table class="body-wrap">
        <tbody>
            <tr>
                <td class="container">
                    <table>
                        <tbody>
                            <tr>
                                <td align="center" class="masthead">
                                    <h4>Questionário Estrategista {NomeQuestionárioEstrategista}</h4>
                                </td>
                            </tr>
                            <tr>
                                <td class="content">
                                    <h5>{DiaTardeNoite}.</h5>

                                    <br />
									
									<span>Foi {StatusDaFase} a fase de {FaseDoQuestionario} .</span>
									
									<br />
									<br />
									
									<span>Por favor, atue de forma coerente para que o fluxo siga sem atrasos no processo.</span>
									
                                    <br />
                                    <br />
									
                                    <p style="font-size:13px"><em>–Atenciosamente {NomePortal}</em></p>
                                </td>
                            </tr>
                            <tr>
                                <td class="container">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="content footer" align="center">
                                                    <p><span>Itaú</span> Todos os direitos reservados. </p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>'
, GETDATE())