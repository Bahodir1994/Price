<%--
  Created by IntelliJ IDEA.
  User: Bahodir
  Date: 03.05.2023
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/dataTables.bootstrap4.min.css">
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
            width: 100%!important;
        }
        .tooltip {
            position: relative!important;
            display: inline-block!important;;
        }

        .tooltip .tooltiptext {
            visibility: hidden!important;;
            width: 140px!important;;
            background-color: #555!important;;
            color: #fff!important;;
            text-align: center!important;;
            border-radius: 6px!important;;
            padding: 5px!important;;
            position: absolute!important;;
            z-index: 1!important;;
            bottom: 150%!important;;
            left: 50%!important;;
            margin-left: -75px!important;;
            opacity: 0!important;;
            transition: opacity 0.3s!important;;
        }

        .tooltip .tooltiptext::after {
            content: ""!important;;
            position: absolute!important;;
            top: 100%!important;;
            left: 50%!important;;
            margin-left: -5px!important;;
            border-width: 5px!important;;
            border-style: solid!important;;
            border-color: #555 transparent transparent transparent!important;;
        }

        .tooltip:hover .tooltiptext {
            visibility: visible!important;;
            opacity: 1!important;;
        }
    </style>
</head>
<body>
    <div class="page-wrapper">
        <div class="page-header">
            <div class="page-block d-flex justify-content-between">
                <div class="card">
                    <div class="card-body m-3" style="border: 1px dashed #0a58ca">
                        <div class="d-flex justify-content-between bd-highlight">
                            <div class="btn-group">
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
                            <h5 class="p-2 bd-highlight" data-toggle="tooltip" data-placement="top" title="Tooltip on top">
                                <b>АРИЗА</b> №:<u class="text-primary appNumAndDate"></u>
                            </h5>
                        </div>
                        <div class="row mt-1">
                            <div class="col-sm-12 p-2">
                                <div id="main">
                                    <div class="container-fluid">
                                        <div class="" id="faq">
                                            <div class="card m-0">
                                                <div class="card-header" id="faqhead2">
                                                    <a href="#" class="btn btn-header-link collapsed" data-toggle="collapse"
                                                       data-target="#faq2" aria-expanded="true" aria-controls="faq2">Malumotlar</a>
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
                                                    <td style="height: 0.4vh!important;" class="termsNmAndTermsAddr"> - </td>
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
                                                    <td style="height: 0.4vh!important;" class="stateNumberAndStateNumberDate"> - </td>
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
                    <div class="card-body m-3" style="border: 1px dashed #0a58ca">
                        <div>
                            <h4>Хисобланган тўловлар</h4>
                        </div>
                        <div class="mt-0 dt-responsive p-2">
                            <table id="app_table_04" class="table table-striped row-border order-column table-bordered" cellspacing="0" style="width: 100%"></table>
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
    <script>
        var applicationId = ${appId};
        var cmdtIdListAlt = [];

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
            dom: "<'row'<'col-sm-12 col-md-6'R><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'l><'col-sm-12 col-md-3'i><'col-sm-12 col-md-7 mt-2'p>>",
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
                {className: "dt-head-center", title: appTableV2.hsCode, name: 'hsCode', data: 'hsCode', render: (_, __, row) => {
                        if (row.paymentYN==='YES'){
                            return '<button type="button" class="btn btn-outline-primary rounded-lg btn-sm btn-block" onclick="Calculating(' + "'" + row.id + "'" + ')">'+row.hsCode+'</button>'
                        }else if(row.paymentYN==='NO'){
                            return '<button type="button" class="btn btn-outline-warning rounded-lg btn-sm btn-block" onclick="Calculating(' + "'" + row.id + "'" + ')">'+row.hsCode+'</button>'
                        }
                    }},
                {className: "dt-head-center", title: appTableV2.productName, name: 'hsName', data: 'hsName', render: (_, __, row) => {return '<textarea rows="1" cols="100" class="border-0 font-weight-normal m-0 p-0 hsName" style="background-color: rgb(0, 0, 0, 0); overflow:visible">'+row.hsName+'</textarea>'}},
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
                {className: "dt-head-center", title: appTableV2.previousPreliminaryDecision, name: 'inDecNum', data: 'inDecNum', render: (_, __, row) => {return row.inDecNum + '/' + row.inDecDate}},
                {className: "dt-head-center", title: appTableV2.previousPreliminaryDecisionHsCode, name: 'hsDecNum', data: 'hsDecNum', render: (_, __, row) => {return row.hsDecNum + '/' + row.hsDecDate}},
                {className: "dt-head-center", title: appTableV2.method, name: 'methodNm', data: 'methodNm', render: (_, __, row) => {return '<textarea rows="1" cols="100" class="border-0 font-weight-normal m-0 p-0 hsName" style="background-color: rgb(0, 0, 0, 0); overflow:visible">'+row.methodNm+'</textarea>'}}
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
                    // dom: "<'row'<'col-sm-12 col-md-6'R><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'l><'col-sm-12 col-md-3'i><'col-sm-12 col-md-7 mt-2'p>>",
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
                        {className: "dt-head-center", title: appTableV3.finishCountry, name: 'finishCountry', data: 'finishCountryJoin', render: (_, __, row) => {
                                return '<span style="font-size: 1.4em;"><i class="fi fi-'+row.finishCountryJoin.cdIdL+' shadow"/> '+row.finishCountryJoin.cdNm+'</span>';
                            }},
                        {className: "dt-head-center", title: appTableV3.endCountry, name: 'endCountry', data: 'endCountryJoin', render: (_, __, row) => {
                                return '<span style="font-size: 1.4em;"><i class="fi fi-'+row.endCountryJoin.cdIdL+' shadow"/> '+row.endCountryJoin.cdNm+'</span>';
                            }},
                        {className: "dt-head-center", title: appTableV3.transportType, name: 'transportsType', data: 'transports', render: (_, __, row) => {
                            console.log(row)
                                return '<span style="font-size: 1.4em;"><i class="fas ' + row.transports.cdDesc + '"/> <u>'+row.tarnsportType+'</u>-' + row.transports.cdNm + '</span>';
                            }},
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
                url: '${pageContext.servletContext.contextPath}/routeV3/V4/data/decision_charges/v1',
                type: 'GET',
                data: {
                    appId: applicationId
                }
            },
            serverSide: true,
            dom: "<'row'<'col-sm-12 col-md-6'R><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'l><'col-sm-12 col-md-3'i><'col-sm-12 col-md-7 mt-2'p>>",
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
                {className: "dt-head-center", title: appTableV4.g47Type, name: 'g47Type', data: 'g47Type'},
                {className: "dt-head-center", title: appTableV4.g47Base, name: 'g47Base', data: 'g47Base'},
                {className: "dt-head-center", title: appTableV4.g47AltBase, name: 'g47AltBase', data: 'g47AltBase'},
                {className: "dt-head-center", title: appTableV4.g47Rate, name: 'g47Rate', data: 'g47Rate'},
                {className: "dt-head-center", title: appTableV4.g47AltRate, name: 'g47AltRate', data: 'g47AltRate'},
                {className: "dt-head-center", title: appTableV4.currRate, name: 'currRate', data: 'currRate'},
                {className: "dt-head-center", title: appTableV4.g47AltBaseEdIzm, name: 'g47AltBaseEdIzm', data: 'g47AltBaseEdIzm'},
                {className: "dt-head-center", title: appTableV4.g47Sum, name: 'g47Sum', data: 'g47Sum'},
                {className: "dt-head-center", title: appTableV4.g47Sp, name: 'g47Sp', data: 'g47Sp'}
                // {className: "dt-head-center", title: appTableV4.delete, name: 'delete', data: null}
            ],
            colResize: true,
            order: [[1, 'asc']],
            language: {url: '${pageContext.servletContext.contextPath}/resources/assets/json/datatablePlugini18/plugin_i18_' + sessionData.language + '.json'},
        });

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
                    console.log(res)
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
                newlistDoc ='' +
                    '<tr>' +
                        '<td><a class="dropdown-item p-2" href="#">'+Number(key+1)+'</a></td>' +
                        '<td><a class="dropdown-item p-2" href="#">'+value.docType+'-'+value.docTypeName+'</a></td>' +
                        '<td><a class="dropdown-item p-2" href="#">'+value.fileNum+'</a></td>' +
                        '<td><a class="dropdown-item p-2" href="#">'+value.fileDate+'</a></td>' +
                        '<td>' +
                            '<div class="btn-group btn-group-sm ml-3" role="group" aria-label="Basic example">' +
                            ' <a href="${pageContext.servletContext.contextPath}/routeV3/V3/download/'+value.hash+'/'+value.fileId+'/'+value.id+'" type="button" class="btn btn-outline-primary"><i class="fa fa-download"/></a> ' +
                            ' <a type="button" class="btn btn-outline-primary"><i class="fa fa-book-open"/></td></button>' +
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
        function openTransportTypeTableModal(){appTable03(1);}

        $(document).ready(function () {
            applicationDetail(applicationId);
        })
    </script>
</body>