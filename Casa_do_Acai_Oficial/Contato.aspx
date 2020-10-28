<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contato.aspx.cs" Inherits="Contato" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.3/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="Style/Style.css">
    <link rel="stylesheet" href="Style/Style_Contato.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>CasaDoAç@í</title>
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
                            <a class="nav-link" id="btn4" href="Cardapio.aspx" onclick="mudarCor('btn4')">CADÁPIO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn5" href="Login.aspx" onclick="mudarCor('btn5')">LOGIN</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-md-4">
                    <div class="login-box">
                        <h1>Contato</h1>
                        <p>Entre em contato conosco para tirar<br>
                            sua duvida ou dar sugestões.</p>
                        <p>Basta preencher os campos com<br>
                            as suas informações</p>
                    </div>
                    <div class="card">
                        <div class="card-body login-box">
                            <div class="textBox">
                                <i class="fa fa-user-circle" aria-hidden="true"></i>
                                <input type="text" id="nome" name=""
                                    value="" placeholder="Nome">
                            </div>
                            <div class="textBox">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                                <input type="text" id="email" name=""
                                    value="" placeholder="E-mail">
                            </div>
                            <div class="textBox">
                                <input type="text" id="assunto" name="" value="" placeholder="Assunto">
                            </div>
                            <div>
                                <textarea type="textarea" name="" value="" placeholder="Mensagem"></textarea>
                            </div>
                            <asp:Button runat="server" class="btn" ID="btnEnviar" Text="Enviar" />
                        </div>
                    </div>
                </div>
                <div style="margin-top: 1px;" class="col-12 col-md-8 mapa" id="divMapa">
                    <h4>ENDEREÇO</h4>
                    <div id="divTextos">
                        <p style="text-align: left; margin-top: 10px">Rua H30B, 108 - Campus do CTA, São José dos Campos</p>
                    </div>
                    <div class="row justify-content-center" id="mapa">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3667.1287643317028!2d-45.868106585552674!3d-23.20197755430249!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94cc4baad55d158d%3A0xee4bb33f23484e63!2sR.%20H30B%2C%20108%20-%20Campus%20do%20CTA%2C%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20SP%2C%2012228-800!5e0!3m2!1spt-BR!2sbr!4v1603833171008!5m2!1spt-BR!2sbr"
                            width="600" height="450" frameborder="0" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
