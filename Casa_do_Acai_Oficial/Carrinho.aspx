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
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <nav class="navbar navbar-expand-lg">
                <a class="navbar-brand" href="./index.html" style="margin-left: 17%;" id="a">CasaDoAç@í</a>
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
                            <a class="nav-link" id="btn4" href="Cardapio_NaoLogado.aspx" onclick="mudarCor('btn4')">CADÁPIO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn5" href="Login.aspx" onclick="mudarCor('btn5')">LOGIN</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <asp:GridView ID="gvCarrinho" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id_vda" Font-Names="CHICKEN Pie" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField HeaderText="Imagem">
                    <ItemTemplate>
                        <asp:Image ID="imgProduto" runat="server" Height="90px" Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Produto"></asp:TemplateField>
                <asp:BoundField HeaderText="Adicional" />
                <asp:TemplateField HeaderText="Quantidade">
                    <ItemTemplate>
                        &nbsp;
                            <asp:Button ID="btnMenos" runat="server" OnClick="btnMenos_Click" Text="&lt;" />
                        &nbsp;
                            <asp:Label ID="lblQtd" runat="server" Font-Size="20px" Text="0"></asp:Label>
                        &nbsp;
                            <asp:Button ID="btnMais" runat="server" OnClick="btnMais_Click" Text="&gt;" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataFormatString="{0:c}" HeaderText="Preço Unitário" />
                <asp:BoundField DataField="valor_vda" HeaderText="Total do Produto" SortExpression="valor_vda" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="#990099" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="DSVendas" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT * FROM vendas"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSItemVenda" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT * FROM it_venda" InsertCommand="INSERT INTO it_venda(id_vda, id_prod, qtd_it, adicional) VALUES (@VDA,@PROD,@QTD,@ADD)">
            <InsertParameters>
                <asp:Parameter Name="VDA" />
                <asp:Parameter Name="PROD" />
                <asp:Parameter Name="QTD" />
                <asp:Parameter Name="ADD" />
            </InsertParameters>
        </asp:SqlDataSource>
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
