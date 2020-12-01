<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Perfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Style/Style.css">
    <link rel="stylesheet" href="Style/Style_Cadastro.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>CasaDoAç@í</title>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.3/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

    <style type="text/css">
        #btnFinalizar {
            width: 20%;
            background: none;
            border: 2px solid #FF00FF;
            color: black;
            padding: 5px;
            font-size: 18px;
            cursor: pointer;
            margin: 15px 0;
            margin-left: 480px;
            font-family: chicken pie;
        }

        .ddl {
            margin: 0 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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

            function handleContinue() {
                $('.step-1').attr('hidden', 'hidden')
                $('.step-2').removeAttr('hidden')
                $('.step-3').attr('hidden', 'hidden')
            }

            function handleBack() {
                $('.step-1').removeAttr('hidden')
                $('.step-2').attr('hidden', 'hidden')
                $('.step-3').attr('hidden', 'hidden')
            }

            function handleAvanced() {
                $('.step-1').attr('hidden', 'hidden')
                $('.step-2').attr('hidden', 'hidden')
                $('.step-3').removeAttr('hidden')
            }

            function handleGoBack() {
                $('.step-1').attr('hidden', 'hidden')
                $('.step-2').removeAttr('hidden')
                $('.step-3').attr('hidden', 'hidden')
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
                            <a class="nav-link" id="btn2" href="QuemNosSomos.aspx" onclick="mudarCor('btn2')">QUEM SOMOS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn3" href="Contato.aspx" onclick="mudarCor('btn3')">CONTATO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn4" href="Cardapio_NaoLogado.aspx" onclick="mudarCor('btn4')">CARDÁPIO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn5" href="Carrinho.aspx" onclick="mudarCor('btn5')">CARRINHO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn6" href="Perfil.aspx" onclick="mudarCor('btn6')">PERFIL</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn7" href="Sair.aspx" onclick="mudarCor('btn7')">SAIR</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6">
                    <div class="card">
                        <div class="card-body login-box">
                            <h1>Seu Perfil</h1>
                            <div class="step-1 row">
                                <div class="col-12 col-md-6">
                                    <div class="textBox">
                                        <i class="fa fa-user-circle" aria-hidden="true"></i>
                                        <asp:TextBox runat="server" CssClass="input" ID="txtNome"
                                            placeholder="Nome completo" BorderStyle="None" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="textBox">
                                        <i class="fa fa-address-card" aria-hidden="true"></i>
                                        <asp:TextBox runat="server" CssClass="input" ID="txtCPF"
                                            placeholder="CPF" BorderStyle="None" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="textBox">
                                        <i class="fa fa-envelope" aria-hidden="true"></i>
                                        <asp:TextBox runat="server" CssClass="input" ID="txtEmail"
                                            placeholder="E-mail" BorderStyle="None" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="textBox">
                                        <i class="fa fa-lock" aria-hidden="true"></i>
                                        <asp:TextBox runat="server" CssClass="input" ID="txtSenha"
                                            placeholder="Senha" BorderStyle="None" TextMode="SingleLine" />
                                    </div>
                                </div>
                                <asp:Button runat="server" CssClass="btn" ID="btnValidarCPF" type="button" Text="Validar CPF" OnClick="btnValidarCPF_Click" />
                                <asp:Button ID="btnValidarSenha" runat="server" CssClass="btn" Text="Validar Senha" OnClick="btnValidarSenha_Click" />
                                <input class="btn" id="btnProximo" type="button" name="" value="próximo"
                                    onclick="handleContinue()">
                            </div>
                            <div class="step-2 row" hidden>
                                <div class="col-12 col-md-6">
                                    <div class="textBox">
                                        <i class="fa fa-address-book" aria-hidden="true"></i>
                                        <asp:TextBox runat="server" CssClass="input" ID="txtCEP"
                                            placeholder="CEP" onkeypress="MascaraCEP(this)" BorderStyle="None" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="textBox">
                                        <i class="fa fa-phone" aria-hidden="true"></i>
                                        <asp:TextBox runat="server" CssClass="input" ID="txtTelefone"
                                            placeholder="Telefone" onkeypress="MascaraTelefone(this)" BorderStyle="None" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="textBox">
                                        <i class="fa fa-address-book" aria-hidden="true"></i>
                                        <asp:TextBox runat="server" CssClass="input" ID="txtComplemento" placeholder="Complemento" BorderStyle="None" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="textBox">
                                        <i class="fa fa-address-book" aria-hidden="true"></i>
                                        <asp:TextBox runat="server" CssClass="input" ID="txtNumero" placeholder="Número" BorderStyle="None" />
                                    </div>
                                </div>
                                <div class="row">
                                    <input class="btn" id="btnVoltar" type="button" name="" value="voltar"
                                        onclick="handleBack()">
                                    <asp:Button runat="server" CssClass="btn" ID="btnValidarCEP" type="button" Text="Validar CEP" OnClick="btnValidarCEP_Click" />
                                    <input class="btn" id="btnProximo" type="button" name="" value="próximo"
                                        onclick="handleAvanced()">
                                </div>
                            </div>
                            <div class="step-3 row" hidden>
                                <div class="col-12 col-md-6">
                                    <div class="textBox">
                                        <i class="fa fa-birthday-cake" aria-hidden="true"></i>
                                        <asp:TextBox runat="server" CssClass="input" ID="txtDataNasc" placeholder="Data de Nascimento" onkeypress="MascaraData(this)" BorderStyle="None" />
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="textBox">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <asp:DropDownList runat="server" ID="ddlGenero" placeholder="Gênero" CssClass="ddl" Font-Names="CHICKEN Pie">
                                            <asp:ListItem Value="F">Feminino</asp:ListItem>
                                            <asp:ListItem Value="M">Masculino</asp:ListItem>
                                            <asp:ListItem Value="PND">Prefiro Não Dizer</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div id="dvCaptcha" style="margin: 0 13px"></div>
                                <div class="row">
                                    <input class="btn" id="btnVoltar" type="button" name="" value="voltar"
                                        onclick="handleGoBack()">
                                    <asp:Button runat="server" style="width: 20%; background: none; border: 2px solid #FF00FF;
                                        color: black; padding: 5px; font-size: 18px; cursor: pointer; margin: 15px 0;
                                        margin-left: 480px; font-family: chicken pie;" CssClass="btn" ID="btnAlterar" type="button" Text="Alterar" OnClick="btnAlterar_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="DSPerfil" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>"
            ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>"
            SelectCommand="SELECT nome_cli, senha_cli, cpf_cli, tel_cli, cep_cli, num_cli, comp_cli, email_cli, dtnasc_cli, gen_cli FROM cadastro_cliente WHERE (id_cli = @IDCLI)">
            <SelectParameters>
                <asp:Parameter Name="IDCLI" />
            </SelectParameters>            
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="DSAlteração" runat="server" ConnectionString="<%$ ConnectionStrings:casadoacaiConnectionString %>"
            ProviderName="<%$ ConnectionStrings:casadoacaiConnectionString.ProviderName %>"
            UpdateCommand="UPDATE cadastro_cliente SET nome_cli = @NOME, senha_cli = @SENHA, cpf_cli = @CPF, tel_cli = @TELEFONE, cep_cli = @CEP, num_cli = @NUMERO, comp_cli = @COMP, email_cli = @EMAIL, dtnasc_cli = @DATANASC, gen_cli = @GENERO WHERE (id_cli = @IDCLI)">
            <UpdateParameters>
                <asp:SessionParameter Name="IDCLI" SessionField="idCli" />
                <asp:Parameter Name="NOME" />
                <asp:Parameter Name="CPF" />
                <asp:Parameter Name="EMAIL" />
                <asp:Parameter Name="SENHA" />
                <asp:Parameter Name="CEP" />
                <asp:Parameter Name="TELEFONE" />
                <asp:Parameter Name="COMP" />
                <asp:Parameter Name="NUMERO" />
                <asp:Parameter Name="DATANASC" />
                <asp:Parameter Name="GENERO" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
