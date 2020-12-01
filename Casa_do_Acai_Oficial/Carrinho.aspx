<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Carrinho.aspx.cs" Inherits="Carrinho" %>

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

        #gvCarrinho {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
        }

        #btnExcluir {
            background: none;
            border: 2px solid #FF00FF;
            color: black;
            padding: 5px;
            font-size: 18px;
            cursor: pointer;
            margin: 12px 0;
            margin-left: 62px;
            font-family: chicken pie;
            width: 175px;
        }

        #btnFinalizar {
            background: none;
            border: 2px solid #FF00FF;
            color: black;
            padding: 5px;
            font-size: 18px;
            cursor: pointer;
            margin: 12px 0;
            margin-left: 60px;
            font-family: chicken pie;
            width: 175px;
        }

        .conteudo {
            margin-left: 3em;
            color: black;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <nav class="navbar navbar-expand-lg">
                <a class="navbar-brand" href="Menu.aspx" style="margin-left: 17%;" id="a"><asp:Image runat="server" ImageUrl="~/Imagens/Logo Casa do Acai.png" Height="90px" Width="150px"/></a>
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
                            <a class="nav-link" id="btn6" href="Perfil.aspx" onclick="mudarCor('btn6')">PERFIL</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn7" href="Sair.aspx" onclick="mudarCor('btn7')">SAIR</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <asp:Literal runat="server" ID="lH1"/>
        <div id="dvGrid" style="text-align: center;">
            <asp:GridView ID="gvCarrinho" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Names="CHICKEN Pie" ForeColor="Black" GridLines="Both">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkExcluir" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Imagem">
                        <ItemTemplate>
                            <asp:Image ID="imgProduto" runat="server" Height="90px" Width="100px" ImageUrl='<%# Eval ("imagem", "{0}") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="nome_prod" HeaderText="Produto" SortExpression="nome_prod" />
                    <asp:BoundField HeaderText="Adicional" DataField="adicional" SortExpression="adicional" />
                    <asp:BoundField HeaderText="Quantidade" DataField="qtd_it" SortExpression="qtd_it"></asp:BoundField>
                    <asp:BoundField DataFormatString="{0:c}" HeaderText="Preço Unitário" DataField="preco_prod" SortExpression="preco_prod" />
                    <asp:BoundField DataFormatString="{0:c}" DataField="total_ped" HeaderText="Total do Produto" SortExpression="total_ped" />
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
        <asp:Button ID="btnExcluir" runat="server" Text="Excluir Produto" BorderStyle="Solid" CssClass="btn" OnClick="btnExcluir_Click" />
        <br />
        <p class="conteudo">
            Total da compra:
            <asp:Label runat="server" ID="txtTotalVenda" />
        </p>
        <p class="conteudo">
            Forma de pagamento:
            <asp:DropDownList ID="ddlForma" runat="server">
                <asp:ListItem Value="1">Dinheiro</asp:ListItem>
                <asp:ListItem Value="2">Cartão de Crédito</asp:ListItem>
                <asp:ListItem Value="3">Cartão de Débito</asp:ListItem>
            </asp:DropDownList>
        </p>
        <asp:Button ID="btnFinalizar" runat="server" BorderStyle="Solid" CssClass="btn" Text="Finalizar Compra" OnClick="btnFinalizar_Click" />
        <br />
        <br />
        <asp:SqlDataSource ID="DSVendas" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT * FROM vendas"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSItemVenda" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT * FROM it_venda" InsertCommand="INSERT INTO it_venda(id_vda, id_prod, qtd_it, adicional) VALUES (@VDA,@PROD,@QTD,@ADD)">
            <InsertParameters>
                <asp:Parameter Name="IDVDA" />
                <asp:Parameter Name="PROD" />
                <asp:Parameter Name="QTD" />
                <asp:Parameter Name="ADD" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSCarrinho" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT tipo_prod.nome_tipo, produto.nome_prod, it_venda.adicional, it_venda.qtd_it, produto.preco_prod, it_venda.total_ped, it_venda.id_it_venda, it_venda.id_vda FROM it_venda INNER JOIN produto ON it_venda.id_prod = produto.id_prod INNER JOIN tipo_prod ON produto.id_tipoProd = tipo_prod.id_tipoProd WHERE (it_venda.id_vda = @IDVDA) AND (it_venda.status_it_vda = '1')" UpdateCommand="UPDATE vendas SET id_forma = @IDFORMA, valor_vda = @TOTAL WHERE (id_vda = @IDVDA)">
            <SelectParameters>
                <asp:SessionParameter Name="IDVDA" SessionField="ultVenda" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="ddlForma" Name="IDFORMA" PropertyName="SelectedValue" />
                <asp:Parameter Name="TOTAL" />
                <asp:SessionParameter Name="IDVDA" SessionField="ultVenda" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="DSExcluirProd" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" UpdateCommand="UPDATE it_venda SET status_it_vda = '0' WHERE (id_it_venda = @IDITEM)">
            <UpdateParameters>
                <asp:Parameter Name="IDITEM" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="principal" style="position: absolute; margin-top: 26px; width: 100%">
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
                    <p><asp:Image runat="server" ImageUrl="~/Imagens/Logo Casa do Acai.png" Height="90px" Width="150px"/></p>
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
