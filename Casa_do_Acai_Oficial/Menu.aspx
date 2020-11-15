<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="_Default" %>

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
                        <a class="nav-link" id="btn5" href="Login.aspx" onclick="mudarCor('btn5')">LOGIN</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>

    <div class="container" id="slides">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="Imagens/Banner1.png" class="d-block w-100 " alt="...">
                </div>
                <div class="carousel-item">
                    <img src="Imagens/Banner2.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="Imagens/Banner3.png" class="d-block w-100" alt="...">
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

    <div class=" row" id="banner1">
        <div class="esquerda col-6">
            <!-- <img src="../assets/public/img/banner2.png">  -->
        </div>
        <div class="direita col-6">
            <!-- <p>Teste para ver</p> -->
        </div>
    </div>

    <div class="principal" style="margin-top: 5px;">
        <div class="row container-fluid ">
            <div class="col-12 col-md-3 text-center">
                <p class="tituloFooter">ENDEREÇO</p>
                <p class="textoFooter">Rua H30B, 108 </p>
                <p class="textoFooter">Campus do CTA</p>
                <p class="textoFooter"> São José dos Campos</p>
            </div>
            <div class="col-12 col-md-3 text-center">
                <p class="tituloFooter">CONTATO</p>

                <p class="textoFooter">joao03araujo@gmail.com</p>
                <p class="textoFooter"> Tel : (12) 99709-2686</p>

            </div>

            <div class="col-12 col-md-3 text-center">
                <p class="tituloFooter">HORÁRIOS</p>

                <p class="textoFooter">ABERTO DE SEG À SEX </p>
                <p class="textoFooter">09:00 - 22:00</p><br>

                <p class="textoFooter">SÁB/DOM e FERIADOS </p>
                <p class="textoFooter" style="margin-bottom: 4px;"> 13:00 - 21:00</p>

            </div>

            <div class="col-12 col-md-3 text-center">
                <p>Logo</p>
                <a><i class="fa fa-facebook fa-lg icon" aria-hidden="true"></i></a>
                <a><i class="fa fa-instagram fa-lg icon" aria-hidden="true"></i></a>

            </div>
        </div>
        <div class="divCopy">
            <p class="textoCopy text-center"><i class="fa fa-copyright" aria-hidden="true"></i> Todos os direitos
                reservados a MNT-Gaming 2020</p>
        </div>
    </div>
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

            } else {

                if (elemento == 'btn2') {
                    $('#btn2').addClass('mudar_cor')
                    $('#btn1').removeClass('mudar_cor')
                    $('#btn3').removeClass('mudar_cor')
                    $('#btn4').removeClass('mudar_cor')
                    $('#btn5').removeClass('mudar_cor')

                } else {

                    if (elemento == 'btn3') {
                        $('#btn3').addClass('mudar_cor')
                        $('#btn1').removeClass('mudar_cor')
                        $('#btn2').removeClass('mudar_cor')
                        $('#btn4').removeClass('mudar_cor')
                        $('#btn5').removeClass('mudar_cor')
                    } else {
                        if (elemento == 'btn4') {
                            $('#btn4').addClass('mudar_cor')
                            $('#btn1').removeClass('mudar_cor')
                            $('#btn2').removeClass('mudar_cor')
                            $('#btn3').removeClass('mudar_cor')
                            $('#btn5').removeClass('mudar_cor')
                        } else {
                            if (elemento == 'btn5') {
                                $('#btn5').addClass('mudar_cor')
                                $('#btn1').removeClass('mudar_cor')
                                $('#btn2').removeClass('mudar_cor')
                                $('#btn3').removeClass('mudar_cor')
                                $('#btn4').removeClass('mudar_cor')
                            }
                        }
                    }
                }
            }
        }
    </script>
    <script src="assets/js/jquery-3.3.1.slim.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>

