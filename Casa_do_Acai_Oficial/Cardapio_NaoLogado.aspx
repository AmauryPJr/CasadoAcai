<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cardapio_NaoLogado.aspx.cs" Inherits="Cardapio_NaoLogado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Style/Style.css">
    <link rel="stylesheet" href="Style/Style_Menu.css">
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
                            <a class="nav-link" id="btn2" href="QuemNosSomos.aspx" onclick="mudarCor('btn2')">QUEM SOMOS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn3" href="Contato.aspx" onclick="mudarCor('btn3')">CONTATO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn4" href="Cardapio_NaoLogado.aspx" onclick="mudarCor('btn4')">CADÁPIO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn5" href="Login.aspx" onclick="mudarCor('btn5')">LOGIN</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="container-fluid">
            <div class=" row">
                <div class="col-12 col-md-6">
                    <div class="row" style="margin-top: 5%;">
                        <a>
                            <asp:Image runat="server" CssClass="prod1" ImageUrl="~/Imagens/Acai.png" Height="125px" Width="135px"/></a>
                        <a>
                            <asp:Image runat="server" CssClass="prod1" ImageUrl="~/Imagens/Sacole.png" Height="125px" Width="135px"/></a>
                        <a>
                            <asp:Image runat="server" CssClass="prod1" ImageUrl="~/Imagens/Geladinho.png" Height="125px" Width="135px"/></a>
                    </div>
                    <div class="row">
                        <a>
                            <asp:Image runat="server" CssClass="prod1" ImageUrl="~/Imagens/Sorvete.png" Height="125px" Width="135px"/></a>
                        <a>
                            <asp:Image runat="server" CssClass="prod1" ImageUrl="~/Imagens/Picole.png" Height="125px" Width="135px"/></a>
                        <a>
                            <asp:Image runat="server" CssClass="prod1" ImageUrl="~/Imagens/Cremosinho.png" Height="125px" Width="135px"/></a>
                    </div>
                </div>
                <div class="col-12 col-md-6" id="divSabor">
                    <h2 class="text-center" style="font-family: chicken-pie;">Nossos Sabores</h2>

                    <div id="textosNossoSabor">
                        <p class="text-center">
                            Aqui na CasaDoAç@í, nós trabalhamos com uma grande variedade de
                            sabores,<br>
                            para deliciar sua vida
                        </p>
                        <p class="text-center">
                            nossa empresa está no mercado para trazer o grande e gostoso sabor de um
                            sorvete,
                        </p>
                        <p class="text-center">feito e montado com o amor e carinho que você merece.</p>
                    </div>
                    <asp:Button runat="server" CssClass="btn" ID="btnLogin" Text="Login/Cadastro" OnClick="btnLogin_Click"/>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
