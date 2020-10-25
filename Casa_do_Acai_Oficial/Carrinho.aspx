<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Carrinho.aspx.cs" Inherits="Carrinho" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
            <asp:SqlDataSource ID="DSItemVenda" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT * FROM it_venda"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
