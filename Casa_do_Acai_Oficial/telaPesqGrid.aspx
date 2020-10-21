<%@ Page Language="C#" AutoEventWireup="true" CodeFile="telaPesqGrid.aspx.cs" Inherits="telaPesqGrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <div >
            <strong><span class="auto-style1">PESQUISA COM FILTRO GRIDVIEW</span><br />
            <br />
            </strong>Digite o nome do produto:
            <asp:TextBox ID="txtPesq" runat="server" CssClass="auto-style2"></asp:TextBox>
&nbsp;
            <asp:Button ID="btnOK" runat="server" CssClass="auto-style2" Text="OK" OnClick="btnOK_Click" />
            <br />
            <br />
            <asp:GridView ID="gvExibir1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_produto" OnSelectedIndexChanged="gvExibir1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField SelectText="Selecione" ShowSelectButton="True" />
                    <asp:TemplateField HeaderText="Código" InsertVisible="False" SortExpression="id_produto" Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_produto") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_produto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descricao" SortExpression="descricao">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("descricao") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("descricao") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Preco" SortExpression="preco">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("preco") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("preco", "{0:c}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estoque" SortExpression="qtd_estoque">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("qtd_estoque") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("qtd_estoque") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Data de Validade" SortExpression="data_validade">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("data_validade") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("data_validade", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Foto" SortExpression="foto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("foto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="54px" ImageUrl='<%# Eval("foto", "{0}") %>' Width="57px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            Código do Item Selecionado:
            <asp:Label ID="lblCodigo" runat="server" Text=""></asp:Label>
            <br />
            <asp:SqlDataSource ID="sqlProduto" runat="server" ConnectionString="<%$ ConnectionStrings:lojas_6ia_6wa_criptoConnectionString2 %>" ProviderName="<%$ ConnectionStrings:lojas_6ia_6wa_criptoConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM produto"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="gvExibir2" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkOP" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="sqlProduto2" runat="server" ConnectionString="<%$ ConnectionStrings:lojas_6ia_6wa_criptoConnectionString %>" DeleteCommand="DELETE FROM produto WHERE (id_produto = @IDPROD)" ProviderName="<%$ ConnectionStrings:lojas_6ia_6wa_criptoConnectionString.ProviderName %>" SelectCommand="SELECT * FROM produto">
                <DeleteParameters>
                    <asp:SessionParameter Name="IDPROD" SessionField="idProduto" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:Button ID="btnExcluir" runat="server" OnClick="btnExcluir_Click" Text="Excluir" style="height: 26px" />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
