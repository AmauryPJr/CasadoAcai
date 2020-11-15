<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cardapio_Logado.aspx.cs" Inherits="Cardapio_Logado" %>

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

    <style type="text/css">
        p {
            font-family: 'CHICKEN Pie';
        }

        #body {
            text-align: center;
        }

        #gvProduto {
            margin-left: auto;
            margin-right: auto;
        }

        #gvAdicional {
            margin-left: auto;
            margin-right: auto;
        }
        
        .auto-style1 {
            font-size: x-large;
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
                            <a class="nav-link" id="btn1" href="Menu.aspx" onclick="mudarCor('btn1')">INÍCIO <span
                                class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn2" href="QuemNosSomos.aspx" onclick="mudarCor('btn2')">QUEM SOMOS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn3" href="Contato.aspx" onclick="mudarCor('btn3')">CONTATO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn4" href="Cardapio_NaoLogado.aspx" onclick="mudarCor('btn4')">CARDÁPIO</a>
                        </li>
                        <li class="nav-item">
                            <asp:Literal runat="server" ID="lCarrinho" />
                        </li>
                        <li class="nav-item">
                            <asp:Literal runat="server" ID="lSair" />
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div id="body">
            <p class="auto-style1">Escolha um ou mais produtos !</p>
            <asp:ImageButton ID="imbAcai" runat="server" Height="125px" ImageUrl="~/Imagens/Acai.png" Width="135px" OnClick="imbAcai_Click" />
            <asp:ImageButton ID="imbSacole" runat="server" Height="125px" ImageUrl="~/Imagens/Sacole.png" Width="135px" OnClick="imbSacole_Click" />
            <asp:ImageButton ID="imbGeladinho" runat="server" Height="125px" ImageUrl="~/Imagens/Geladinho.png" Width="135px" OnClick="imbGeladinho_Click" />
            <br />
            <br />
            <asp:ImageButton ID="ImbSorvete" runat="server" Height="125px" ImageUrl="~/Imagens/Sorvete.png" Width="135px" OnClick="ImbSorvete_Click" />
            <asp:ImageButton ID="imbPicole" runat="server" Height="125px" ImageUrl="~/Imagens/Picole.png" Width="135px" OnClick="imbPicole_Click" />
            <asp:ImageButton ID="ImbCremosinho" runat="server" Height="125px" ImageUrl="~/Imagens/Cremosinho.png" Width="135px" OnClick="ImbCremosinho_Click" />
            <br />
            <br />
            <asp:GridView ID="gvProduto" runat="server" AutoGenerateColumns="False" DataKeyNames="id_prod" Font-Names="CHICKEN Pie" Font-Size="16pt" AllowPaging="True" PageSize="6" OnPageIndexChanging="gvProduto_PageIndexChanging" OnSelectedIndexChanged="gvProduto_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField HeaderText="Detalhes" SelectText="Clique Aqui" ShowSelectButton="True" />
                    <asp:BoundField DataField="id_prod" HeaderText="Código" SortExpression="id_prod" Visible="false"/>
                    <asp:BoundField DataField="nome_prod" HeaderText="Nome" SortExpression="nome_prod" />
                    <asp:BoundField DataField="preco_prod" DataFormatString="{0:c}" HeaderText="Preço" SortExpression="preco_prod" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="White" />
                <HeaderStyle BackColor="#CC00CC" Font-Bold="False" ForeColor="White" />
            </asp:GridView>
            <br />
            <br />
            <br />
        </div>
        <br />
        <asp:SqlDataSource ID="DSProduto" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" InsertCommand="INSERT INTO produto(id_prod, nome_prod, id_tipoProd, tam_prod) VALUES (@IDPROD, @NOME, @TIPO, @TAMANHO)" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT * FROM produto">
            <InsertParameters>
                <asp:Parameter Name="IDPROD" />
                <asp:Parameter Name="NOME" />
                <asp:Parameter Name="TIPO" />
                <asp:Parameter Name="TAMANHO" />
            </InsertParameters>
        </asp:SqlDataSource>

        <div id="teste2">
        </div>
        <br />
        &nbsp;<div class="principal" style="margin-top: 5px;">
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
