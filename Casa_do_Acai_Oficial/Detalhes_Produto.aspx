<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Detalhes_Produto.aspx.cs" Inherits="Detalhes_Produto" %>

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
            font-size: 20px;
            margin-left: 3em;
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

        <h1 style="text-align: center; font-size: 32px; font-family: 'CHICKEN Pie';">DETELHES DO PRODUTOS</h1>

        <div id="dvImagem" style="margin-left: 52px;">
            <asp:Image ID="imgProd" runat="server" Height="125px" Width="135px" />
        </div>

        <br />

        <div id="dvDetalhes">
            <div id="conteudo">
                <p class="conteudo">
                    Nome:
                <asp:TextBox runat="server" ID="txtNome" Width="525px"/>
                </p>
                <p class="conteudo">
                    Preço:
                <asp:TextBox runat="server" ID="txtPreco" />
                </p>
                <p class="conteudo">
                    <asp:Label ID="lblTamnho" runat="server" Text="Tamanho:"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtTamanho" runat="server"></asp:TextBox>
                </p>
                <asp:Button runat="server" CssClass="btn" ID="btnVoltar" Text="Voltar" Style="background: none; border: 2px solid #FF00FF; color: black; padding: 5px; font-size: 18px; cursor: pointer; margin: 12px 0; margin-left: 3em; width: 125px;" PostBackUrl="~/Cardapio_Logado.aspx" Width="125px" />
                <asp:Button runat="server" CssClass="btn" ID="btnAlterar" Text="Alterar" Style="background: none; border: 2px solid #FF00FF; color: black; padding: 5px; font-size: 18px; cursor: pointer; margin: 12px 0; margin-left: 3em; width: 125px;"
                    OnClick="btnAlterar_Click" />
            </div>

            <asp:SqlDataSource ID="DSAlterar" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" UpdateCommand="UPDATE produto SET nome_prod = @NOME, tam_prod = @TAMANHO, preco_prod = @PRECO WHERE (id_prod = @IDPROD)">
                <UpdateParameters>
                    <asp:SessionParameter Name="IDPROD" SessionField="idProd" />
                    <asp:Parameter Name="NOME" />
                    <asp:Parameter Name="TAMANHO" />
                    <asp:Parameter Name="PRECO" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSDetalhes" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT produto.nome_prod, produto.tam_prod, produto.preco_prod, tipo_prod.nome_tipo FROM produto INNER JOIN tipo_prod ON produto.id_tipoProd = tipo_prod.id_tipoProd WHERE (produto.id_prod = @IDPROD)">
                <SelectParameters>
                    <asp:SessionParameter Name="IDPROD" SessionField="idProd" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div class="principal" style="position: absolute; width: 100%">
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
                    <br>

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
                    <i class="fa fa-copyright" aria-hidden="true"></i>Todos os direitos
                    reservados a MNT-Gaming 2020
                </p>
            </div>
        </div>
    </form>
</body>
</html>
