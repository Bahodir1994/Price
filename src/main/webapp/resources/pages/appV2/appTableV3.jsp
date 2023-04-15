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
                    <table id="app_table_03" class="table table-striped row-border order-column table-bordered" style="width: 100%">
                        <thead class="text-center">
                            <tr>
                                <th>№</th>
                                <th>Tаркибий тузулма</th>
                                <th>Ходим</th>
                                <th>Тиф Тн кодлари сони</th>
                                <th>Ишлатилган калит сўз</th>
                                <th>Топилган қайдлар сони</th>
                                <th>Излаш вақти</th>
                            </tr>
                        </thead>
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
    var table3 = $('#app_table_03').DataTable({
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
                action: newexportaction2
            },
        ],
        searching: true,
        processing: true,
        responsive: true,
        ajax: '<%=request.getContextPath()%>/routeV2/data/cost_monitoring_base/v6',
        serverSide: true,
        dom: "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'Btr>> <'row'<'col-sm-12 col-md-1'l><'col-sm-12 col-md-4'i><'col-sm-12 col-md-7'p>>",
        lengthMenu: [ [10, 25, 50, -1], [10, 25, 50, "барча"] ],
        columns: [
            {
                data: null,
                sortable: false,
                searchable: false,
                render: function (data, type, row, meta) {return meta.row + meta.settings._iDisplayStart + 1}
            },
            {
                data: 'locationNm'
            },
            {
                data: 'userNm'
            },
            {
                data: 'g33'
            },
            {
                data: 'keyword'
            },
            {
                data: 'resultCount'
            },
            {
                data: 'insTime',
                render: $.fn.dataTable.render.moment('YYYY-MM-DDTHH:mm:ss.SSSSZ','YYYY-MM-DD HH:mm' )
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
        table3.column('.insTime').search(minFirstDay.val() + ';' + maxFirstDay.val()).draw();
    };
    $('.updateAppTableV1').on('click', function () {
        onDateBoundChange();
    })
    $(document).ready(function () {
        table3.on('order.dt search.dt', function () {
            let i = 1;
            table3.cells(null, 0, {search: 'applied', order: 'applied'}).every(function (cell) {
                this.data(i++);
            });
        }).draw();
    });
    table3.columns.adjust();
    </script>
</body>