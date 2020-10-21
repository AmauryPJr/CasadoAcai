<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="btnTelaCadastro" runat="server" OnClick="btnTelaCadastro_Click" Text="Cadastro" />
        <br />
        <asp:Button ID="btnTelaLogin" runat="server" OnClick="btnTelaLogin_Click" Text="Login" Width="78px" />
    
        <br />
        <asp:Button ID="btnCarrinho" runat="server" OnClick="btnCarrinho_Click" Text="Carrinho" Width="78px" />
    
    </div>
    </form>
</body>
</html>
