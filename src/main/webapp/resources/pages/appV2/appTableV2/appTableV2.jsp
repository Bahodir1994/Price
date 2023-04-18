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
<body>
    <div class="page-wrapper">
        <div class="row">
            <div class="col-sm-12">
                <div class="mt-0 dt-responsive p-2">
                    <table id="app_table_02" class="table table-striped row-border order-column table-bordered" style="width: 100%">
                        <tfoot>
                            <tr>
                                <th></th>
                                <th>
                                    <select class="selectpicker form-control show-menu-arrow ugtkV2"
                                            data-style="form-control form-control-sm"
                                            id="ugtkV2" multiple
                                            data-selected-text-format="count > 3"
                                            data-actions-box="true" data-live-search="true">
                                        <c:forEach items="${location}" var="location" varStatus="i">
                                            <option class="option-class" value="${location.code.substring(0,2)}" data-subtext="${location.code}">${location.cdNm}</option>
                                        </c:forEach>
                                    </select>
                                </th>
                                <th>
                                    <input type="text" id="inspectorNmV2" class="form-control form-control-sm w-100 g31Name">
                                </th>
                                <th></th>
                                <th></th>
                                <th>
                                    <input type="date"
                                           class="form-control form-control-sm px-1 insTimeV3"
                                           id="insTimeV3"
                                           maxlength="10" tabindex="1"
                                           name="insTimeV3">
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
        function newexportaction(e, dt, button, config) {
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
        var app_table_02 = $('#app_table_02').DataTable({
            scrollY:        '51vh',
            scrollX:        true,
            scrollCollapse: true,
            scrollResize: true,
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
                    action: newexportaction
                },
            ],
            searching: true,
            processing: true,
            // responsive: true,
            ajax: '<%=request.getContextPath()%>/routeV2/data/cost_monitoring_base/v4',
            serverSide: true,
            dom: "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'l><'col-sm-12 col-md-3'i><'col-sm-12 col-md-7 mt-2'p>>",            lengthMenu: [ [10, 25, 50, -1], [10, 25, 50, "барча"] ],
            columns: [
                {
                    title: '№',
                    data: null,
                    sortable: false,
                    searchable: false,
                    render: function (data, type, row, meta) {return meta.row + meta.settings._iDisplayStart + 1}
                },
                {
                    title: appTableV2.locationNm,
                    data: 'locationNm',
                },
                {
                    title: appTableV2.userNm,
                    data: 'userNm'
                },
                {
                    title: appTableV2.resultTime,
                    data: 'resultTime'
                },
                {
                    title: appTableV2.g33,
                    data: 'g33'
                },
                {
                    title: appTableV2.insTime,
                    data: 'insTime',
                    render: $.fn.dataTable.render.moment('YYYY-MM-DDTHH:mm:ss.SSSSZ','YYYY-MM-DD HH:mm' )
                }
            ],
            colReorder: true,
            order: [[1, 'asc']],
            language: {
                url: '${pageContext.servletContext.contextPath}/resources/assets/json/datatablePlugini18/plugin_i18_'+sessionData.language+'.json'
            },
        });

        var minFirstDay = $('input#minFirstDay');
        var maxFirstDay = $('input#maxFirstDay');
        var onDateBoundChange = function () {
            app_table_02.column('.insTime').search(minFirstDay.val() + ';' + maxFirstDay.val()).draw();
        };
        $('.updateAppTableV1').on('click', function () {
            onDateBoundChange();
        })
        $(document).ready(function () {
            app_table_02.on('order.dt search.dt', function () {
                let i = 1;
                app_table_02.cells(null, 0, {search: 'applied', order: 'applied'}).every(function (cell) {
                    this.data(i++);
                });
            }).draw();
        });
    </script>
</body>