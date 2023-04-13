<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12.04.2023
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<head>
    <title>Божхона қиймати</title>
    <!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 11]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content=""/>
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded"/>
    <!-- Favicon icon -->
    <link rel="icon" href="${pageContext.servletContext.contextPath}/resources/assets/images/gtk.png" type="image/x-icon">

    <!-- prism css -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/prism-coy.css">
    <!-- vendor css -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/dataTables.bootstrap4.min.css">

    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/css/style.css">


</head>

<body>
<!-- [ Pre-loader ] start -->
<div class="loader-bg">
    <div class="loader-track">
        <div class="loader-fill"></div>
    </div>
</div>
<!-- [ Pre-loader ] End -->
<!-- [ navigation menu ] start -->
<nav class="pcoded-navbar theme-horizontal menu-light brand-blue">
    <div class="navbar-wrapper container-fluid">
        <div class="navbar-content sidenav-horizontal" id="layout-sidenav">
            <ul class="nav pcoded-inner-navbar sidenav-inner">

                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link "><span class="pcoded-micon"><i
                            class="feather icon-home text-dark"></i></span><span class="pcoded-mtext">Асосий саҳифа</span></a>

                </li>
                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #6fb6d5"><i
                            class="fas fa-copy "></i></span><span class="pcoded-mtext">Қарздорликлар ҳисоби</span></a>

                </li>
                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #36d038"><i
                            class="fas fa-file-signature"></i></span><span
                            class="pcoded-mtext">Дастлабки қарор</span><span class="pcoded-badge badge badge-success">100+</span></a>

                </li>
                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link"><span class="pcoded-micon" style="color: #bed52a"><i
                            class="fas fa-cog"></i></span><span class="pcoded-mtext">Мантиқий назорат</span></a>

                </li>

                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #2574c5"><i
                            class="fas fa-globe"></i></span><span class="pcoded-mtext">Халқаро сўровнома</span></a>

                </li>
                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #36d038"><i
                            class="fas fa-sliders-h"></i></span><span class="pcoded-mtext">Шартли божхона қиймати</span></a>

                </li>

                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #4fee51"><i
                            class="fas fa-list"></i></span><span class="pcoded-mtext">Божхона қиймати мониторинги</span></a>

                </li>
                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #b9bbba"><i
                            class="fas fa-copy"></i></span><span class="pcoded-mtext">Божхона қиймати бўйича қарор</span></a>

                </li>
                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #e58423"><i
                            class="fas fa-calculator"></i></span><span class="pcoded-mtext">Индекатив нархлар</span></a>

                </li>
                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #15d5da"><i
                            class="fas fa-history"></i></span><span class="pcoded-mtext">БЮД тарихи</span></a>

                </li>
                <li class="nav-item pcoded-hasmenu">
                    <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #1c4dcb"><i
                            class="fas fa-list-ul"></i></span><span class="pcoded-mtext">Божхона қийматини ҳавола қилиш тарихи</span></a>

                </li>

            </ul>
        </div>
    </div>
</nav>
<!-- [ navigation menu ] end -->
<!-- [ Header ] start -->
<header class="navbar pcoded-header navbar-expand-lg navbar-light header-blue">
    <div class="container-fluid">
        <div class="m-header">
            <a class="mobile-menu" id="mobile-collapse" href="#!"><span></span></a>
            <a href="#!" class="b-brand">
                <!-- ========   change your logo hear   ============ -->
                <img src="${pageContext.servletContext.contextPath}/resources/assets/images/gtk.png" style="width: 35px"
                     alt="" class="logo">
                <span class="ml-1 b-title f-18">Божхона қиймати</span>
            </a>

        </div>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
						<span class="d-inline-block m-b-0 text-white f-16">Админстратор БҚ (дастурчи) :
							<span style="text-decoration: underline">Шоймардонов Рустам</span></span>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="mr-5">
                    <div class="row ml-4">
                        <div class="col-sm-1 col-md-1 col-lg-2 col-xl-2 user_online">
                            <i class="fas fa-users f-20"></i>
                        </div>
                        <div class="col-sm-10 col-md-10 col-lg-10 col-xl-10 user_type">
                            Рўйхатдан ўтган фойдаланувчилар: 2000623 та <br>
                            Фаол фойдаланувчилар: 1000623 та
                        </div>
                    </div>
                </li>
                <li>
                    <div class="dropdown drp-user">
                        <a href="#" class="dropdown-toggle f-20" data-toggle="dropdown">
                            <i class="fas fa-user-circle "></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right profile-notification">
                            <div class="pro-head">
                                <img src="assets/images/user/avatar-5.jpg" class="img-radius" alt="User-Profile-Image">
                                <span>Рол</span>
                                <a href="#" class="dud-logout ml-1" title="Logout">
                                    <i class="feather icon-log-out"></i>
                                </a>
                            </div>
                            <ul class="pro-body">
                                <li><a href="#" class="dropdown-item"><i class="fas fa-user-circle "></i> Рол 1</a></li>
                                <li><a href="#" class="dropdown-item"><i class="fas fa-user-circle "></i> Рол 2</a></li>
                                <li><a href="#" class="dropdown-item"><i class="fas fa-user-circle "></i> Рол 3</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>

        </div>
    </div>
</header>
<!-- [ Header ] end -->

<!-- [ Main Content ] start -->
<div class="pcoded-main-container">
    <div class="pcoded-wrapper container-fluid">
        <div class="pcoded-content">
            <div class="pcoded-inner-content">
                <div class="main-body">
                    <div class="page-wrapper">
                        <div class="page-header">
                            <div class="page-block">
                                <div class="row align-items-center">
                                    <div class="col-sm-12 my-0 py-0 px-0 " style="vertical-align: middle">
                                        <div class="justify-content-center py-1 pb-2 mt-2">
                                            <div class="row m-0 justify-content-center">
                                                <div class="col-1 mx-2  p-0 text-center">
                                                    <label for="tif"
                                                           class="f-w-600"
                                                           style=" margin-right: 5px;">ТИФ ТН код </label>

                                                    <input type="text" id="tif"
                                                           class="form-control form-control-sm w-100 "
                                                           placeholder="8703 80 000 0">
                                                </div>

                                                <div class="col-1 mx-2  p-0 text-center">
                                                    <label for="tovar"
                                                           class="f-w-600"
                                                           style=" margin-right: 5px;">Товар номи </label>

                                                    <input type="text" id="tovar"
                                                           class="form-control form-control-sm w-100 "
                                                           placeholder="BYD">
                                                </div>
                                                <div class="col-2 mr-2  p-0 text-center">
                                                    <label for="country"
                                                           class="f-w-600"
                                                           style=" margin-right: 5px;">Юк жўнатувчи мамлакат </label>

                                                    <select id="country" class="form-control form-control-sm w-100 "
                                                    >
                                                        <option>156 Хитой</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                </div>
                                                <div class="col-2 mr-2  p-0 text-center">
                                                    <label for="country_made"
                                                           class="f-w-600"
                                                           style=" margin-right: 5px;">Келиб чиқиш мамлакати </label>
                                                    <select id="country_made"
                                                            class="form-control form-control-sm w-100 "
                                                    >
                                                        <option>410 Корея</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>

                                                </div>

                                                <div class="col-1 text-right m-0 p-0 mr-1">
                                                    <label for="minFirstDay"
                                                           class="f-w-600"
                                                           style=" margin-right: 5px;">дан: </label>

                                                    <input type="date" class="form-control form-control-sm w-100 "
                                                           maxlength="10" tabindex="1"
                                                           name="dcodate" id="minFirstDay" min="2020-01-01"
                                                           max="2023-12-31" value="2023-03-01">
                                                </div>
                                                <div class="col-1 text-right m-0 p-0"><label for="maxFirstDay"
                                                                                             class="f-w-600"
                                                                                             style=" margin-right: 5px;">гача: </label>

                                                    <input type="date" class="form-control form-control-sm w-100 "
                                                           maxlength="10" tabindex="2"
                                                           name="dcodate" id="maxFirstDay" min="2020-01-01"
                                                           max="2023-12-31" value="2023-04-11">
                                                </div>
                                                <div class="col-1 text-right ml-1 p-0 " style="margin-top: 28px">
                                                    <button type="button" tabindex="3"
                                                            class="btn btn-sm btn-outline-primary f-w-900 w-75 updateAppTableV1"
                                                            style="border-radius: 5px">
                                                        <i class="feather icon-search"></i>&nbsp;Излаш
                                                    </button>

                                                </div>
                                                <div class="col-1 text-right ml-1 p-0 " style="margin-top: 28px">
                                                    <button type="button" tabindex="3"
                                                            class="btn btn-sm btn-outline-success f-w-900 w-75 updateAppTableV1"
                                                            style="border-radius: 5px">
                                                        <i class="feather icon-bar-chart"></i>&nbsp;Ҳисобот
                                                    </button>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 p-4">
                                        <div id="main">
                                            <div class="container-fluid">
                                                <div class="accordion" id="faq">

                                                    <div class="card">
                                                        <div class="card-header" id="faqhead2">
                                                            <a href="#" class="btn btn-header-link collapsed" data-toggle="collapse" data-target="#faq2"
                                                               aria-expanded="true" aria-controls="faq2">Қўшимча қидирув филтрлари</a>
                                                        </div>

                                                        <div id="faq2" class="collapse" aria-labelledby="faqhead2" data-parent="#faq">
                                                            <div class="card-body">
                                                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                                                                moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                                                Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda
                                                                shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea
                                                                proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim
                                                                aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- [ Main Content ] start -->
                        <div class="row">
                            <!-- [ horizontal-layout ] start -->
                            <div class="col-sm-12">
                                <div class="mt-3 dt-responsive table-responsive p-4">
                                    <table id="footer-search" class="table table-striped table-bordered nowrap">
                                        <thead class="text-center">
                                        <tr>
                                            <th>№</th>
                                            <th>БЮД рақами</th>
                                            <th>ТИФ ТН код</th>
                                            <th>Режим</th>
                                            <th>Юк жўн. мамлакат</th>
                                            <th>Ишлаб чиқ. мамлакат</th>
                                            <th>Савдо қил. мамлакат</th>
                                            <th>Етк. бер. шарти</th>
                                            <th>Етк. бер. пункти</th>
                                            <th>Тран. тури</th>
                                            <th>Товар тўлиқ номи</th>
                                            <th>Марка</th>
                                            <th>Б.Қ. индекси АҚШ долл.</th>
                                            <th>Б.Қ. АҚШ долл.</th>
                                            <th>Ф.Қ. АҚШ долл.</th>
                                            <th>Метод</th>
                                            <th>Нетто</th>
                                            <th>Брутто</th>
                                        </tr>
                                        </thead>
                                        <tbody class="text-center justify-content-center">
                                        <tr>
                                            <td>1</td>
                                            <td>26010/01.01.2023/00001</td>
                                            <td>8703 80 000 0</td>
                                            <td>ИМ40</td>
                                            <td>156 Хитой</td>
                                            <td>410 Корея</td>
                                            <td>156 Хитой</td>
                                            <td>08 CIP</td>
                                            <td>Ташкент</td>
                                            <td>30 АВТО</td>
                                            <td>
                                                <textarea
                                                        style="resize: both; overflow: auto; width: 500px; background-color: unset; border: 0px !important; height: 70px;"
                                                        cols="5">1. Легковой электрический автомобиль (Электромобиль) BYD DOLPHIN, модель BYD7004BEV1, новый, 2022 года выпуска, мощность двигателя 70кВт, VIN:LC0CE4CC4N0150766, размер 4125*1770*1570 цвет СЕРЫЙ, № кузова:LC0CE4CC4N0150766, № двиг.: 1V2065048, об. дв. 0см3, цвет СЕРЫЙ, электрический, 2022г.в.</textarea>

                                            </td>
                                            <td>BYD</td>
                                            <td>5.85</td>
                                            <td>36 000</td>
                                            <td>36 000</td>
                                            <td>1-метод</td>
                                            <td>3 500</td>
                                            <td>3 600</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>26010/01.01.2023/00001</td>
                                            <td>8703 80 000 0</td>
                                            <td>ИМ40</td>
                                            <td>156 Хитой</td>
                                            <td>410 Корея</td>
                                            <td>156 Хитой</td>
                                            <td>08 CIP</td>
                                            <td>Ташкент</td>
                                            <td>30 АВТО</td>
                                            <td>
                                                <textarea
                                                        style="resize: both; overflow: auto; width: 500px; background-color: unset; border: 0px !important; height: 70px;"
                                                        cols="5">1. Легковой электрический автомобиль (Электромобиль) BYD DOLPHIN, модель BYD7004BEV1, новый, 2022 года выпуска, мощность двигателя 70кВт, VIN:LC0CE4CC4N0150766, размер 4125*1770*1570 цвет СЕРЫЙ, № кузова:LC0CE4CC4N0150766, № двиг.: 1V2065048, об. дв. 0см3, цвет СЕРЫЙ, электрический, 2022г.в.</textarea>

                                            </td>
                                            <td>BYD</td>
                                            <td>5.85</td>
                                            <td>36 000</td>
                                            <td>36 000</td>
                                            <td>1-метод</td>
                                            <td>3 500</td>
                                            <td>3 600</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>26010/01.01.2023/00001</td>
                                            <td>8703 80 000 0</td>
                                            <td>ИМ40</td>
                                            <td>156 Хитой</td>
                                            <td>410 Корея</td>
                                            <td>156 Хитой</td>
                                            <td>08 CIP</td>
                                            <td>Ташкент</td>
                                            <td>30 АВТО</td>
                                            <td>
                                                <textarea
                                                        style="resize: both; overflow: auto; width: 500px; background-color: unset; border: 0px !important; height: 70px;"
                                                        cols="5">1. Легковой электрический автомобиль (Электромобиль) BYD DOLPHIN, модель BYD7004BEV1, новый, 2022 года выпуска, мощность двигателя 70кВт, VIN:LC0CE4CC4N0150766, размер 4125*1770*1570 цвет СЕРЫЙ, № кузова:LC0CE4CC4N0150766, № двиг.: 1V2065048, об. дв. 0см3, цвет СЕРЫЙ, электрический, 2022г.в.</textarea>

                                            </td>
                                            <td>BYD</td>
                                            <td>5.85</td>
                                            <td>36 000</td>
                                            <td>36 000</td>
                                            <td>1-метод</td>
                                            <td>3 500</td>
                                            <td>3 600</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>26010/01.01.2023/00001</td>
                                            <td>8703 80 000 0</td>
                                            <td>ИМ40</td>
                                            <td>156 Хитой</td>
                                            <td>410 Корея</td>
                                            <td>156 Хитой</td>
                                            <td>08 CIP</td>
                                            <td>Ташкент</td>
                                            <td>30 АВТО</td>
                                            <td>
                                                <textarea
                                                        style="resize: both; overflow: auto; width: 500px; background-color: unset; border: 0px !important; height: 70px;"
                                                        cols="5">1. Легковой электрический автомобиль (Электромобиль) BYD DOLPHIN, модель BYD7004BEV1, новый, 2022 года выпуска, мощность двигателя 70кВт, VIN:LC0CE4CC4N0150766, размер 4125*1770*1570 цвет СЕРЫЙ, № кузова:LC0CE4CC4N0150766, № двиг.: 1V2065048, об. дв. 0см3, цвет СЕРЫЙ, электрический, 2022г.в.</textarea>

                                            </td>
                                            <td>BYD</td>
                                            <td>5.85</td>
                                            <td>36 000</td>
                                            <td>36 000</td>
                                            <td>1-метод</td>
                                            <td>3 500</td>
                                            <td>3 600</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>26010/01.01.2023/00001</td>
                                            <td>8703 80 000 0</td>
                                            <td>ИМ40</td>
                                            <td>156 Хитой</td>
                                            <td>410 Корея</td>
                                            <td>156 Хитой</td>
                                            <td>08 CIP</td>
                                            <td>Ташкент</td>
                                            <td>30 АВТО</td>
                                            <td>
                                                <textarea
                                                        style="resize: both; overflow: auto; width: 500px; background-color: unset; border: 0px !important; height: 70px;"
                                                        cols="5">1. Легковой электрический автомобиль (Электромобиль) BYD DOLPHIN, модель BYD7004BEV1, новый, 2022 года выпуска, мощность двигателя 70кВт, VIN:LC0CE4CC4N0150766, размер 4125*1770*1570 цвет СЕРЫЙ, № кузова:LC0CE4CC4N0150766, № двиг.: 1V2065048, об. дв. 0см3, цвет СЕРЫЙ, электрический, 2022г.в.</textarea>

                                            </td>
                                            <td>BYD</td>
                                            <td>5.85</td>
                                            <td>36 000</td>
                                            <td>36 000</td>
                                            <td>1-метод</td>
                                            <td>3 500</td>
                                            <td>3 600</td>
                                        </tr>


                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>

                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <!-- [ horizontal-layout ] end -->
                        </div>
                        <!-- [ Main Content ] end -->
                        <!-- [ Main Content ] start -->

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Required Js -->
<script src="${pageContext.servletContext.contextPath}/resources/assets/js/vendor-all.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/js/ripple.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/js/pcoded.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/js/menu-setting.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/jquery.dataTables.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/js/pages/data-api-custom.js"></script>


<!-- prism Js -->
<script src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/prism.js"></script>


<script src="${pageContext.servletContext.contextPath}/resources/assets/js/horizontal-menu.js"></script>
<script>
    (function () {
        if ($('#layout-sidenav').hasClass('sidenav-horizontal') || window.layoutHelpers.isSmallScreen()) {
            return;
        }
        try {
            window.layoutHelpers._getSetting("Rtl")
            window.layoutHelpers.setCollapsed(
                localStorage.getItem('layoutCollapsed') === 'true',
                false
            );
        } catch (e) {
        }
    })();
    $(function () {
        $('#layout-sidenav').each(function () {
            new SideNav(this, {
                orientation: $(this).hasClass('sidenav-horizontal') ? 'horizontal' : 'vertical'
            });
        });
        $('body').on('click', '.layout-sidenav-toggle', function (e) {
            e.preventDefault();
            window.layoutHelpers.toggleCollapsed();
            if (!window.layoutHelpers.isSmallScreen()) {
                try {
                    localStorage.setItem('layoutCollapsed', String(window.layoutHelpers.isCollapsed()));
                } catch (e) {
                }
            }
        });
    });
    $(document).ready(function () {
        $("#pcoded").pcodedmenu({
            themelayout: 'horizontal',
            MenuTrigger: 'hover',
            SubMenuTrigger: 'hover',
        });
    });
</script>

<script src="${pageContext.servletContext.contextPath}/resources/assets/js/analytics.js"></script>

</body>

</html>
