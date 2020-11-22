<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Detalhes.aspx.cs" Inherits="Detalhes" %>

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
        h1 {
            text-align: center;
            font-family: 'CHICKEN Pie';
        }

        .divs {
            display: inline-block;
            margin-left: 50px;
            font-family: 'CHICKEN Pie';
            width: 385px;
        }

        #grid {
            margin-bottom: 100px;
        }

        p {
            font-size: 20px;
        }

        #btnVoltar {
            background: none;
            border: 2px solid #FF00FF;
            color: black;
            padding: 5px;
            font-size: 18px;
            cursor: pointer;
            margin: 12px 0;
            margin-left: 3em;
            font-family: chicken pie;
            width: 125px;
        }

        #btnAdicionar {
            background: none;
            border: 2px solid #FF00FF;
            color: black;
            padding: 5px;
            font-size: 18px;
            cursor: pointer;
            margin: 12px 0;
            margin-left: 3em;
            font-family: chicken pie;
            width: 125px;
        }

        #imgProd {
            margin-left: 50px;
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
                            <a class="nav-link" id="btn4" href="Cardapio_Logado.aspx" onclick="mudarCor('btn4')">CARDÁPIO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn5" href="Carrinho.aspx" onclick="mudarCor('btn5')">CARRINHO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn5" href="Perfil.aspx" onclick="mudarCor('btn5')">PERFIL</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn5" href="SAIR.aspx" onclick="mudarCor('btn5')">SAIR</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <div>
            <h1>Detalhes do Produto</h1>

            <div id="dvImagem">
                <asp:Image ID="imgProd" runat="server" Height="125px" Width="135px" />
            </div>
            <br />
            <br />

            <div id="dvDetalhes" class="divs">
                <div id="conteudo">
                    <p>
                        Nome:
                <asp:Label runat="server" ID="txtNome" />
                    </p>
                    <br />
                    <p>
                        Preço: R$
                <asp:Label runat="server" ID="txtPreco" />
                    </p>
                    <br />
                    <p>
                        <asp:Label ID="lblTamnho" runat="server" Text="Tamanho:"></asp:Label>
                        &nbsp;<asp:Label ID="txtTamanho" runat="server"></asp:Label>
                    </p>
                    <br />
                    <p>
                        Tipo:
                <asp:Label ID="txtTipo" runat="server"></asp:Label>
                    </p>

                    <br />
                    <p>
                        Quantidade Desejada:
                <asp:TextBox runat="server" ID="txtQtdDesejada" Width="115px" />
                    </p>
                </div>
                <br />
            </div>
            <div id="grid" class="divs">
                        <asp:GridView ID="gvAdicional" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Names="CHICKEN Pie" Font-Size="16pt" ForeColor="Black">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkEscolhaAdd" runat="server" AutoPostBack="True" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="#CC00CC" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="Gray" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </div>
            <br />
            <asp:Button runat="server" CssClass="btn" ID="btnVoltar" Text="Voltar" PostBackUrl="~/Cardapio_Logado.aspx" Width="125px" />
            <asp:Button runat="server" CssClass="btn" ID="btnAdicionar" Text="Adicionar" OnClick="btnAdicionar_Click" BorderStyle="Solid" Width="125px" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="DSDetalhes" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT produto.id_prod, produto.nome_prod, produto.tam_prod, produto.preco_prod, tipo_prod.nome_tipo FROM produto INNER JOIN tipo_prod ON produto.id_tipoProd = tipo_prod.id_tipoProd WHERE (produto.id_prod = @IDPROD)">
                <SelectParameters>
                    <asp:SessionParameter Name="IDPROD" SessionField="idProd" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSNovaVenda" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" InsertCommand="INSERT INTO vendas(id_cli, id_forma, data_vda, valor_vda) VALUES (@IDCLI, 1, @DATA, 0)" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [vendas]">
                <InsertParameters>
                    <asp:SessionParameter Name="IDCLI" SessionField="idCli" />
                    <asp:Parameter Name="DATA" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSUltimaVenda" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT MAX(id_vda) AS ultVenda FROM vendas"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DSItemVenda" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" InsertCommand="INSERT INTO it_venda(id_vda, id_prod, qtd_it, total_ped, adicional) VALUES (@IDVDA,@IDPROD,@QTD,@TOTAL,@ADICIONAL)" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [it_venda]">
                <InsertParameters>
                    <asp:SessionParameter Name="IDVDA" SessionField="ultVenda" />
                    <asp:SessionParameter Name="IDPROD" SessionField="idProd" />
                    <asp:Parameter Name="QTD" />
                    <asp:Parameter Name="TOTAL" />
                    <asp:Parameter Name="ADICIONAL" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>

        <div class="principal" style="margin-top: 5px;">
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
