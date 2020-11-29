<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Relatorios.aspx.cs" Inherits="Relatorios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

        #gvRelatorio {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
        }

        #btnPesquisar {
            background: none;
            border: 2px solid #FF00FF;
            color: black;
            padding: 5px;
            font-size: 18px;
            cursor: pointer;
            margin: 12px 0;
            margin-left: 62px;
            font-family: chicken pie;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <script>
            function Mascara(data) {
                if (data.value.length == 2)
                    data.value += '/';

                if (data.value.length == 5)
                    data.value += '/';
            }
        </script>

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

        <h1 style="text-align: center; font-size: 32px">RELATÓRIOS</h1>

        <p style="margin-left: 3em;">
            Digite uma data :
            <asp:TextBox runat="server" ID="txtData" onKeyPress="Mascara(this)" Width="115px" Font-Size="20px"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnPesquisar" runat="server" BorderColor="#CC00CC" BorderStyle="Solid" CssClass="btn" Text="Pesquisar" OnClick="btnPesquisar_Click" Width="140px" />
        </p>
        <div style="text-align: center;">
            <asp:GridView runat="server" ID="gvRelatorio" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Names="CHICKEN Pie" Font-Size="20px" ForeColor="Black" AutoGenerateColumns="False" OnSelectedIndexChanged="gvRelatorio_SelectedIndexChanged" DataKeyNames="id_vda">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Detalhes" SelectText="Clique Aqui" ShowSelectButton="True" />
                    <asp:BoundField DataField="id_vda" HeaderText="Código" SortExpression="id_vda" Visible="False" />
                    <asp:BoundField DataField="id_vda" HeaderText="Venda" SortExpression="id_vda" Visible="False" />
                    <asp:BoundField DataField="nome_cli" HeaderText="Cliente" SortExpression="nome_cli" />
                    <asp:BoundField DataField="nome_prod" HeaderText="Produto" SortExpression="nome_prod" />
                    <asp:BoundField DataField="adicional" HeaderText="Adicional" SortExpression="adicional" />
                    <asp:BoundField DataField="valor_vda" DataFormatString="{0:c}" HeaderText="Valor da Venda" SortExpression="valor_vda" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="#CC00CC" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="DSRelatorios" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT vendas.id_vda, cadastro_cliente.nome_cli, produto.nome_prod, it_venda.adicional, vendas.valor_vda FROM vendas INNER JOIN it_venda ON vendas.id_vda = it_venda.id_vda INNER JOIN cadastro_cliente ON vendas.id_cli = cadastro_cliente.id_cli INNER JOIN produto ON it_venda.id_prod = produto.id_prod WHERE (vendas.data_vda = @DATA) AND (vendas.status_vda = '1') ORDER BY vendas.data_vda DESC">
            <SelectParameters>
                <asp:Parameter Name="DATA" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />

        <div class="principal" style="position: absolute; margin-top: 201px; width: 100%">
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
                    <i class="fa fa-copyright" aria-hidden="true"></i> Todos os direitos
                reservados a MNT-Gaming 2020
                </p>
            </div>
        </div>
    </form>
</body>
</html>
