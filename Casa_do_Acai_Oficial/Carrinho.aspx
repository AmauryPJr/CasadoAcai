<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Carrinho.aspx.cs" Inherits="Carrinho" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 360px;
            font-family: 'CHICKEN Pie';
        }
        .auto-style2 {
            font-size: 16pt;
        }
        p {
            font-family: 'CHICKEN Pie';
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">        
        <p>Escolha um ou mais produtos !</p>
        <asp:ImageButton ID="imbAcai" runat="server" Height="125px" ImageUrl="~/Imagens/Acai.png" Width="135px" OnClick="imbAcai_Click" />

        <asp:ImageButton ID="imbSacole" runat="server" Height="125px" ImageUrl="~/Imagens/Sacole.png" Width="135px" OnClick="imbSacole_Click" />

        <asp:ImageButton ID="imbGeladinho" runat="server" Height="125px" ImageUrl="~/Imagens/Geladinho.png" Width="135px" OnClick="imbGeladinho_Click" />
        <br />
        <br />
        <br />
        <asp:ImageButton ID="ImbSorvete" runat="server" Height="125px" ImageUrl="~/Imagens/Sorvete.png" Width="135px" OnClick="ImbSorvete_Click" />

        <asp:ImageButton ID="imbPicole" runat="server" Height="125px" ImageUrl="~/Imagens/Picole.png" Width="135px" OnClick="imbPicole_Click" />

        <asp:ImageButton ID="ImbCremosinho" runat="server" Height="125px" ImageUrl="~/Imagens/Cremosinho.png" Width="135px" OnClick="ImbCremosinho_Click" />
        <br />
        <br />
        <br />
        <div ID="teste1">
            <asp:GridView ID="gvProduto" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"
                DataKeyNames="id_prod" ForeColor="Black" GridLines="Vertical" Font-Names="CHICKEN Pie Height"
                Font-Size="16pt" Visible="False">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:RadioButton ID="rbEscolha" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tamanho" SortExpression="tam_prod">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tam_prod") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("tam_prod") %>' CssClass="auto-style2"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Preço (R$)" SortExpression="preco_prod">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("preco_prod") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("preco_prod") %>' CssClass="auto-style2" Font-Names="CHICKEN Pie Height"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:GridView ID="gvAdicional" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Names="CHICKEN Pie" Font-Size="16pt" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:RadioButton ID="rbEscolha" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
        </div>
        <br />
        <asp:Button ID="btnVoltar" runat="server" text="Voltar" Width="130px" OnClick="btnVoltar_Click" BackColor="#990099" Font-Names="CHICKEN Pie" Font-Size="16px" ForeColor="White" Visible="False"/>
        <asp:Button ID="btnContinuar" runat="server" text="Continuar" Width="130px" OnClick="btnContinuar_Click" BackColor="#990099" Font-Names="CHICKEN Pie" Font-Size="16px" ForeColor="White"/>
        <br />
        <br />
        <div ID="teste2">
        </div>
        <br />
        <asp:SqlDataSource ID="DSTipoProduto" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT * FROM tipo_prod"></asp:SqlDataSource>
        &nbsp;<asp:SqlDataSource ID="DSProduto" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" InsertCommand="INSERT INTO produto(id_prod, nome_prod, id_tipoProd, tam_prod) VALUES (@IDPROD, @NOME, @TIPO, @TAMANHO)" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT * FROM produto">
            <InsertParameters>
                <asp:Parameter Name="IDPROD" />
                <asp:Parameter Name="NOME" />
                <asp:Parameter Name="TIPO" />
                <asp:Parameter Name="TAMANHO" />
            </InsertParameters>
        </asp:SqlDataSource>
        
    </form>    
</body>
</html>
