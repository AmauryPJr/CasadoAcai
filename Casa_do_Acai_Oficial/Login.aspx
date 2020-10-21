<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
        <script type="text/javascript">
            var onloadCallback = function () {
                grecaptcha.render('dvCaptcha', {
                    'sitekey': '<%=ReCaptcha_Key %>',
                    'callback': function (response) {
                        $.ajax({
                            type: "POST",
                            url: "Default.aspx/VerifyCaptcha",
                            data: "{response: '" + response + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (r) {
                                var captchaResponse = jQuery.parseJSON(r.d);
                                if (captchaResponse.success) {
                                    $("[id*=txtCaptcha]").val(captchaResponse.success);
                                    $("[id*=rfvCaptcha]").hide();
                                } else {
                                    $("[id*=txtCaptcha]").val("");
                                    $("[id*=rfvCaptcha]").show();
                                    var error = captchaResponse["error-codes"][0];
                                    $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                                }
                            }
                        });
                    }
                });
            };
        </script>
        <script type="text/javascript">
            function Mascara(cpf) {
                if (cpf.value.length == 3)
                    cpf.value += '.';

                if (cpf.value.length == 7)
                    cpf.value += '.';

                if (cpf.value.length == 11)
                    cpf.value += '-';
            }
        </script>
        <asp:Label ID="lblLogin" runat="server" CssClass="auto-style1" Font-Names="Segoe UI" style="font-size: x-large">Login: </asp:Label>
        &nbsp;
        <asp:TextBox ID="txtLogin" runat="server" CssClass="auto-style2" MaxLength="14" style="font-size: large" onKeyPress="Mascara(this)"></asp:TextBox>
        <br />
        <asp:Label ID="lblSenha" runat="server" CssClass="auto-style1" Font-Names="Segoe UI" style="font-size: x-large">Senha: </asp:Label>
        <asp:TextBox ID="txtSenha" runat="server" CssClass="auto-style2" MaxLength="16" TextMode="Password" style="font-size: large"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <div id="dvCaptcha">
            
        </div>
        <br />
        <asp:Button ID="btnLogar" runat="server" CssClass="auto-style2" OnClick="btnLogar_Click" Text="Logar" style="font-size: medium" />
        <br />
        <br />
        <asp:HyperLink ID="hlCadastro" runat="server" NavigateUrl="~/CadastroUsuario.aspx">Não possui Login? Cadastra-se Aqui</asp:HyperLink>
        <br />
        <br />
        <asp:SqlDataSource ID="DSLogin" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT senha_cli, cpf_cli FROM cadastro_cliente WHERE (senha_cli = @SENHA) AND (cpf_cli = @LOGIN)">
            <SelectParameters>
                <asp:Parameter Name="LOGIN" />
                <asp:Parameter Name="SENHA" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
