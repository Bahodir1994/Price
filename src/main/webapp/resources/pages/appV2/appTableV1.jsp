<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 13.04.2023
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                                       style=" margin-right: 5px;">ТИФ ТН код</label>

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
                <div class="col-sm-12 p-2">
                    <div id="main">
                        <div class="container-fluid">
                            <div class="accordion" id="faq">

                                <div class="card m-0">
                                    <div class="card-header" id="faqhead2">
                                        <a href="#" class="btn btn-header-link collapsed"
                                           data-toggle="collapse" data-target="#faq2"
                                           aria-expanded="true" aria-controls="faq2">Қўшимча қидирув
                                            филтрлари</a>
                                    </div>

                                    <div id="faq2" class="collapse" aria-labelledby="faqhead2"
                                         data-parent="#faq">
                                        <div class="card-body text-center justify-content-center">
                                            <form>
                                                <div class="form-row">
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState1">ХББ</label>
                                                        <select id="inputState1"
                                                                class="form-control form-control-sm">
                                                            <option selected>ХББни танланг</option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState2">Олиб ўтиш
                                                            хусусияти</label>
                                                        <select id="inputState2"
                                                                class="form-control form-control-sm">
                                                            <option selected>Олиб ўтиш хусусиятини
                                                                танланг
                                                            </option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState3">Қўшимча ўлчов
                                                            бирлиги</label>
                                                        <select id="inputState3"
                                                                class="form-control form-control-sm">
                                                            <option selected>Қўшимча ўлчов бирлиги
                                                                танланг
                                                            </option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState4">Божхона
                                                            режими</label>
                                                        <select id="inputState4"
                                                                class="form-control form-control-sm">
                                                            <option selected>Режимни танланг
                                                            </option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState5">Етказиб
                                                            шарти</label>
                                                        <select id="inputState5"
                                                                class="form-control form-control-sm">
                                                            <option selected>Етказиб шартини
                                                                танланг
                                                            </option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-1">
                                                        <label for="inputState6">БЮД(:дан)</label>
                                                        <input type="date"
                                                               class="form-control form-control-sm px-1"
                                                               id="inputState6"
                                                               maxlength="10" tabindex="1"
                                                               name="dcodate"
                                                               min="2020-01-01"
                                                               max="2023-12-31"
                                                               value="2023-03-01">
                                                    </div>
                                                    <div class="form-group col-md-1">
                                                        <label for="inputState7">БЮД(:гача)</label>
                                                        <input type="date"
                                                               class="form-control form-control-sm px-1"
                                                               id="inputState7"
                                                               maxlength="10" tabindex="1"
                                                               name="dcodate"
                                                               min="2020-01-01"
                                                               max="2023-12-31"
                                                               value="2023-03-01">
                                                    </div>



                                                    <div class="form-group col-md-2">
                                                        <label for="inputState11">Божхона
                                                            пости</label>
                                                        <select id="inputState11"
                                                                class="form-control form-control-sm">
                                                            <option selected>Постни танланг</option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState12">Шартнома
                                                            тури</label>
                                                        <select id="inputState12"
                                                                class="form-control form-control-sm">
                                                            <option selected>Шартнома турини
                                                                танланг
                                                            </option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState13">Метод</label>
                                                        <select id="inputState13"
                                                                class="form-control form-control-sm">
                                                            <option selected>Методтанланг</option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState14">Аввалги
                                                            режим</label>
                                                        <select id="inputState14"
                                                                class="form-control form-control-sm">
                                                            <option selected>Режимни танланг
                                                            </option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState15">Товар
                                                            маркаси</label>
                                                        <input type="text"
                                                               class="form-control form-control-sm px-1"
                                                               id="inputState15"
                                                               placeholder="Товар маркаси"
                                                        >

                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState20">Тузатиш
                                                            киритилган</label>
                                                        <select id="inputState20"
                                                                class="form-control form-control-sm">
                                                            <option selected>Режимни танланг
                                                            </option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>


                                                    <div class="form-group col-md-2">
                                                        <label for="inputState21">БЮД рақами</label>
                                                        <input type="text"
                                                               class="form-control form-control-sm px-1"
                                                               id="inputState21"
                                                               placeholder="пост/сана/рақам"
                                                        >
                                                    </div>

                                                    <div class="form-group col-md-2">
                                                        <label for="inputState22">Имортер
                                                            СТИР/ЖШШИР</label>
                                                        <input type="text"
                                                               class="form-control form-control-sm px-1"
                                                               id="inputState22"
                                                               placeholder="СТИР/ЖШШИР"
                                                        >
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState23">Ўз
                                                            еҳтиёжи/тижорат</label>
                                                        <select id="inputState23"
                                                                class="form-control form-control-sm">
                                                            <option selected>Ўз еҳтиёжи/тижорат
                                                            </option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState24">Шартнома ИДН
                                                            рақами</label>
                                                        <input type="text"
                                                               class="form-control form-control-sm px-1"
                                                               id="inputState24"
                                                               placeholder="Шартнома ИДН рақами"
                                                        >
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState25">Божхона қиймати
                                                            асоси</label>
                                                        <input type="text"
                                                               class="form-control form-control-sm px-1"
                                                               id="inputState25"
                                                               placeholder="Божхона қиймати асоси"
                                                        >

                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label>Чегарани кесиб ўтган сана</label>
                                                        <div class="px-1" style="margin-top: -2px">
                                                            <button type="button"
                                                                    class="btn  btn-outline-primary btn-sm">
                                                                30 кун
                                                            </button>
                                                            <button type="button"
                                                                    class="btn  btn-outline-secondary btn-sm">
                                                                90 кун
                                                            </button>
                                                            <button type="button"
                                                                    class="btn  btn-outline-secondary btn-sm">
                                                                180 кун
                                                            </button>
                                                        </div>
                                                    </div>


                                                       <div class="col-2 text-right">
                                                           <button type="button" tabindex="3"
                                                                   class="btn btn-sm btn-outline-primary f-w-900 w-75 updateAppTableV1 "
                                                                   style="border-radius: 3px">
                                                               <i class="fas fa-wrench"></i>&nbsp;Созлама
                                                           </button>
                                                       </div>


                                                </div>

                                            </form>
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
    <div class="row">
        <!-- [ horizontal-layout ] start -->
        <div class="col-sm-12">
            <div class="mt-3 dt-responsive table-responsive p-4">
                <table id="app_table_01" class="table table-striped table-bordered nowrap">
                    <thead class="text-center">
                    <tr>
                        <th>№</th>
                        <th>БЮД рақами</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
        <!-- [ horizontal-layout ] end -->
    </div>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/assets/data-table/jquery.spring-friendly.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/assets/data-table/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/assets/data-table/dataTables.fixedHeader.min.js"></script>

<script>
    $('select').selectpicker();
    let numberCount = 0
    var table = $('#app_table_01').DataTable({
        fixedHeader: true,
        searching: true,
        processing: true,
        responsive: true,
        ajax: '<%=request.getContextPath()%>/routeV2/data/cost_monitoring_base/v2',
        serverSide: true,
        dom: "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-1'l><'col-sm-12 col-md-4'i><'col-sm-12 col-md-7'p>>",
        lengthMenu: [ [8, 25, 50, -1], [8, 25, 50, "барча"] ],
        columns: [
            {   name: '#',
                data: null,
                sortable: false,
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            {
                data: 'gc3Date'
            },
        ],
        columnDefs: [
            {
                searchable: false,
                orderable: false,
                targets: 0,
            }
        ],
        colReorder: true,
        order: [[1, 'asc']],
        "language": {
            "processing": "<span class='fa-stack fa-lg'><i class='fas fa-spinner fa-spin fa-stack-2x fa-fw'></i></span>&nbsp;Юкланмоқда ...",
            "search": "Излаш:",
            "lengthMenu": "_MENU_",
            "zeroRecords": "маълумотлар топилмади",
            "info": "кўрсатилаётган сахифа _PAGES_ дан _PAGE_",
            "infoEmpty": "<span class='m-3'>Маълумотлар топилмади</span>",
            "infoFiltered": "(filtered from _MAX_ total records)",
            "paginate": {
                "previous": "Oldingi",
                "next": "Keyingi"
            },
        },
    });

    // $('input#appNum').change(function() {
    //     var filter = $(this).val();
    //     table.column('.appNum').search(filter).draw();
    // });
    // $('input#g7a').change(function() {
    //     var filter = $(this).val();
    //     table.column('.g7a').search(filter).draw();
    // });
    // $('input#g7b').change(function() {
    //     var filter = $(this).val();
    //     table.column('.g7b').search(filter).draw();
    // });
    // $('input#g7c').change(function() {
    //     var filter = $(this).val();
    //     table.column('.g7c').search(filter).draw();
    // });
    // $('select#senderPostId').change(function() {
    //     var filter = '';
    //     $('select#senderPostId option:selected').each(function() {
    //         filter += $(this).val() + "+";
    //     });
    //     filter = filter.substring(0, filter.length - 1);
    //     table.column('.senderPostId').search(filter).draw();
    // });
    // $('input#atdInspectorName').change(function() {
    //     var filter = $(this).val();
    //     table.column('.atdInspectorName').search(filter).draw();
    // });
    // $('select#statusNm').change(function() {
    //     var filter = '';
    //     $('select#statusNm option:selected').each(function() {
    //         filter += $(this).val() + "+";
    //     });
    //     filter = filter.substring(0, filter.length - 1);
    //     table.column('.status').search(filter).draw();
    // });
    //
    var minFirstDay = $('input#minFirstDay');
    var maxFirstDay = $('input#maxFirstDay');
    var onDateBoundChange = function () {
        table.column('.gc3Date').search(minFirstDay.val() + ';' + maxFirstDay.val()).draw();
    };
    $('.updateAppTableV1').on('click', function () {
        onDateBoundChange();
    })

    $(document).ready(function () {
        table.on('order.dt search.dt', function () {
            let i = 1;
            table.cells(null, 0, {search: 'applied', order: 'applied'}).every(function (cell) {
                this.data(i++);
            });
        }).draw();
    });

    <%--function applicationProccess(id) {--%>
    <%--    let params = {--%>
    <%--        "id": id--%>
    <%--    }--%>
    <%--    $.ajax({--%>
    <%--        type: "GET",--%>
    <%--        url: "${pageContext.servletContext.contextPath}/route/decision_global/d_global/v1",--%>
    <%--        data: params,--%>
    <%--        beforeSend: function () {},--%>
    <%--        accept: function () {},--%>
    <%--        success: function (response){--%>
    <%--            $("#generalContainer").html(response);--%>
    <%--        },--%>
    <%--        error: function () {}--%>
    <%--    });--%>
    <%--}--%>
</script>
<style>
    .dropdown dropdown-menu {
        z-index: 9999!important;
        position: relative;
    }

    table.fixedHeader-floating{
        background-color:white
    }
    table.fixedHeader-floating.no-footer{
        border-bottom-width:0
    }
    table.fixedHeader-locked{
        position:absolute !important;
        background-color:white
    }
    @media print{table.fixedHeader-floating{display:none}}
    table.DTCR_clonedTable.dataTable{
        position:absolute !important;
        background-color:rgba(255, 255, 255, 0.7);
        z-index:202
    }
    div.DTCR_pointer{
        width:1px;
        background-color:#0259c4;
        z-index:201
    }
    div.container { max-width: 1200px }
    table thead th {
        border-right: 1px dashed #0c571d !important;
        border-bottom: 2px solid black !important;
    }
    table.dataTable thead > tr > th {
        vertical-align: top !important;
    }
    table.dataTable thead .sorting:after,
    table.dataTable thead .sorting_asc:after,
    table.dataTable thead .sorting_desc:after {
        vertical-align: top !important;
    }
    ::placeholder {
        text-align: center;
    }
    /* or, for legacy browsers */
    ::-webkit-input-placeholder {
        text-align: center;
    }
    :-moz-placeholder { /* Firefox 18- */
        text-align: center;
    }
    ::-moz-placeholder { /* Firefox 19+ */
        text-align: center;
    }
    :-ms-input-placeholder {
        text-align: center;
    }
</style>
