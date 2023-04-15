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
</head>
<body>
    <div class="page-wrapper">
        <div class="row">
            <div class="col-sm-12">
                <div class="mt-0 dt-responsive p-2">
                    <table id="app_table_03" class="table row-border order-column nowrap" style="width: 100%">
                        <thead>
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
        </div>
    </div>
    <script>
    $('select').selectpicker();
    var table = $('#app_table_03').DataTable({
        scrollY:        '70vh',
        scrollX:        true,
        scrollCollapse: true,
        scrollResize: true,
        fixedHeader: {
            header: true,
            headerOffset: $('#fixed').height()
        },
        fixedColumns:   {
            left: 1
        },
        searching: true,
        processing: true,
        responsive: true,
        ajax: '<%=request.getContextPath()%>/routeV2/data/cost_monitoring_base/v6',
        serverSide: true,
        dom: "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-1'l><'col-sm-12 col-md-4'i><'col-sm-12 col-md-7'p>>",
        lengthMenu: [ [10, 25, 50, -1], [10, 25, 50, "барча"] ],
        columns: [
            {
                // title: '№',
                data: null,
                sortable: false,
                searchable: false,
                orderable: false,
                render: function (data, type, row, meta) {return meta.row + meta.settings._iDisplayStart + 1}
            },
            {
                // title: 'БЮД рақами',
                data: 'gc3Date'
            },
            {
                // title: 'ТИФ ТН код',
                data: 'g33'
            },
            {
                // title: 'Режим',
                data: 'g33'
            },
            {
                // title: 'Юк жўн. мамлакат',
                data: 'g33'
            },
            {
                // title: 'Ишлаб чиқ. мамлакат',
                data: 'g33'
            },
            {
                // title: 'Савдо қил. мамлакат',
                data: 'g33'
            },
            {
                // title: 'Етк. бер. шарти',
                data: 'g33'
            },
            {
                // title: 'Етк. бер. пункти',
                data: 'g33'
            },
            {
                // title: 'Тран. тури',
                data: 'g33'
            },
            {
                // title: 'Товар тўлиқ номи',
                data: 'g33'
            },
            {
                // title: 'Марка',
                data: 'g33'
            },
            {
                // title: 'Б.Қ. индекси АҚШ долл.',
                data: 'g33'
            },
            {
                // title: 'Б.Қ. АҚШ долл.',
                data: 'g33'
            },
            {
                // title: 'Ф.Қ. АҚШ долл.',
                data: 'g33'
            },
            {
                // title: 'Метод',
                data: 'g33'
            },
            {
                // title: 'Нетто',
                data: 'g33'
            },
            {
                // title: 'Брутто',
                data: 'g33'
            },
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
    </script>
</body>