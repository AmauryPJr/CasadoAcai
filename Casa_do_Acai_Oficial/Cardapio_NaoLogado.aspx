<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cardapio_NaoLogado.aspx.cs" Inherits="Cardapio_NaoLogado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Style/Style.css">
    <link rel="stylesheet" href="Style/Style_Cardapio_NaoLogado.css">
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
        h2 {
            font-family: 'Segoe UI';
        }       

        #textosNossoSabor {
            text-align: center;
        }

        #textosNossoSabor p {
            font-family: 'Segoe UI';
        }
    </style>
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
                            <a class="nav-link" id="btn4" href="Cardapio_NaoLogado.aspx" onclick="mudarCor('btn4')">CARDÁPIO</a>
                        </li>
                        <li class="nav-item">
                            <asp:Literal runat="server" ID="lSair" />
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
                    <h2 class="text-center">Nossos Sabores</h2>

                    <div id="textosNossoSabor">
                        <p>
                            Aqui na CasaDoAç@í, nós trabalhamos com uma grande variedade de
                            sabores,<br>
                            para deliciar sua vida
                        </p>
                        <p>
                            nossa empresa está no mercado para trazer o grande e gostoso sabor de um
                            sorvete,
                        </p>
                        <p>feito e montado com o amor e carinho que você merece.</p>
                    </div>
                    <asp:Button runat="server" CssClass="btn" ID="btnLogin" Text="Login/Cadastro" OnClick="btnLogin_Click"/>
                </div>
            </div>
        </div>

        <div class="principal" style="position: absolute; bottom: 0; width: 100%">
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
