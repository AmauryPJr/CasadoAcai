<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CadastroUsuario.aspx.cs" Inherits="CadastroLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            font-size: medium;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
            function MascaraData(data) { 
                if (data.value.length == 2)
                    data.value += '/';

                if (data.value.length == 5)
                    data.value += '/';            
            }

            function MascaraCEP(cep) {
                if (cep.value.length == 5)
                    cep.value += '-';
            }

            function MascaraTelefone(fone) {
                if (fone.value.length == 0)
                    fone.value += '(';
                
                if (fone.value.length == 3)
                    fone.value += ')';

                if (fone.value.length == 4)
                    fone.value += ' ';

                if (fone.value.length == 10)
                    fone.value += '-';
            }
        </script>
            <asp:Label ID="Label3" runat="server" CssClass="auto-style1" Text="Nome: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtNome" runat="server" Width="130px" CssClass="auto-style3"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" CssClass="auto-style1" Text="Telefone: "></asp:Label>
            <asp:TextBox ID="txtTelefone" runat="server" Width="130px" CssClass="auto-style3" MaxLength="15" onKeyPress="MascaraTelefone(this)"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" CssClass="auto-style1" Text="CEP: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<asp:TextBox ID="txtCEP" runat="server" Width="130px" CssClass="auto-style3" MaxLength="9" onKeyPress="MascaraCEP(this)"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnVerificarCEP" runat="server" Text="Verificar CEP" OnClick="btnVerificarCEP_Click" CssClass="auto-style3" />
            <br />
            <br />
            <asp:Label ID="lblEndereco" runat="server" CssClass="auto-style2"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label10" runat="server" CssClass="auto-style1" Text="Número: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtNumero" runat="server" Width="60px" CssClass="auto-style3"></asp:TextBox>
            <br />
            <asp:Label ID="Label11" runat="server" CssClass="auto-style1" Text="Complemento:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtComplemento" runat="server" CssClass="auto-style3" Width="150px"></asp:TextBox>
            <br />
            <asp:Label ID="Label7" runat="server" CssClass="auto-style1" Text="Email: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtEmail" runat="server" Width="150px" CssClass="auto-style3"></asp:TextBox>
            <br />
            <asp:Label ID="Label8" runat="server" CssClass="auto-style1" Text="Data de Nascimento: "></asp:Label>
            <asp:TextBox ID="txtDataNasc" runat="server" Width="150px" CssClass="auto-style3" onKeyPress="MascaraData(this)" MaxLength="10"></asp:TextBox>
            &nbsp;&nbsp;
            <br />
            <asp:Label ID="Label9" runat="server" CssClass="auto-style1" Text="Gênero: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlGenero" runat="server" AppendDataBoundItems="True" Width="150px" CssClass="auto-style3">
                <asp:ListItem Value="F">Femenino</asp:ListItem>
                <asp:ListItem Value="M">Masculino</asp:ListItem>
                <asp:ListItem Value="PND">Prefiro Não Dizer</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" CssClass="auto-style1" Text="CPF: "></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtCPF" runat="server" CssClass="auto-style3"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnVerificarCPF" runat="server" OnClick="btnVerificarCPF_Click" Text="Verificar CPF" CssClass="auto-style3" Width="145px" />
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="auto-style1" Text="Senha: "></asp:Label>
            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" CssClass="auto-style3"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnVerificarSenha" runat="server" Text="Verificar Senha" Width="144px" OnClick="btnVerificarSenha_Click" CssClass="auto-style3" />
            <br />
            <br />
            </div>
            <div id="dvCaptcha">

            </div>
            <br />
            <br />
            <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" Enabled="False" OnClick="btnCadastrar_Click" CssClass="auto-style3" />
            <br />
            <br />
            <asp:SqlDataSource ID="DSCadastroCliente" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>" InsertCommand="INSERT INTO cadastro_cliente(nome_cli, tel_cli, cep_cli, num_cli, comp_cli, email_cli, dtnasc_cli, gen_cli, cpf_cli, senha_cli) VALUES (@NOME, @TELEFONE, @CEP, @NUMERO, @COMPLEMENTO, @EMAIL, @DATANASC, @GENERO, @CPF, @SENHA)" ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [cadastro_cliente]">
                <InsertParameters>
                    <asp:Parameter Name="NOME" />
                    <asp:Parameter Name="TELEFONE" />
                    <asp:Parameter Name="CEP" />
                    <asp:Parameter Name="NUMERO" />
                    <asp:Parameter Name="COMPLEMENTO" />
                    <asp:Parameter Name="EMAIL" />
                    <asp:Parameter Name="DATANASC" />
                    <asp:Parameter Name="GENERO" />
                    <asp:Parameter Name="CPF" />
                    <asp:Parameter Name="SENHA" />
                </InsertParameters>
            </asp:SqlDataSource>
        <br />
        <br />        
    </form>
</body>
</html>
