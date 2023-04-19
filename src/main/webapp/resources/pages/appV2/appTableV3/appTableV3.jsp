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
<head>
    <style>
        .formClass {
            position: relative;
            width: 100%;
        }

        .formClass input {
            width: 100%;
            padding-right: 20px;
            box-sizing: border-box;
            font-size: 13px !important;
            height: 37px !important;
            background-color: #FFFFFF !important;
        }

        .formClass input:placeholder-shown + button {
            opacity: 0;
            pointer-events: none;
        }

        .formClass button {
            position: absolute;
            border: 2px;
            border-color: #0d6efd;
            display: block;
            width: 15px;
            height: 15px;
            line-height: 16px;
            font-size: 12px;
            border-radius: 50%;
            top: 0;
            bottom: 0;
            right: 5px;
            margin: auto;
            background: #225e9e;
            padding: 0;
            outline: none;
            cursor: pointer;
            transition: .1s;
        }
    </style>
</head>
<body>
    <div class="page-wrapper">
        <div class="row">
            <div class="col-sm-12">
                <div class="mt-0 dt-responsive p-2">
                    <table id="app_table_03" class="table table-striped row-border order-column table-bordered" style="width: 100%">
                        <tfoot>
                            <tr>
                                <th>
                                    <button class="btn btn-sm btn-outline-primary updateAppTableV3"><i class="fa fa-search"/></button>
                                </th>
                                <th>
                                    <select class="selectpicker form-control show-menu-arrow ugtkV3"
                                            data-style="form-control form-control-sm"
                                            id="ugtkV3" multiple
                                            data-selected-text-format="count > 1"
                                            data-actions-box="true" data-live-search="true"
                                            data-size="5">
                                        <c:forEach items="${location}" var="location" varStatus="i">
                                            <option class="option-class" value="${location.code}" data-subtext="${location.code}">${location.cdNm}</option>
                                        </c:forEach>
                                    </select>
                                </th>
                                <th>
                                    <input type="text" id="userNmV3" class="form-control form-control-sm w-100 userNmV3">
                                </th>
                                <th>
                                    <input type="text" id="g33V3" class="form-control form-control-sm w-100 g33V3">
                                </th>
                                <th>
                                    <input type="text" id="keywordV3" class="form-control form-control-sm w-100 keywordV3">
                                </th>
                                <th>
                                    <input type="number" id="resultCountV3" class="form-control form-control-sm w-100 resultCountV3">
                                </th>
                                <th>
                                    <form class="formClass">
                                        <input id="insTimeV3" type="text" class="form-control demo-mobile-picker-input insTimeV3" />
                                        <button onclick="clearDate()" class="text-white" type="button">&times;</button>
                                    </form>
                                </th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('select').selectpicker();

        function newexportaction2(e, dt, button, config) {
            var self = this;
            var oldStart = dt.settings()[0]._iDisplayStart;
            dt.one('preXhr', function (e, s, data) {
                // Just this once, load all data from the server...
                data.start = 0;
                data.length = 2147483647;
                dt.one('preDraw', function (e, settings) {
                    // Call the original action function
                    if (button[0].className.indexOf('buttons-copy') >= 0) {
                        $.fn.dataTable.ext.buttons.copyHtml5.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-excel') >= 0) {
                        $.fn.dataTable.ext.buttons.excelHtml5.available(dt, config) ?
                            $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config) :
                            $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-csv') >= 0) {
                        $.fn.dataTable.ext.buttons.csvHtml5.available(dt, config) ?
                            $.fn.dataTable.ext.buttons.csvHtml5.action.call(self, e, dt, button, config) :
                            $.fn.dataTable.ext.buttons.csvFlash.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-pdf') >= 0) {
                        $.fn.dataTable.ext.buttons.pdfHtml5.available(dt, config) ?
                            $.fn.dataTable.ext.buttons.pdfHtml5.action.call(self, e, dt, button, config) :
                            $.fn.dataTable.ext.buttons.pdfFlash.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-print') >= 0) {
                        $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
                    }
                    dt.one('preXhr', function (e, s, data) {
                        // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                        // Set the property to what it was before exporting.
                        settings._iDisplayStart = oldStart;
                        data.start = oldStart;
                    });
                    // Reload the grid with the original page. Otherwise, API functions like table.cell(this) don't work properly.
                    setTimeout(dt.ajax.reload, 0);
                    // Prevent rendering of the full data to the DOM
                    return false;
                });
            });
            // Requery the server with the new one-time export settings
            dt.ajax.reload();
        }
        function clearDate(){
            $('#insTimeV3').val('');
        }
        var app_table_03 = $('#app_table_03').DataTable({
            // scrollY:        '51vh',
            // scrollX:        true,
            // scrollCollapse: true,
            // scrollResize: true,
            fixedHeader: {
                header: true,
                headerOffset: $('#fixed').height()
            },
            buttons: [
                {
                    extend: 'excel',
                    text: '<i class="fa fa-file-excel"></i> Excel',
                    titleAttr: 'Excel',
                    className: 'btn btn-sm btn-success',
                    action: newexportaction2
                },
            ],
            searching: true,
            processing: true,
            responsive: true,
            ajax: '<%=request.getContextPath()%>/routeV2/V2/data/cost_monitoring_base/v4',
            serverSide: true,
            dom: "<'row'<'col-sm-12 col-md-6'B><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'l><'col-sm-12 col-md-3'i><'col-sm-12 col-md-7 mt-2'p>>",
            lengthMenu: [ [10, 25, 50, -1], [10, 25, 50, "барча"] ],
            columns: [
                {
                    title: '№',
                    data: null,
                    sortable: false,
                    searchable: false,
                    render: function (data, type, row, meta) {return meta.row + meta.settings._iDisplayStart + 1},
                    className: 'text-center'
                },
                {
                    name: 'locationId',
                    title: appTableV3.locationNm,
                    data: 'locationId',
                    render: (_, __, row) => {
                        return '<a class="text-primary font-weight-bold cursor-pointer"><u>' + row.locationNm + '</u></a>';
                    },
                    className: "dt-head-center"
                },
                {
                    name: 'userNm',
                    title: appTableV3.userNm,
                    data: 'userNm',
                    className: "dt-head-center"
                },
                {
                    name: 'g33',
                    title: appTableV3.g33,
                    data: 'g33',
                    className: "dt-head-center"
                },
                {
                    name: 'keyword',
                    title: appTableV3.keyword,
                    data: 'keyword',
                    className: "dt-head-center"
                },
                {
                    name: 'resultCount',
                    title: appTableV3.resultCount,
                    data: 'resultCount',
                    render: (_, __, row) => {
                        return '<span class="text-primary font-weight-bold"><u>' + row.resultCount + '</u></span>';
                    },
                    className: "dt-head-center"
                },
                {
                    name: 'insTime',
                    title: appTableV3.insTime,
                    data: 'insTime',
                    render: $.fn.dataTable.render.moment('YYYY-MM-DDTHH:mm:ss.SSSSZ','YYYY-MM-DD HH:mm' ),
                    className: "dt-head-center"
                }
            ],
            colReorder: true,
            order: [[1, 'asc']],
            language: {
                url: '${pageContext.servletContext.contextPath}/resources/assets/json/datatablePlugini18/plugin_i18_'+sessionData.language+'.json'
            },
        });

        function ugtkV3Select() {
            var filter = '';
            $('select#ugtkV3 option:selected').each(function() {
                filter += $(this).val() + "+";
            });
            filter = filter.substring(0, filter.length - 1);
            return filter;
        }


        $('.updateAppTableV3').on('click', function () {
            app_table_03
                .column('insTime:name').search($('input#insTimeV3').val().replace(' — ', ';'))
                .column('resultCount:name').search($('input#resultCountV3').val())
                .column('keyword:name').search($('input#keywordV3').val())
                .column('g33:name').search($('input#g33V3').val())
                .column('userNm:name').search($('input#userNmV3').val())
                .column('locationId:name').search(ugtkV3Select()).draw()
        });
        $(document).ready(function () {
            app_table_03.on('order.dt search.dt', function () {
                let i = 1;
                app_table_03.cells(null, 0, {search: 'applied', order: 'applied'}).every(function (cell) {
                    this.data(i++);
                });
            }).draw();
            flatpickr('.insTimeV3', {
                "minDate": new Date().fp_incr(-1028),
                "maxDate": "today",
                "mode": "range",
                "rangeSeparator": " au ",
                "locale": "lang" ,
                defaultDate: [new Date().fp_incr(-1), "today"]
            });
        });
    </script>
</body>