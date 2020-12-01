<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Style/Style.css">
    <link rel="stylesheet" href="Style/Style_Login.css">
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
                            <a class="nav-link" id="btn2" href="QuemSomos.aspx" onclick="mudarCor('btn2')">QUEM SOMOS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn3" href="Contato.aspx" onclick="mudarCor('btn3')">CONTATO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn4" href="Cardapio_NaoLogado.aspx" onclick="mudarCor('btn4')">CARDÁPIO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn5" href="Login.aspx" onclick="mudarCor('btn5')">LOGIN</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="body">
            <div class="login-box">
                <h1>Login</h1>
                <div class="textBox">

                    <i class="fa fa-user" aria-hidden="true"></i>
                    <asp:TextBox runat="server" type="text" ID="txtLogin"
                        onKeyPress="Mascara(this)" placeholder="CPF" BorderStyle="None" EnableTheming="True" />
                </div>
                <div class="textBox">

                    <i class="fa fa-lock" aria-hidden="true"></i>
                    <asp:TextBox runat="server" type="password" ID="txtSenha"
                        placeholder="Senha" BorderStyle="None" />
                </div>
                <div id="dvCaptcha"></div>
                <asp:Button runat="server" class="btn" ID="btnEntrar" OnClick="btnEntrar_Click" Text="Entrar" />
                <p>Ainda não tem conta? <a href="CadastroUsuario.aspx">Cadastre-se</a> </p>
            </div>
        </div>
        <asp:SqlDataSource ID="DSLoginCliente" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT id_cli, nome_cli, senha_cli, cpf_cli FROM cadastro_cliente WHERE (senha_cli = @SENHA) AND (cpf_cli = @LOGIN)">
            <SelectParameters>
                <asp:Parameter Name="LOGIN" />
                <asp:Parameter Name="SENHA" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="DSLoginAdm" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT id_adm, login_adm, senha_adm FROM adm WHERE (login_adm = @LOGIN) AND (senha_adm = @SENHA)">
            <SelectParameters>
                <asp:Parameter Name="LOGIN" />
                <asp:Parameter Name="SENHA" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
