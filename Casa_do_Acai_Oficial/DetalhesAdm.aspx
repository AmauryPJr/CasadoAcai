<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetalhesAdm.aspx.cs" Inherits="_Default" %>

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

        h1 {
            text-align: center;            
        }

        #gvDetalhes {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
        }
        
        p {
            font-size: 20px;
            margin-left: 54px;
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
        
        <h1 style='text-align: center;'>DETALHES DA VENDA</h1>
        
        <div style="text-align: center">
              <asp:GridView ID="gvDetalhes" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Names="CHICKEN Pie" ForeColor="Black" GridLines="Both">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
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
        <p>
            Total da venda: <asp:Literal runat="server" ID="lRS" />
            <asp:Label runat="server" ID="txtTotalVenda" />
        </p>
        <p>
            Forma de pagamento:
            <asp:Label runat="server" ID="lblForma" />
        </p>

        <asp:Button runat="server" CssClass="btn" ID="btnVoltar" Text="Voltar" PostBackUrl="~/Cardapio_Logado.aspx" Width="125px" />

        <br />
        <asp:SqlDataSource ID="DSDetalhes" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>"
            ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>"
            SelectCommand="SELECT it_venda.id_it_venda, it_venda.qtd_it, it_venda.total_ped, it_venda.adicional, vendas.valor_vda, produto.nome_prod, produto.preco_prod, tipo_prod.nome_tipo, forma_pagto.tipo_forma FROM it_venda INNER JOIN vendas ON it_venda.id_vda = vendas.id_vda INNER JOIN produto ON it_venda.id_prod = produto.id_prod INNER JOIN tipo_prod ON produto.id_tipoProd = tipo_prod.id_tipoProd INNER JOIN forma_pagto ON vendas.id_forma = forma_pagto.id_forma WHERE (it_venda.id_vda = @IDVDA)">
            <SelectParameters>
                <asp:SessionParameter Name="IDVDA" SessionField="idVda" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div class="principal" style="position: absolute; bottom: 0; width: 100%">
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
                    <br/>

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
