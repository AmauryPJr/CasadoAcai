<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu_Logado.aspx.cs" Inherits="Menu_Logado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Style/Style.css">
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
                <a class="navbar-brand" href="Menu.aspx" style="margin-left: 17%;" id="a"><asp:Image runat="server" ImageUrl="~/Imagens/Logo Casa do Acai.png" Height="90px" Width="150px"/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav" id="textoNav">
                        <li class="nav-item">
                            <a class="nav-link" id="btn1" href="Menu_Logado.aspx" onclick="mudarCor('btn1')">INÍCIO <span
                                class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn2" href="QuemNosSomos.aspx" onclick="mudarCor('btn2')">QUEM SOMOS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn3" href="Contato.aspx" onclick="mudarCor('btn3')">CONTATO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btn4" href="Cardapio_Logado.aspx" onclick="mudarCor('btn4')">CARDÁPIO</a>
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

        <div class="text-body">
            <div class="text-center">
                <asp:Label ID="lblBemVindo" runat="server" Font-Names="CHICKEN Pie" Font-Size="18pt"></asp:Label>
            </div>
        </div>

        <div class="container-fluid" style="height: 400px; width: 100%;" id="slides">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="Imagens/Banner1.png" class="d-block" style="height: 400px; width: 100%;"
                        alt="...">
                </div>
                <div class="carousel-item">
                    <img src="Imagens/Banner2.png" class="d-block" style="height: 400px; width: 100%;"
                        alt="...">
                </div>
                <div class="carousel-item">
                    <img src="Imagens/Banner5.png" class="d-block" style="height: 400px; width: 100%;"
                        alt="...">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>  
    </div>

    <div class="container-fluid ">
        <div class="row" id="banner1" style="height: 320px;">
            <div class="col-12 col-md-6" id="esquerda">
                <img src="Imagens/Banner1.png" style="width: 100%; float: left;">
            </div>
            <div class="col-12 col-md-6" id="direita">
                <h2 class="text-center" style="font-family: chicken pie;">Nossos Sabores</h2>
                <p class="text-center" style="font-family: chicken pie;">
                    Temos diversos sabores para serem
                    esperimentados,<br>
                    venha conferir!
                </p>
                <a href="Cardapio_Logado.aspx">
                    <button class="btn" id="btnCardapio">Cardápio</button></a>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row banner2">
            <div class="col-12 col-md-6" id="esquerda2">
                <h2 class="text-center" style="font-family: chicken pie; margin-top: 10%;">Espaço casa do Aç@í</h2>
                <h3 class="text-center" style="font-family: chicken pie;">Quem Somos</h3>
                <p class="text-center" style="font-family: chicken pie;">
                    Nós somos uma empresa que está a um certo tempo
                    no mercado,
                        <br>
                    somos uma empresa pequena com o foco de crescer.
                </p>
                <a href="QuemNosSomos.aspx">
                    <button class="btn" id="btnQuemSomos">Quem Somos</button></a>
            </div>
            <div class="col-12 col-md-6" id="direita2">
                <img src="Imagens/Banner2.png" style="width: 100%; float: left;">
            </div>
        </div>
    </div>

    <div class="container-fluid ">
        <div class="row" id="banner1" style="height: 350px;">
            <div class="col-12 col-md-6" id="esquerda">
                <img src="Imagens/Banner4.png" style="width: 100%; height: 310px;float: left;">
            </div>
            <div class="col-12 col-md-6" id="direita">
                <h2 class="text-center" style="font-family: chicken pie;">Sorvetes</h2>
                <h3 class="text-center" style="font-family: chicken pie;">+ de 10 sabores</h3>
                <p class="text-center" style="font-family: chicken pie;">
                    Nós temos diversos sabores de sorvetes,
                    contendo uma enorme quantia,<br>
                    para que nossos clientes tenham a melhor escolha.
                </p>
                <a href="Cardapio_Logado.aspx"<button class="btn" id="btnCardapio2">Cardápio</button></a>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12" style="font-size: 20px; font-family: chicken pie; height: 50px;">
                <p class="text-center" style="margin-top: 10px;">#CASADOAÇ@I</p>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="propaganda">
            <div class="col-12">
                <img src="Imagens/Banner1.png" style="height: 300px; width: 33%;" alt="">
                <img src="Imagens/Banner4.png" style="height: 300px; width: 33%;" alt="">
                <img src="Imagens/Banner6.png" style="height: 300px; width: 33%;" alt="">
            </div>
        </div>
    </div>

        <div class="principal" style="margin-top: 5px;">
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
                    <p><asp:Image runat="server" ImageUrl="~/Imagens/Logo Casa do Acai.png" Height="90px" Width="150px"/></p>
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

    <script>
        $('.carousel').carousel()

        $('#btn1').addClass('mudar_cor')


        function mudarCor(elemento) {

            if (elemento == 'btn1') {
                $('#btn1').addClass('mudar_cor')
                $('#btn2').removeClass('mudar_cor')
                $('#btn3').removeClass('mudar_cor')
                $('#btn4').removeClass('mudar_cor')
                $('#btn5').removeClass('mudar_cor')
                $('#btn6').removeClass('mudar_cor')
                $('#btn7').removeClass('mudar_cor')
            } else {

                if (elemento == 'btn2') {
                    $('#btn2').addClass('mudar_cor')
                    $('#btn1').removeClass('mudar_cor')
                    $('#btn3').removeClass('mudar_cor')
                    $('#btn4').removeClass('mudar_cor')
                    $('#btn5').removeClass('mudar_cor')
                    $('#btn6').removeClass('mudar_cor')
                    $('#btn7').removeClass('mudar_cor')
                } else {

                    if (elemento == 'btn3') {
                        $('#btn3').addClass('mudar_cor')
                        $('#btn1').removeClass('mudar_cor')
                        $('#btn2').removeClass('mudar_cor')
                        $('#btn4').removeClass('mudar_cor')
                        $('#btn5').removeClass('mudar_cor')
                        $('#btn6').removeClass('mudar_cor')
                        $('#btn7').removeClass('mudar_cor')
                    } else {

                        if (elemento == 'btn4') {
                            $('#btn4').addClass('mudar_cor')
                            $('#btn1').removeClass('mudar_cor')
                            $('#btn2').removeClass('mudar_cor')
                            $('#btn3').removeClass('mudar_cor')
                            $('#btn5').removeClass('mudar_cor')
                            $('#btn6').removeClass('mudar_cor')
                            $('#btn7').removeClass('mudar_cor')
                        } else {

                            if (elemento == 'btn5') {
                                $('#btn5').addClass('mudar_cor')
                                $('#btn1').removeClass('mudar_cor')
                                $('#btn2').removeClass('mudar_cor')
                                $('#btn3').removeClass('mudar_cor')
                                $('#btn4').removeClass('mudar_cor')
                                $('#btn6').removeClass('mudar_cor')
                                $('#btn7').removeClass('mudar_cor')
                            } else {

                                if (elemento == 'btn6') {
                                    $('#btn6').addClass('mudar_cor')
                                    $('#btn1').removeClass('mudar_cor')
                                    $('#btn2').removeClass('mudar_cor')
                                    $('#btn3').removeClass('mudar_cor')
                                    $('#btn4').removeClass('mudar_cor')
                                    $('#btn5').removeClass('mudar_cor')
                                    $('#btn7').removeClass('mudar_cor')
                                } else {

                                    if (elemento == 'btn7') {
                                        $('#btn7').addClass('mudar_cor')
                                        $('#btn1').removeClass('mudar_cor')
                                        $('#btn2').removeClass('mudar_cor')
                                        $('#btn3').removeClass('mudar_cor')
                                        $('#btn4').removeClass('mudar_cor')
                                        $('#btn5').removeClass('mudar_cor')
                                        $('#btn6').removeClass('mudar_cor')
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

    </script>
    <script src="Scripts/jquery-3.3.1.slim.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
