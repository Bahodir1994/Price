<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/locale.jsp" %>
<head>
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/dataTables.bootstrap4.min.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/fixedColumns.bootstrap4.min.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/fixedHeader.bootstrap4.min.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/jquery.dataTables.colResize.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/buttons.dataTables.min.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/buttons.bootstrap4.min.css">
    <style>
        textarea {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            width: 100% !important;
        }

        .resize-drag {
            border-radius: 8px;
            /*padding: 20px;*/
            margin: 0.2rem;
            /*background-color: #29e;*/
            /*color: white;*/
            /*font-size: 20px;*/
            /*font-family: sans-serif;*/

            touch-action: none;

            /* This makes things *much* easier */
            box-sizing: border-box;
        }
        .resize-drag2 {
            border-radius: 8px;
            /*padding: 20px;*/
            margin: 0.2rem;
            /*background-color: #29e;*/
            /*color: white;*/
            /*font-size: 20px;*/
            /*font-family: sans-serif;*/

            touch-action: none;

            /* This makes things *much* easier */
            box-sizing: border-box;
        }

        .page-container {
            margin: 20px;
        }

        .panel-container {
            display: flex;
            flex-direction: row;
            border: 1px solid silver;
            overflow: hidden;

            /* avoid browser level touch actions */
            xtouch-action: none;
        }
        .panel-container-vertical {
            display: flex;
            flex-direction: column;
            height: 85vh;
            border: 1px solid silver;
            overflow: hidden;
        }

        .panel-left {
            flex: 0 0 auto;
            /* only manually resize */
            padding: 10px;
            width: 100%;
            min-height: 200px;
            min-width: 35vw;
            white-space: nowrap;
        }
        .panel-right {
            flex: 1 1 auto;
            /* resizable */
            padding: 10px;
            width: 100%;
            min-height: 200px;
            min-width: 30vw;
        }

        .splitter {
            margin-left: 5px;
            margin-right: 5px;
            flex: 0 0 auto;
            width: 15px;
            background: url(https://raw.githubusercontent.com/RickStrahl/jquery-resizable/master/assets/vsizegrip.png) center center no-repeat #ffffff;
            min-height: 200px;
            cursor: col-resize;
        }
        .splitter-horizontal {
            margin-top: 5px;
            margin-bottom: 5px;
            flex: 0 0 auto;
            height: 15px;
            background: url(https://raw.githubusercontent.com/RickStrahl/jquery-resizable/master/assets/hsizegrip.png) center center no-repeat #ffffff;
            cursor: row-resize;
            /*border: 1px solid black;*/
            box-shadow: 5px 5px 10px 1px;
        }

        .panel-top {
            flex: 0 0 auto;
            /* only manually resize */
            padding: 10px;
            height: 45vh;
            width: 98%;
            white-space: nowrap;
            overflow-y: auto;
        }
        .panel-bottom {
            flex: 1 1 auto;
            /* resizable */
            padding: 10px;
            height: 40vh;
            overflow-y: auto;
        }

         pre {
            margin: 20px;
            padding: 10px;
            background: #eee;
            border: 1px solid silver;
            border-radius: 4px;
            overflow: auto;
        }
    </style>
</head>
<body>
    <div class="page-wrapper">
        <div class="page-header">
            <div class="page-block d-flex justify-content-between">
                <div class="panel-container">
                    <div class="card resize-drag m-1 panel-left">
                        <div class="panel-container-vertical">
                            <div class="card-body m-3 panel-top" style="border: 1px dashed #0a58ca">
                                <div class="d-flex bd-highlight">
                                    <div class="btn-group p-2">
                                        <span class="text-primary bd-highlight">
                                            <button type="button" class="btn btn-outline-primary dropdown-toggle btn-sm appDocList" id="appDocList" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fa fa-file-archive fa-lg"></i>&nbsp;&nbsp; Ҳужжатлар
                                            </button>
                                            <div class="dropdown-menu shadow mt-0 pt-0">
                                                <table class="table table-striped row-border order-column table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>№</th>
                                                            <th>Хужжат тури</th>
                                                            <th>Хужжат рақами</th>
                                                            <th>Хужжат санаси</th>
                                                            <th>Yuklash/Ochish</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="dropDownDocList">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </span>
                                    </div>
                                    <div class="text-primary bd-highlight p-2">
                                        <button type="button" onclick="openApplicationHistoryModal()" class="btn btn-outline-primary btn-sm appDocList" data-toggle="modal" data-target=".applicationHstoryModal">
                                            <i class="fa fa-history fa-lg"></i>&nbsp;&nbsp;Ариза тарихи
                                        </button>
                                    </div>
                                    <div class="ml-auto p-2 bd-highlight">
                                        <h5>
                                            <b>Ариза</b> №:<u class="text-primary appNumAndDate"></u>
                                        </h5>
                                    </div>
                                </div>
                                <div class="row mt-1">
                                    <div class="col-sm-12 p-2">
                                        <div id="main">
                                            <div class="container-fluid">
                                                <div class="" id="faq">
                                                    <div class="card m-0">
                                                        <div class="card-header" id="faqhead2">
                                                            <a href="#" class="btn btn-header-link collapsed" data-toggle="collapse"
                                                               data-target="#faq2" aria-expanded="true" aria-controls="faq2">Маълумотлар</a>
                                                        </div>
                                                        <div id="faq2" class="collapse" aria-labelledby="faqhead2" data-parent="#faq">
                                                            <div class="d-flex justify-content-around invoice-info w-100">
                                                                <div class="col-4 col-lg-4 border-right">
                                                                    <div class="container table-responsive">
                                                                        <table class="table table-sm mt-1">
                                                                            <tbody>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Аризачи:</td>
                                                                                <td style="height: 0.4vh!important;" class="personFio"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Сотувчи:</td>
                                                                                <td style="height: 0.4vh!important;" class="customerCountryNmAndSellerOrg"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Телефон рақами:</td>
                                                                                <td style="height: 0.4vh!important;" class="personPhone"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Импортёр номи:</td>
                                                                                <td style="height: 0.4vh!important;" class="importerNm"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Юк жўнатувчи:</td>
                                                                                <td style="height: 0.4vh!important;" class="senderCountryNmAndSenderOrg"></td>
                                                                            </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <div class="col-4 col-lg-4 border-left border-right">
                                                                    <div class="container table-responsive">
                                                                        <table class="table table-sm mt-1">
                                                                            <tbody>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Импортёр СТИРи:</td>
                                                                                <td style="height: 0.4vh!important;" class="importerTin"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Ваколатли шахс ЖШШИРи:</td>
                                                                                <td style="height: 0.4vh!important;" class="authorizedPersonPinAndAuthorizedPersonDoc"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Ваколатини тасдиқловчи хужжат:</td>
                                                                                <td style="height: 0.4vh!important;" class="stateNumberAndStateNumberDate"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Божхона қиймати:</td>
                                                                                <td style="height: 0.4vh!important;" class="customsPriceSumAndCustomsPriceCurrency"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Фактура қиймати:</td>
                                                                                <td style="height: 0.4vh!important;" class="priceSumAndCustomsPriceCurrency"></td>
                                                                            </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <div class="col-4 col-lg-4 border-left">
                                                                    <div class="container table-responsive">
                                                                        <table class="table table-sm mt-1">
                                                                            <tbody>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Нетто оғирлиги:</td>
                                                                                <td style="height: 0.4vh!important;" class="nettoSum">0.00 кг</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Брутто оғирлиги:</td>
                                                                                <td style="height: 0.4vh!important;" class="bruttoSum">0.00 кг</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Етказиб бериш шарти:</td>
                                                                                <td style="height: 0.4vh!important;" class="termsNmAndTermsAddr"> -</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Транспорт харажатлари:</td>
                                                                                <td style="height: 0.4vh!important;">
                                                                                    <a type="button" onclick="openTransportTypeTableModal()"
                                                                                       class="btn btn-outline-primary btn-sm"
                                                                                       data-toggle="modal"
                                                                                       data-target=".transportTypTableeModal">
                                                                                        <u class="transportTypTableeModalButton"></u>
                                                                                        <i class="fas fa-info-circle"></i>
                                                                                    </a>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 0.4vh!important;">Ваколатини тасдиқловчи хужжат:</td>
                                                                                <td style="height: 0.4vh!important;" class="stateNumberAndStateNumberDate"> -</td>
                                                                            </tr>
                                                                            </tbody>
                                                                        </table>
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
                                <div class="mt-0 dt-responsive p-2">
                                    <table id="app_table_02" class="table table-striped row-border order-column table-bordered" cellspacing="0" style="width: 100%"></table>
                                </div>
                            </div>
                            <div class="splitter-horizontal">
                            </div>
                            <div class="card-body m-3 panel-bottom" style="border: 1px dashed #0a58ca">
                                <div class="row d-flex align-self-center">
                                    <div class="p-1">
                                        <select class="selectpicker form-control show-menu-arrow cmdtHsCode"
                                                data-style="form-control form-control-sm" id="cmdtHsCode" multiple
                                                data-selected-text-format="count > 3" data-actions-box="true"
                                                data-live-search="true">
                                            <c:forEach items="${cmdtIdList}" var="cmdt" varStatus="i">
                                                <option class="option-class" value="${cmdt.id}">${cmdt.hsCode}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="p-1">
                                        <button type="button" id="btn-add" class="btn btn-outline-primary btn-sm btn-add ml-2"><i class="fas fa-table"></i> Тўлов хисоблаш</button>
                                    </div>
                                    <div class="p-1">
                                        <button type="button" id="btn-send" class="btn btn-outline-primary btn-sm btn-add ml-2"><i class="fas fa-save"></i>Тадиқлашга</button>
                                    </div>

                                    <div class="ml-auto p-1">
                                        <h5 class="font-weight-bold">Ҳисобланган тўловлар</h5>
                                    </div>
                                </div>
                                <div class="mt-0 dt-responsive p-1">
                                    <table id="app_table_04" class="table table-striped row-border order-column table-bordered" cellspacing="0" style="width: 100%"></table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="splitter shadow-lg">
                    </div>
                    <div class="card resize-drag2 d-none m-1 panel-right">
                            <div class="card-header border-bottom border-primary d-flex justify-content-between">
                                <h5>Хужжатлар</h5>
                                <button type="button" class="close closeDocOpener"  onclick="clearDocViewer()" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="card-body docViewer m-1" style="border: 1px dashed #0a58ca">
                                <!-- open doc here -->
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <div class="modal fade transportTypTableeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #7497ea">
                        <h5 class="modal-title" id="exampleModalLabel">Транспорт ҳаракати йўналиши ва харажатлари</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body mt-0 dt-responsive p-2">
                        <table id="app_table_03" class="table table-striped row-border order-column table-bordered nowrap" cellspacing="0" style="width: 100%"></table>
                    </div>
                    <%--                    <div class="modal-footer">--%>
                    <%--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                    <%--                        <button type="button" class="btn btn-primary">Send message</button>--%>
                    <%--                    </div>--%>
                </div>
            </div>
        </div>
        <div class="modal fade applicationHstoryModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #7497ea">
                        <h5 class="modal-title" id="applicationHistoryModalLabel">Ариза мақомлари тарихи</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body mt-0 dt-responsive p-2">
                        <table id="app_table_05" class="table table-striped row-border order-column table-bordered nowrap" cellspacing="0" style="width: 100%"></table>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleExtraLargeModal3" tabindex="-1" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Танланган усулдан олдинги усулни қўлламаслик сабаблари</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table tableMethodDesc">
                                    <thead>
                                    <tr>
                                        <th>Божхона қийматини аниқлаш усули</th>
                                        <th>Аввалги усулларни қўлламаслик сабаблари</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleExtraLargeModal4" tabindex="-1" aria-hidden="true" style="display: none;">
            <c:forEach var="its" items="${appInfo}">
                <input class="appIdForm" type="hidden" value="${its[0]}">
            </c:forEach>
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header bg-primary">
                        <h5 class="modal-title text-white">
                            Аризани қайтариш тури ва сабаблари
                        </h5>
                    </div>
                    <div class="modal-body">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item border border-success w-50" role="presentation">
                                <button onclick="clickl(1)" class="nav-link thisbtn1 active btn btn-outline-success bg-success text-dark w-100" id="home-tab"
                                        data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Аризани кўриб чиқишни рад этиш
                                </button>
                            </li>
                            <li class="nav-item border border-success w-50" role="presentation">
                                <button onclick="clickl(2)" class="nav-link thisbtn2 btn btn-outline-success text-dark w-100" id="profile-tab" data-bs-toggle="tab"
                                        data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">
                                    Рад этишга тайёрлаш
                                </button>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active mt-4" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <form method="post" class="" id="fm1" name="fm1">
                                    <table class="table table-responsive">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Сабаб</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="vals1" items="${rollbackInfoForFirst}" varStatus="i">
                                            <tr>
                                                <td><input class="form-check-input" type="checkbox" value="${vals1.id}" id="${vals1.id}"></td>
                                                <td scope="row">${vals1.rollbackName}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="ExceptionSpravochnik"></div>

                                    <table class="table table-responsive mt-3">
                                        <thead>
                                        <tr>
                                            <th colspan="2" scope="col">Изох киритинг</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td scope="row">
                                                <textarea class="form-control" id="textareaFor1" rows="3"></textarea>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="ExceptionComment"></div>
                                </form>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary btnCloseModalRollback" data-bs-dismiss="modal">Ёпиш</button>
                                    <button type="button" title="Манфаатдор шахсга аризага тузатиш</br> ва қўшимчалар киритиш учун юбориш" class="btn btn-primary"
                                            onclick="javascript:appRollback(1);">Жўнатиш
                                    </button>
                                </div>
                            </div>
                            <div class="tab-pane fade mt-4" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <form method="post" class="" id="fm2" name="fm2">
                                    <table class="table table-responsive">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Сабаб</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="vals2" items="${rollbackInfoForSecond}" varStatus="i">
                                            <tr>
                                                <td><input class="form-check-input" type="checkbox" value="${vals2.id}" id="${vals2.id}"></td>
                                                <td scope="row">${vals2.rollbackName}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="ExceptionSpravochnik2"></div>
                                    <table class="table table-responsive mt-3">
                                        <thead>
                                        <tr>
                                            <th colspan="2" scope="col">Изох киритинг</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td scope="row">
                                                <textarea class="form-control" id="textareaFor2" rows="3"></textarea>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="ExceptionComment2"></div>
                                </form>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Ёпиш</button>
                                    <button type="button" class="btn btn-primary" onclick="javascript:appRollback(2);">Рад этишга киритиш</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleExtraLargeModal5" tabindex="-1" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-dialog-scrollable modal-xl">
                <div class="modal-content">
                    <div class="modal-header bg-primary">
                        <h5 class="modal-title text-white">
                            Ариза мақоми бўйича тарихи
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрывать"></button>
                    </div>
                    <div class="modal-body table-responsive-sm">
                        <table id="records_table" class="table table-sm table-bordered">
                            <thead style="position:sticky;" class="">
                            <tr>
                                <th style="position:sticky;" class="text-center classTableSm">T/p</th>
                                <th style="position:sticky;" class="text-center classTableSm">Мақоми</th>
                                <th style="position:sticky;" class="text-center classTableSm">Вақти</th>
                                <th style="position:sticky;" class="text-center classTableSm">Ходим</th>
                                <th style="position:sticky;" class="text-center classTableSm">Тақсимланган ходим</th>
                                <th style="position:sticky;" class="text-center classTableSm">Изоҳ</th>
                            </tr>
                            </thead>
                            <tbody class="tbodyForAppHistory">

                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btnCloseModalStatusHistory" data-bs-dismiss="modal">Ёпиш</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="divcalculate">
        </div>
    </div>
<%--    <script src="https://cdn.jsdelivr.net/npm/interactjs/dist/interact.min.js"></script>--%>
    <script src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/jquery-resizable.js"></script>
    <script>
        $('.selectpicker').selectpicker();
        var sessionData = ${sessionGetterDataValue};
        var applicationId = ${appId};
        var cmdtIdListMapper = ${cmdtIdListMapper};

        var app_table_02 = $('#app_table_02').DataTable({
            scrollY: '60vh',
            scrollX: true,
            scrollCollapse: true,
            scrollResize: true,
            fixedHeader: {
                header: true,
                headerOffset: $('#fixed').height()
            },
            searching: true,
            processing: true,
            responsive: false,
            ajax: {
                url: '${pageContext.servletContext.contextPath}/routeV3/V2/data/decision_charges/v2',
                type: 'GET',
                data: {
                    appId: applicationId
                }
            },
            serverSide: true,
            dom: "<'row'<'col-sm-12 col-md-6'R><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'l><'col-sm-12 col-md-3'><'col-sm-12 col-md-7 mt-2'p>>",
            lengthMenu: [[5, 25, 50, -1], [5, 25, 50, appTableV1.all]],
            fields: [{name: 'hsCode', mask: '0000 00 000 0'}],
            columns: [
                {
                    title: '№',
                    data: null,
                    sortable: false,
                    searchable: false,
                    orderable: false,
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1
                    }
                },
                {
                    className: "dt-head-center", title: appTableV2.hsCode, name: 'hsCode', data: 'hsCode', render: (_, __, row) => {
                        if (row.paymentYN === 'YES') {
                            return '<button type="button" class="btn btn-outline-primary rounded-lg btn-sm btn-block" onclick="Calculating(' + "'" + row.id + "'" + ')">' + row.hsCode + '</button>'
                        } else if (row.paymentYN === 'NO') {
                            return '<button type="button" class="btn btn-outline-warning rounded-lg btn-sm btn-block" onclick="Calculating(' + "'" + row.id + "'" + ')">' + row.hsCode + '</button>'
                        }
                    }
                },
                {
                    className: "dt-head-center", title: appTableV2.productName, name: 'hsName', data: 'hsName', render: (_, __, row) => {
                        return '<textarea rows="1" cols="100" class="border-0 font-weight-normal m-0 p-0 hsName" style="background-color: rgb(0, 0, 0, 0); overflow:visible">' + row.hsName + '</textarea>'
                    }
                },
                {className: "dt-head-center", title: appTableV2.createCountry, name: 'orignCountrNm', data: 'orignCountrNm'},
                {className: "dt-head-center", title: appTableV2.createName, name: 'originOrg', data: 'originOrg'},
                {className: "dt-head-center", title: appTableV2.customPrice, name: 'customsPrice', data: 'customsPrice'},
                {className: "dt-head-center", title: appTableV2.facPrice, name: 'price', data: 'price'},
                {className: "dt-head-center", title: appTableV2.brutto, name: 'brutto', data: 'brutto'},
                {className: "dt-head-center", title: appTableV2.netto, name: 'netto', data: 'netto'},
                {className: "dt-head-center", title: appTableV2.tradeName, name: 'tradeName', data: 'tradeName'},
                {className: "dt-head-center", title: appTableV2.tradeMark, name: 'tradeMark', data: 'tradeMark'},
                {className: "dt-head-center", title: appTableV2.mark, name: 'mark', data: 'mark'},
                {className: "dt-head-center", title: appTableV2.model, name: 'model', data: 'model'},
                {className: "dt-head-center", title: appTableV2.article, name: 'article', data: 'article'},
                {className: "dt-head-center", title: appTableV2.sort, name: 'sort', data: 'sort'},
                {className: "dt-head-center", title: appTableV2.standard, name: 'standarts', data: 'standarts'},
                {className: "dt-head-center", title: appTableV2.purposeUse, name: 'functions', data: 'functions'},
                {className: "dt-head-center", title: appTableV2.commercialFeature, name: 'comProp', data: 'comProp'},
                {className: "dt-head-center", title: appTableV2.technicalFeature, name: 'techChar', data: 'techChar'},
                {className: "dt-head-center", title: appTableV2.typePackaging, name: 'packTypeNm', data: 'packTypeNm'},
                {className: "dt-head-center", title: appTableV2.countPackaging, name: 'packQty', data: 'packQty'},
                {className: "dt-head-center", title: appTableV2.countCargoPlace, name: 'cargoSpace', data: 'cargoSpace'},
                {
                    className: "dt-head-center", title: appTableV2.previousPreliminaryDecision, name: 'inDecNum', data: 'inDecNum', render: (_, __, row) => {
                        return row.inDecNum + '/' + row.inDecDate
                    }
                },
                {
                    className: "dt-head-center", title: appTableV2.previousPreliminaryDecisionHsCode, name: 'hsDecNum', data: 'hsDecNum', render: (_, __, row) => {
                        return row.hsDecNum + '/' + row.hsDecDate
                    }
                },
                {
                    className: "dt-head-center", title: appTableV2.method, name: 'methodNm', data: 'methodNm', render: (_, __, row) => {
                        return '<textarea rows="1" cols="100" class="border-0 font-weight-normal m-0 p-0 hsName" style="background-color: rgb(0, 0, 0, 0); overflow:visible">' + row.methodNm + '</textarea>'
                    }
                }
            ],
            colResize: true,
            order: [[1, 'asc']],
            language: {url: '${pageContext.servletContext.contextPath}/resources/assets/json/datatablePlugini18/plugin_i18_' + sessionData.language + '.json'},
        });
        function appTable03(x) {
            setTimeout(() => {
                var app_table_03 = $('#app_table_03').DataTable({
                    retrieve: true,
                    deferLoading: false,
                    scrollY: '70vh',
                    scrollX: true,
                    scrollCollapse: true,
                    scrollResize: true,
                    fixedHeader: {
                        header: true,
                        headerOffset: $('#fixed').height()
                    },
                    searching: true,
                    processing: true,
                    responsive: true,
                    ajax: {
                        url: '${pageContext.servletContext.contextPath}/routeV3/V2/data/decision_charges/v3',
                        type: 'GET',
                        data: {
                            appId: applicationId
                        }
                    },
                    serverSide: true,
                    dom: "<'row'<'col-sm-12 col-md-6'Rl><'col-sm-12 col-md-6'f>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'><'col-sm-12 col-md-3'><'col-sm-12 col-md-7 mt-2'p>>",
                    lengthMenu: [[10, 25, 50, -1], [10, 25, 50, appTableV1.all]],
                    columns: [
                        {
                            title: '№',
                            data: null,
                            sortable: false,
                            searchable: false,
                            orderable: false,
                            render: function (data, type, row, meta) {
                                return meta.row + meta.settings._iDisplayStart + 1
                            }
                        },
                        {
                            className: "dt-head-center", title: appTableV3.finishCountry, name: 'finishCountry', data: 'finishCountryJoin', render: (_, __, row) => {
                                return '<span style="font-size: 1.4em;"><i class="fi fi-' + row.finishCountryJoin.cdIdL + ' shadow"/> ' + row.finishCountryJoin.cdNm + '</span>';
                            }
                        },
                        {
                            className: "dt-head-center", title: appTableV3.endCountry, name: 'endCountry', data: 'endCountryJoin', render: (_, __, row) => {
                                return '<span style="font-size: 1.4em;"><i class="fi fi-' + row.endCountryJoin.cdIdL + ' shadow"/> ' + row.endCountryJoin.cdNm + '</span>';
                            }
                        },
                        {
                            className: "dt-head-center", title: appTableV3.transportType, name: 'transportsType', data: 'transports', render: (_, __, row) => {
                                return '<span style="font-size: 1.4em;"><i class="fas ' + row.transports.cdDesc + '"/> <u>' + row.tarnsportType + '</u>-' + row.transports.cdNm + '</span>';
                            }
                        },
                        {className: "dt-head-center", title: appTableV3.transportPrice, name: 'transportPrice', data: 'transportPrice'}
                    ],
                    colReorder: true,
                    colResize: true,
                    order: [[1, 'asc']],
                    language: {url: '${pageContext.servletContext.contextPath}/resources/assets/json/datatablePlugini18/plugin_i18_' + sessionData.language + '.json'},
                });
                if (x === 1) {
                    app_table_03.draw();
                }
            }, 200)
        }
        var app_table_04 = $('#app_table_04').DataTable({
            // scrollY: '60vh',
            scrollX: true,
            // scrollCollapse: true,
            // scrollResize: true,
            searching: true,
            processing: true,
            responsive: true,
            ajax: {
                url: '${pageContext.servletContext.contextPath}/routeV3/V4/data/decision_charges/v1',
                type: 'GET',
                data: {
                    appId: applicationId
                }
            },
            serverSide: true,
            dom: "<'row'<'col-sm-12 col-md-6'R><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'l><'col-sm-12 col-md-3'><'col-sm-12 col-md-7 mt-2'p>>",
            lengthMenu: [[5, 25, 50, -1], [5, 25, 50, appTableV1.all]],
            fields: [{name: 'hsCode', mask: '0000 00 000 0'}],
            columns: [
                {
                    title: '№',
                    data: null,
                    sortable: false,
                    searchable: false,
                    orderable: false,
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1
                    }
                },
                {className: "dt-head-center", title: appTableV4.g47Type, name: 'cmdtId', data: 'cmdtId', searchable: false},
                {className: "dt-head-center", title: 'Tovar Tif Tn kodi', name: 'commodity', data: 'commodity.hsCode', searchable: false,  render: function (data) { return data ? data : '-'; }},
                {className: "dt-head-center", title: appTableV4.g47Type, name: 'g47Type', data: 'g47Type'},
                {className: "dt-head-center", title: appTableV4.g47Base, name: 'g47Base', data: 'g47Base'},
                {className: "dt-head-center", title: appTableV4.g47AltBase, name: 'g47AltBase', data: 'g47AltBase'},
                {className: "dt-head-center", title: appTableV4.g47Rate, name: 'g47Rate', data: 'g47Rate'},
                {className: "dt-head-center", title: appTableV4.g47AltRate, name: 'g47AltRate', data: 'g47AltRate'},
                {className: "dt-head-center", title: appTableV4.currRate, name: 'currRate', data: 'currRate'},
                {className: "dt-head-center", title: appTableV4.g47AltBaseEdIzm, name: 'g47AltBaseEdIzm', data: 'g47AltBaseEdIzm'},
                {className: "dt-head-center", title: appTableV4.g47Sum, name: 'g47Sum', data: 'g47Sum'},
                {className: "dt-head-center", title: appTableV4.g47Sp, name: 'g47Sp', data: 'g47Sp'},
                {
                    className: "dt-head-center", title: appTableV4.delete, name: 'delete', data: 'id', render: function (data, type, row, meta) {
                        return '<div class="d-flex justify-content-around">' +
                            '<button class="btn btn-sm btn-outline-warning rounded-circle edit-button" id="idPay1" data-value="' + row.id + '"><i class="fa fa-edit cursor-pointer"></i></button>' +
                            '<button onclick="deleteRows(' + "'" + data + "'" + ')" class="btn btn-sm btn-outline-danger rounded-circle deletePaymentId"><i class="fas fa-trash"></i></button>' +
                            '</div>';
                    }
                },
            ],
            order: [[1, 'asc'], [2, 'asc'], [10, 'asc']],
            language: {url: '${pageContext.servletContext.contextPath}/resources/assets/json/datatablePlugini18/plugin_i18_' + sessionData.language + '.json'},
        });
        function appTable05(x) {
            setTimeout(() => {
                var app_table_05 = $('#app_table_05').DataTable({
                    retrieve: true,
                    deferLoading: false,
                    scrollX: true,
                    searching: true,
                    processing: true,
                    responsive: true,
                    ajax: {
                        url: '${pageContext.servletContext.contextPath}/routeV3/V2/data/decision_charges/v5',
                        type: 'GET',
                        data: {
                            appId: applicationId
                        }
                    },
                    serverSide: true,
                    dom: "<'row'<'col-sm-12 col-md-6'Rl><'col-sm-12 col-md-6'f>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'><'col-sm-12 col-md-3'><'col-sm-12 col-md-7 mt-2'p>>",
                    lengthMenu: [[10, 25, 50, -1], [10, 25, 50, appTableV1.all]],
                    fields: [{name: 'hsCode', mask: '0000 00 000 0'}],
                    columns: [
                        {
                            title: '№',
                            data: null,
                            sortable: false,
                            searchable: false,
                            orderable: false,
                            render: function (data, type, row, meta) {
                                return meta.row + meta.settings._iDisplayStart + 1
                            }
                        },
                        {className: "dt-head-center", title: 'status', name: 'status', data: 'status', searchable: false},
                        {className: "dt-head-center", title: appTableV5.statusName, name: 'statusComment', data: 'statusType', searchable: false, render: (_, __, row) => {return row.statusType.comment}},
                        {className: "dt-head-center", title: appTableV5.time, name: 'insTime', data: 'insTime'},
                        {className: "dt-head-center", title: appTableV5.inspectorName, name: 'sortedInsNm', data: 'sortedInsNm'},
                        {className: "dt-head-center", title: appTableV5.distribution, name: 'comment', data: 'comment'}
                    ],
                    colResize: true,
                    colReorder: false,
                    order: [[1, 'asc']],
                    language: {url: '${pageContext.servletContext.contextPath}/resources/assets/json/datatablePlugini18/plugin_i18_' + sessionData.language + '.json'},
                });
                if (x === 1) {
                    app_table_05.draw();
                    app_table_05.column('status:name').visible(false);
                }
            }, 200)
        }

        function applicationDetail(appId) {
            var params = {
                "appId": appId
            }
            $.ajax({
                type: "GET",
                data: params,
                url: "${pageContext.servletContext.contextPath}/routeV3/V2/data/decision_charges/v4",
                dataType: "json",
                async: true,
                contentType: 'application/json',
                success: function (res) {
                    createListDocs(res.earxivList)
                    setterApplicationDetail(res);
                },
                error: function (res) {
                    alert("error")
                }
            });
        }
        function createListDocs(listDoc) {
            var newlistDoc = '';
            listDoc.forEach(function (value, key) {
                newlistDoc = '' +
                    '<tr>' +
                    '<td><a class="dropdown-item p-2" href="#">' + Number(key + 1) + '</a></td>' +
                    '<td><a class="dropdown-item p-2" href="#">' + value.docType + '-' + value.docTypeName + '</a></td>' +
                    '<td><a class="dropdown-item p-2" href="#">' + value.fileNum + '</a></td>' +
                    '<td><a class="dropdown-item p-2" href="#">' + value.fileDate + '</a></td>' +
                    '<td>' +
                    '<div class="btn-group btn-group-sm ml-3" role="group" aria-label="Basic example">' +
                    ' <a href="${pageContext.servletContext.contextPath}/routeV3/V3/download/' + value.hash + '/' + value.fileId + '/' + value.id + '" type="button" class="btn btn-outline-primary"><i class="fa fa-download"/></a> ' +
                    ' <a type="button" class="btn btn-outline-primary" onclick="openDocs('+"'"+ value.hash + "'"+', '+"'"+ value.fileId + "'"+', '+"'"+ value.id + "'"+')"><i class="fa fa-book-open"/></td></button>' +
                    '<div>' +
                    '</tr>';
                $('#dropDownDocList').append(newlistDoc)
            })
        }
        function setterApplicationDetail(detail) {
            $('.appNumAndDate').html(detail.appNum + '/' + detail.versionNum);
            $('.personFio').html(detail.personFio);
            $('.customerCountryNmAndSellerOrg').html(detail.customerCountryNm + ' - ' + detail.sellerOrg);
            $('.personPhone').html(detail.personPhone);
            $('.importerNm').html(detail.importerNm);
            $('.senderCountryNmAndSenderOrg').html(detail.senderCountryNm + ' - ' + detail.senderOrg);
            $('.importerTin').html(detail.importerTin);
            $('.authorizedPersonPinAndAuthorizedPersonDoc').html(nullClear(detail.authorizedPersonPin) + ' - ' + nullClear(detail.authorizedPersonDoc));
            $('.stateNumberAndStateNumberDate').html(nullClear(detail.stateNumber) + ' - ' + nullClear(detail.sateNumberDate));
            $('.customsPriceSumAndCustomsPriceCurrency').html(detail.customsPriceSum + ' - ' + detail.customsPriceCurrency);
            $('.priceSumAndCustomsPriceCurrency').html(detail.priceSum + ' - ' + detail.customsPriceCurrency);
            $('.nettoSum').html(detail.nettoSum);
            $('.bruttoSum').html(detail.bruttoSum);
            $('.termsNmAndTermsAddr').html(detail.termsNm + ' - ' + detail.termsAddr);
            $('.transportTypTableeModalButton').html(detail.transportPriceSum);
        }
        function openTransportTypeTableModal() {
            appTable03(1);
        }
        function openApplicationHistoryModal() {
            appTable05(1);
        }
        function openDocs(hash, fileId, earxivId) {
            $('.docViewer').html('')
            var params = {
                "fileId": fileId,
                "hash": hash,
                "earxivId": earxivId,
            }
            $.ajax({
                type: "POST",
                data: JSON.stringify(params),
                url: "${pageContext.servletContext.contextPath}/routeV3/V2/data/decision_charges/v6",
                dataType: "json",
                async: true,
                contentType: 'application/json',
                beforeSend: function () {
                    $('.resize-drag').css('width', '50vw');
                    $('.resize-drag2').removeClass('d-none').css('width', '50vw').show();
                },
                success: function (res) {
                    let files = '';
                    if (res.fileType === 'jpg' || res.fileType === 'png' || res.fileType === 'svg' || res.fileType === 'jpeg'){
                        files = '<img style="display:block;" id="image" class="m-auto" src="data:image/jpeg;base64, '+res.fileData+'" />';
                    }
                    else if (res.fileType === 'pdf'){
                        files = '<iframe title="title" width="100%" style="height: 100vh!important;" class="m-auto" src="data:application/pdf;base64,'+res.fileData+'"></iframe>';
                    }else {
                        files = '<h3>Файл формати мос келмади</h3>' +
                            '<p>файлни юклаб олган ҳолда кўринг</p>'
                    }
                    $('.docViewer').html(files);
                }
            });
        };
        function clearDocViewer() {
            $('.resize-drag').css('width', 'auto');
            $('.resize-drag2').addClass('d-none').css('width', '0vw').hide();
        }

        function Calculating(cmdtId) {
            var dataS = {
                'cmdt_id': cmdtId,
                'appId': applicationId
            }
            $.ajax({
                type: "POST",
                data: dataS,
                url: "<%=request.getContextPath()%>/commodity/resources/pages/InitialDecision/InitialDecisionSteps/Steps4",
                dataType: "html",
                header: 'Content-type: text/html; charset=utf-8',
                success: function (res) {
                    $('div#divcalculate').html(res);
                },
                error: function (res) {
                }
            });
        }
        function selectCmdtCodes() {
            $('.cmdtId').html('');
            cmdtIdListMapper.forEach(function (data, key) {
                var opt = '<option class="option-class" value="'+data.id+'">'+data.hsCode+'</option>';
                $('.cmdtId').append(opt);
            })
        }
        function hsCodeContainer() {
            var filter = '';
            $('select#cmdtHsCode option:selected').each(function() {
                filter += $(this).val() + "+";
            });
            filter = filter.substring(0, filter.length - 1);
            return filter;
        }

        function removeRows(data) {
            if (![1].includes(data)) {
                $('.newRows').remove();
            }else {
                app_table_04.draw();
            }
        }
        function saveRows() {
            var params = {
                "cmdtId": $('.cmdtId').find(":selected").val(),
                "g47Type": $('.g47Type').val(),
                "g47Base": $('.g47Base').val(),
                "g47AltBase": $('.g47AltBase').val(),
                "g47Rate": $('.g47Rate').val(),
                "g47AltRate": $('.g47AltRate').val(),
                "currRate": $('.currRate').val(),
                "g47AltBaseEdIzm": $('.g47AltBaseEdIzm').val(),
                "g47Sum": $('.g47Sum').val(),
                "g47Sp": $('.g47Sp').val()
            }
            $.ajax({
                type: "POST",
                data: JSON.stringify(params),
                url: "${pageContext.servletContext.contextPath}/routeV3/V4/data/decision_charges/v1",
                dataType: "json",
                async: true,
                contentType: 'application/json',
                complete: function (res) {
                    app_table_04.draw();
                    $.toast({
                        position: 'bottom-right',
                        heading: 'Бажарилди!',
                        text: 'Ҳисобланган тўлов сақланди',
                        icon: 'success',
                        hideAfter: 5000,
                        loader: true,        // Change it to false to disable loader
                        loaderBg: '#9EC600'  // To change the background
                    })
                }
            });
        }
        function editRows(id) {
            var params = {
                "id": id,
                "cmdtId": $('.cmdtId').find(":selected").val(),
                "g47Type": $('.g47Type').val(),
                "g47Base": $('.g47Base').val(),
                "g47AltBase": $('.g47AltBase').val(),
                "g47Rate": $('.g47Rate').val(),
                "g47AltRate": $('.g47AltRate').val(),
                "currRate": $('.currRate').val(),
                "g47AltBaseEdIzm": $('.g47AltBaseEdIzm').val(),
                "g47Sum": $('.g47Sum').val(),
                "g47Sp": $('.g47Sp').find(":selected").val()
            }
            $.ajax({
                type: "PUT",
                data: JSON.stringify(params),
                url: "${pageContext.servletContext.contextPath}/routeV3/V4/data/decision_charges/v1",
                dataType: "json",
                async: true,
                contentType: 'application/json',
                complete: function (res) {
                    app_table_04.draw();
                    $.toast({
                        position: 'bottom-right',
                        heading: 'Бажарилди!',
                        text: 'Ҳисобланган тўлов сақланди',
                        icon: 'success',
                        hideAfter: 5000,
                        loader: true,        // Change it to false to disable loader
                        loaderBg: '#9EC600'  // To change the background
                    })
                }
            });
        }
        function deleteRows(id) {
            var params = {
                "id": id
            }
            Swal.fire({
                text: 'Тўловни ўчиришни тасдиқлайсизми?',
                showDenyButton: true,
                confirmButtonText: 'Ха',
                confirmButtonColor: '#457ffe',
                denyButtonText: `йўқ`
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "DELETE",
                        data: JSON.stringify(params),
                        url: "${pageContext.servletContext.contextPath}/routeV3/V4/data/decision_charges/v1",
                        dataType: "json",
                        async: true,
                        contentType: 'application/json',
                        complete: function (res) {
                            app_table_04.draw();
                            $.toast({
                                position: 'bottom-right',
                                heading: 'Бажарилди!',
                                text: 'Ҳисобланган тўлов ўчирилди',
                                icon: 'success',
                                hideAfter: 5000,
                                loader: true,        // Change it to false to disable loader
                                loaderBg: '#9EC600'  // To change the background
                            })
                        },
                    });
                }
            })

        }

        $('#btn-add').on('click', function (e) {
            $('.newRows').remove();
            var newRow = '<tr class="newRows">' +
                '<td>№</td>' +
                '<td>' +
                '<select class="selectpicker form-control show-menu-arrow cmdtId" data-style="form-control form-control-sm" id="cmdtId" data-selected-text-format="count > 3" data-actions-box="true" data-live-search="true">' +
                '</select>' +
                '</td>' +
                '<td>' +
                '<input type="text" class="form-control form-control-sm g47Type"/>' +
                '</td>' +
                '<td><input type="text" class="form-control form-control-sm g47Base"/></td>' +
                '<td><input type="text" class="form-control form-control-sm g47AltBase"/></td>' +
                '<td><input type="text" class="form-control form-control-sm g47Rate"/></td>' +
                '<td><input type="text" class="form-control form-control-sm g47AltRate"/></td>' +
                '<td><input type="text" class="form-control form-control-sm currRate"/></td>' +
                '<td><input type="text" class="form-control form-control-sm g47AltBaseEdIzm"/></td>' +
                '<td><input type="text" class="form-control form-control-sm g47Sum"/></td>' +
                '<td><input type="text" class="form-control form-control-sm g47Sp"/></td>' +
                '<td>' +
                '<div class="d-flex justify-content-around">' +
                '<button class="btn btn-sm btn-outline-primary rounded-circle" onclick="saveRows()"><i class="fas fa-save"></i></button>' +
                '<button class="btn btn-sm btn-outline-danger rounded-circle" onclick="removeRows()"><i class="fas fa-trash-restore"></i></button>' +
                '</div>' +
                '</td>' +
                '</tr>';
            $('#app_table_04 tbody').append(newRow);
            selectCmdtCodes()
            $('.selectpicker').selectpicker();
        });
        $('#app_table_04').on('click', '.edit-button', function() {
            var $row = $(this).closest('tr');
            $row.addClass('edit-mode');
            var index = 0;
            var paymentId = $row.find('td:last-child #idPay1').attr('data-value');
            var rowForReturn = $row;
            $row.find('td').each(function() {
                var $cell = $(this);
                var value = $cell.text();
                if (index === 0 || index === 1 || index === 7 || index === 8 || index === 9 || index === 11){
                    if (index === 11){
                        $cell.html(
                            '<div class="d-flex justify-content-around">' +
                            '<button class="btn btn-sm btn-outline-primary rounded-circle" onclick="editRows('+"'"+paymentId+"'"+')"><i class="fas fa-save"></i></button>' +
                            '<button class="btn btn-sm btn-outline-danger rounded-circle" onclick="removeRows(1)"><i class="fas fa-backspace"></i></button>'+
                            '</div>')
                    }
                }
                else if(index===2){
                    $cell.html('<input type="text" class="form-control form-control-sm g47Type" value="' + value + '">');
                }else if(index===3){
                    $cell.html('<input type="text" class="form-control form-control-sm g47Base" value="' + value + '">');
                }else if(index===4){
                    $cell.html('<input type="text" class="form-control form-control-sm g47AltBase" value="' + value + '">');
                }else if(index===5){
                    $cell.html('<input type="text" class="form-control form-control-sm g47Rate" value="' + value + '">');
                }else if(index===6){
                    $cell.html('<input type="text" class="form-control form-control-sm g47AltRate" value="' + value + '">');
                }else if(index===10){
                    if (value === 'БН'){
                        $cell.html('' +
                            '<select class="selectpicker form-control form-control-sm show-menu-arrow g47Sp" data-style="form-control form-control-sm" data-selected-text-format="count > 3" data-actions-box="true" data-live-search="true">' +
                            '<option selected value="' + value + '" >' + value + '</option>'+
                            '<option value="OO">OO</option>'+
                            '</select>'
                        );
                    }else {
                        $cell.html('' +
                            '<select class="selectpicker form-control form-control-sm show-menu-arrow g47Sp" data-style="form-control form-control-sm" data-selected-text-format="count > 3" data-actions-box="true" data-live-search="true">' +
                            '<option selected value="' + value + '" >' + value + '</option>'+
                            '<option value="БН">БН</option>'+
                            '</select>'
                        );
                    }
                    $('.selectpicker').selectpicker();
                }

                index++;
            });
        });
        $('.cmdtHsCode').on('change', function () {
            app_table_04
                .column('cmdtId:name').search(hsCodeContainer())
                .draw();
        });

        $(document).ready(function () {
            applicationDetail(applicationId);
            app_table_04.column('cmdtId:name').visible(false);
        })

        $(".panel-left").resizable({
            handleSelector: ".splitter",
            resizeHeight: false
        });

        $(".panel-top").resizable({
            handleSelector: ".splitter-horizontal",
            resizeWidth: false
        });

        console.log('test');

    </script>
</body>