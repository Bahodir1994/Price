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
        ajax: '<%=request.getContextPath()%>/routeV2/data/cost_monitoring_base/v1/',
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
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
            },
            {
                data: 'id'
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

    var minFirstDay = $('input#minFirstDay');
    var maxFirstDay = $('input#maxFirstDay');
    var onDateBoundChange = function () {
        table.column('.insTime').search(minFirstDay.val() + ';' + maxFirstDay.val()).draw();
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

    function applicationProccess(id) {
        let params = {
            "id": id
        }
        $.ajax({
            type: "GET",
            url: "${pageContext.servletContext.contextPath}/route/decision_global/d_global/v1",
            data: params,
            beforeSend: function () {},
            accept: function () {},
            success: function (response){
                $("#generalContainer").html(response);
            },
            error: function () {}
        });
    }
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
