<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastro_Produto.aspx.cs" Inherits="Cadastro_Produto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Style/Style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>CasaDoAç@í</title>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.3/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

    <style>
        body {
            font-family: 'CHICKEN Pie';
        }

        .conteudo {
            margin-left: 52px;
            font-size: 16pt;
        }

        #btnCadastrar {
            background: none;
            border: 2px solid #FF00FF;
            color: black;
            padding: 5px;
            font-size: 18px;
            cursor: pointer;
            margin: 12px 0;
            margin-left: 3em;
            width: 125px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <nav class="navbar navbar-expand-lg">
                <a class="navbar-brand" href="Menu.aspx" style="margin-left: 17%;" id="a">CasaDoAç@í</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav" id="textoNav">
                        <li class="nav-item">
                            <a class="nav-link" id="btn1" href="Menu_Adm.aspx" onclick="mudarCor('btn1')">INÍCIO <span
                                class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn2" href="Relatorios.aspx" onclick="mudarCor('btn2')">RELATÓRIOS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn3" href="Produtos.aspx" onclick="mudarCor('btn3')">PRODUTOS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn4" href="Sair.aspx" onclick="mudarCor('btn4')">SAIR</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <h1 style='text-align: center;'>NOVO PRODUTO</h1>

        <div style="margin-top: 20px;">
            <p class="conteudo">
                Nome do produto:
                <asp:TextBox ID="txtNome" runat="server"  Width="300px"/>
            </p>

            <p class="conteudo">
                Tipo do produto:
                <asp:TextBox ID="txtTipo" runat="server" Width="165px" />
            </p>

            <p class="conteudo">
                Tamanho:
                <asp:TextBox ID="txtTamanho" runat="server" Width="100px" />
                <p style="font-size: 13px; color: red; margin-left: 4em;">*Não obrigatório</p>
            </p>

            <p class="conteudo">
                Preço unitário:
                <asp:TextBox ID="txtPreço" runat="server" Width="100px" />
            </p>

            <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn" OnClick="btnCadastrar_Click"/>
        </div>

        <asp:SqlDataSource ID="DSCadastro" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" InsertCommand="INSERT INTO produto(nome_prod, id_tipoProd, tam_prod, preco_prod, statusProd) VALUES (@NOME, @TIPO, @TAMANHO, @PRECO, '1')" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>">
            <InsertParameters>
                <asp:Parameter Name="NOME" />
                <asp:Parameter Name="TIPO" />
                <asp:Parameter Name="TAMANHO" />
                <asp:Parameter Name="PRECO" DefaultValue="" />
            </InsertParameters>
        </asp:SqlDataSource>
        
        <div class="principal" style="position: absolute; width: 100%; margin-top: 17px;">
            <div class="row container-fluid ">
                <div class="col-12 col-md-3 text-center">
                    <p class="tituloFooter">ENDEREÇO</p>
                    <p class="textoFooter">Rua H30B, 108 </p>
                    <p class="textoFooter">Campus do CTA</p>
                    <p class="textoFooter">São José dos Campos</p>
                </div>
                <div class="col-12 col-md-3 text-center">
                    <p class="tituloFooter">CONTATO</p>

                    <p class="textoFooter">joao03araujo@gmail.com</p>
                    <p class="textoFooter">Tel : (12) 99709-2686</p>

                </div>

                <div class="col-12 col-md-3 text-center">
                    <p class="tituloFooter">HORÁRIOS</p>

                    <p class="textoFooter">ABERTO DE SEG À SEX </p>
                    <p class="textoFooter">09:00 - 22:00</p>
                    <br />

                    <p class="textoFooter">SÁB/DOM e FERIADOS </p>
                    <p class="textoFooter" style="margin-bottom: 4px;">13:00 - 21:00</p>

                </div>

                <div class="col-12 col-md-3 text-center">
                    <p>Logo</p>
                    <a><i class="fa fa-facebook fa-lg icon" aria-hidden="true"></i></a>
                    <a><i class="fa fa-instagram fa-lg icon" aria-hidden="true"></i></a>

                </div>
            </div>
            <div class="divCopy">
                <p class="textoCopy text-center">
                    <i class="fa fa-copyright" aria-hidden="true"></i> Todos os direitos
                    reservados a MNT-Gaming 2020
               
                </p>
            </div>
        </div>
    </form>
</body>
</html>
