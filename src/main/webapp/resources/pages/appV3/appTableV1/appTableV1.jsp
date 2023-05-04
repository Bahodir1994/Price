<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/locale.jsp" %>
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
    <link rel="stylesheet" href="https://unpkg.com/tippy.js@5/dist/backdrop.css" />
    <style>
        textarea {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            width: 100%!important;
        }
        .g31Wi {
            min-width: 500px!important
        }
        textarea .g31Name {
             min-width: 500px!important
        }

    </style>
</head>
<body>
    <div class="page-wrapper" id="container">
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-sm-12 my-0 py-0 px-0 " style="vertical-align: middle">
                        <div class="justify-content-center py-1 pb-2 mt-2">
                            <div class="form-row m-0 justify-content-center">
                                <div class="form-group col-xl-2 col-lg-4 mr-2  p-0 text-center" data-tg-tour="Step 3" data-tg-title="Example heading 3">
                                    <label for="locationId" class="f-w-600" style=" margin-right: 5px;"><fmt:message key="regionalCustomsOffice" bundle="${resourceBundle}"/></label>
                                    <select class="selectpicker form-control show-menu-arrow locationId"
                                            data-style="form-control form-control-sm" id="locationId" multiple
                                            data-selected-text-format="count > 3" data-actions-box="true"
                                            data-live-search="true">
                                        <c:forEach items="${location}" var="location" varStatus="i">
                                            <option class="option-class"
                                                    value="${location.code}"
                                                    data-subtext="${location.code}">${location.cdNm}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-xl-2 col-lg-4 col-sm-2 mr-2  p-0 text-center">
                                    <label for="status" class="f-w-600" style=" margin-right: 5px;"><fmt:message key="status" bundle="${resourceBundle}"/></label>
                                    <select class="selectpicker form-control show-menu-arrow status"
                                            data-style="form-control form-control-sm" id="status" multiple
                                            data-selected-text-format="count > 3" data-actions-box="true"
                                            data-live-search="true">
                                        <c:forEach items="${status}" var="status" varStatus="i">
                                            <option data-icon="fab fa-bandcamp text-success" class="option-class" value="${status.id}"
                                                    data-subtext="${status.id}">${status.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-xl-1 col-lg-3 text-right m-0 p-0 mr-1">
                                    <label for="appDateStart"
                                           class="f-w-600"
                                           style=" margin-right: 5px;"><fmt:message key="from" bundle="${resourceBundle}"/>: </label>
                                    <input type="date" class="form-control form-control-sm w-100 appDateStart" maxlength="8" tabindex="1" name="appDateStart" id="appDateStart">
                                </div>
                                <div class="form-group col-xl-1 col-lg-3 col-md-1 col-sm-1 text-right m-0 p-0">
                                    <label for="appDateEnd" class="f-w-600" ><fmt:message key="to" bundle="${resourceBundle}"/>: </label>
                                    <input type="date" class="form-control form-control-sm w-100 appDateEnd" maxlength="10" tabindex="2" name="appDateEnd" id="appDateEnd">
                                </div>
                                <div class="form-group col-xl-1 col-lg-2 col-md-1 col-sm-1 text-right ml-1 p-0 " style="margin-top: 20px">
                                    <button type="button" tabindex="3"
                                            class="btn btn-sm btn-outline-primary f-w-900  updateAppTableV1"
                                            style="border-radius: 5px">
                                        <i class="feather icon-search"></i>&nbsp;<fmt:message key="search" bundle="${resourceBundle}"/>
                                    </button>
                                </div>

                                <div class="card-header-right " style="position: absolute; z-index: 3; margin-top: -1.2%; margin-left: 94%">
                                    <div class="btn-group card-option">
                                        <button type="button" class="btn dropdown-toggle has-ripple" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="feather icon-more-horizontal"></i>
                                            <span class="ripple ripple-animate" style="height: 20px; width: 20px; animation-duration: 0.689655s; animation-timing-function: linear; background: rgb(136, 136, 136); opacity: 0.4; top: -4.375px; left: 0px;"></span>
                                        </button>
                                        <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right" style="">
                                            <li class="dropdown-item full-card" id="toggle_fullscreen"><span style=""><i
                                                    class="feather icon-maximize"></i> <fmt:message key="sizeResize" bundle="${resourceBundle}"/></span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="col-12">
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl modal-autoheight" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #7497ea">
                            <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-history text-white"></i> <fmt:message key="reportLable" bundle="${resourceBundle}"/></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <ul class="nav nav-pills m-auto w-75 justify-content-center" id="pills-tab" role="tablist">
                                <li class="nav-item w-50 border border-primary rounded-0 text-center"
                                    onclick="appFuncV2_ajax_v1()">
                                    <a class="nav-link active rounded-0" id="pills-home-tab" data-toggle="pill"
                                       href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true"><fmt:message key="lineInspectors" bundle="${resourceBundle}"/></a>
                                </li>
                                <li class="nav-item w-50 border border-primary rounded-0 text-center"
                                    onclick="appFuncV2_ajax_v2()">
                                    <a class="nav-link rounded-0" id="pills-profile-tab" data-toggle="pill"
                                       href="#pills-profile"
                                       role="tab" aria-controls="pills-profile" aria-selected="false"><fmt:message key="lineCustoms" bundle="${resourceBundle}"/></a>
                                </li>
                            </ul>
                            <div class="border-top border-bottom-info" id="pills-tabContent">

                            </div>
                        </div>
                        <div class="modal-footer">
                            <%--                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                            <%--                            <button type="button" class="btn btn-primary">Save changes</button>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="modal fade" id="columnSetting" tabindex="-1" role="dialog" aria-labelledby="columnSettingTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl modal-autoheight" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #7497ea">
                            <h5 class="modal-title" id="columnSettingLongTitle1"><i class="fa fa-history "></i> <fmt:message key="columnSetting" bundle="${resourceBundle}"/></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body appTableV1SettingModal"></div>
                        <div class="modal-footer">
                            <%--                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                            <%--                            <button type="button" class="btn btn-primary">Save changes</button>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="mt-0 dt-responsive p-2">
                    <table id="app_table_01" class="table table-striped row-border order-column table-bordered" cellspacing="0" style="width: 100%">
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/jquery.spring-friendly.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/dataTables.colReorder.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/dataTables.fixedHeader.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/dataTables.fixedColumns.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/dataTables.buttons.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/jszip.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/pdfmake.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/buttons.html5.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/buttons.print.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/buttons.bootstrap4.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/dataTables.dateTime.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/jquery.dataTables.colResize.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/jquery.maskMoney.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/datetime.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/lottie.js"></script>
    <script type="text/javascript"
            id="plugin_column_i18" src="${pageContext.servletContext.contextPath}/resources/pages/appV3/js/plugin_column_i18_${sessionLanguage}.js"></script>
    <script src="https://unpkg.com/popper.js@1"></script>
    <script src="https://unpkg.com/tippy.js@5"></script>
    <script>
        $('.selectpicker').selectpicker();
        var sessionData = ${sessionGetterDataValue};

        setTimeout(() => {
            fisibatoreColumns();
        }, 100);
        var app_table_01 = $('#app_table_01').DataTable({
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
            ajax: '<%=request.getContextPath()%>/routeV3/V1/data/decision_charges/v2',
            serverSide: true,
            dom: "<'row'<'col-sm-12 col-md-6'R><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'l><'col-sm-12 col-md-3'i><'col-sm-12 col-md-7 mt-2'p>>",
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, appTableV1.all]],
            fields: [{name: 'g33', mask: '0000 00 000 0'}],
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
                {className: "dt-head-center", title: appTableV1.appNum, name: 'appNum', data: 'appNum', render: (_, __, row) => {
                    return '<a href="javascript:appFuncV2_ajax_v0(' + "'" + row.id + "'" + ')" class="text-primary font-weight-bold"><u>' + row.appNum + '</u></a>';}
                },
                {
                    className: "dt-head-center",
                    title: appTableV1.status,
                    name: 'status',
                    data: 'status',
                    render: (_, __, row) => {
                        return '<a  data-toggle="tooltip" data-placement="top" data-class="my-tooltip" class="font-weight-bolder"><i class="fas fa-history"/> <u>' + row.statusNm + '</u></a>';
                    }
                },
                {className: "dt-head-center", title: appTableV1.appDate, name: 'appDate', data: 'appDate'},
                {className: "dt-head-center", title: appTableV1.location, name: 'locationId', data: 'locationId', render: (_, __, row) => row.locationNm},
                {className: "dt-head-center", title: appTableV1.personFio, name: 'personFio', data: 'personFio'},
                {className: "dt-head-center", title: appTableV1.customerCountryNm, name: 'customerCountryNm', data: 'customerCountryNm'},
                {className: "dt-head-center", title: appTableV1.senderCountryNm, name: 'senderCountryNm', data: 'senderCountryNm'},
                {className: "dt-head-center", title: appTableV1.inspectorName, name: 'inspectorName', data: 'distributedApplications',  render: function (params) {
                    if (![undefined, null].includes(params[0])){return params[0].inspectorName} else {return '-';}
                }},
            ],
            colReorder: true,
            colResize: true,
            order: [[1, 'asc']],
            language: {url: '${pageContext.servletContext.contextPath}/resources/assets/json/datatablePlugini18/plugin_i18_'+sessionData.language+'.json'},
        });
        $(document).ready(function () {
            app_table_01.on('order.dt search.dt', function () {
                let i = 1;
                app_table_01.cells(null, 0, {search: 'applied', order: 'applied'}).every(function (cell) {
                    this.data(i++);
                });
            }).draw();
        });

        $('.updateAppTableV1').on('click', function () {

            var locationList = '';
            $('select#locationId option:selected').each(function() {
                locationList += $(this).val() + "+";
            });
            locationList = locationList.substring(0, locationList.length - 1);

            var statusList = '';
            $('select#status option:selected').each(function() {
                statusList += $(this).val() + "+";
            });
            statusList = statusList.substring(0, statusList.length - 1);

            app_table_01
                .column('locationId:name').search(locationList)
                .column('appDate:name').search($('input#appDateStart').val() + ';' + $('input#appDateEnd').val())
                .column('status:name').search(statusList)
                .draw();
        })
        $('#toggle_fullscreen').on('click', function () {
            if (document.fullscreenElement) {
                document.exitFullscreen();
                $('.toggle_fullscreen').html('<i class="kic"/>')
            } else {
                $('#container').get(0).requestFullscreen();
                $('.toggle_fullscreen').html('<i class="kat"/>')
            }
        });
        $('.updateAppTableV2V3').on('click', function () {
            $('#pills-profile-tab').removeClass('active')
            $('#pills-home-tab').removeClass('active').addClass('active')
            $('#pills-tabContent').html('')
            var preImg = '<div class="col-12 m-auto"><lottie-player src="${pageContext.servletContext.contextPath}/resources/assets/images/jsonImage/report.json"   background="transparent"  speed="2"  style="margin-left:auto;    margin-right:auto; width: 500px; height: 500px;"  loop  autoplay></lottie-player> </div>';
            $('#pills-tabContent').html(preImg);
            setTimeout(() => {
                appFuncV2_ajax_v1();
            }, 1500);
        })

        function appFuncV2_ajax_v1() {
            $.ajax({
                type: "GET",
                url: "${pageContext.servletContext.contextPath}/routeV2/V2/data/cost_monitoring_base/v1",
                beforeSend: function () {

                },
                accept: function () {
                },
                success: function (response) {
                    $('#pills-tabContent').html(response);
                },
                error: function () {

                }
            });
        }
        function appFuncV2_ajax_v2() {
            $.ajax({
                type: "GET",
                url: "${pageContext.servletContext.contextPath}/routeV2/V2/data/cost_monitoring_base/v3",
                beforeSend: function () {
                },
                accept: function () {
                },
                success: function (response) {
                    $('#pills-tabContent').html(response);
                },
                error: function () {

                }
            });
        }
        function appFuncV2_ajax_v0(id) {
            var params = {
                "id": id
            }
            $.ajax({
                data: params,
                type: "GET",
                url: "${pageContext.servletContext.contextPath}/routeV3/V2/data/decision_charges/v1",
                beforeSend: function () {
                },
                accept: function () {
                },
                success: function (response) {
                    $("#main-body").html(response);
                    myMenu()
                    $.toast({
                        position: 'bottom-right',
                        heading: 'Ариза бўйича тўлиқ маълумот!',
                        text: '.....',
                        icon: 'info',
                        hideAfter: 5000,
                        loader: true,        // Change it to false to disable loader
                        loaderBg: '#9EC600'  // To change the background
                    })
                },
                error: function () {

                }
            });
        }
        function columnSetting() {
            $.ajax({
                type: "GET",
                // data: JSON.stringify(dataS),
                url: "<%=request.getContextPath()%>/routeV2/V3/data/cost_monitoring_base/v1",
                // dataType: "json",
                // async: true,
                // contentType: 'application/json',
                beforeSend: function () {
                },
                complete: function () {
                },
                success: function (res) {
                    $('.appTableV1SettingModal').html(res);
                },
                error: function (res) {
                }
            });
        }
        function fisibatoreColumns(){app_table_01.column('locationId:name').visible(true)}
        function fisibatoreColumnsAfter(){
            $.ajax({
                type: "GET",
                url: "<%=request.getContextPath()%>/routeV2/V3/data/cost_monitoring_base/v3",
                dataType: "json",
                async: true,
                contentType: 'application/json',
                beforeSend: function () {
                },
                complete: function (response) {
                    let columnList = response.responseJSON.columns.activeSetting;

                    app_table_01.column('ugtk:name').visible(columnList.ugtk)
                    app_table_01.column('g7A:name').visible(columnList.g7A);
                    app_table_01.column('g7B:name').visible(columnList.g7B);
                    app_table_01.column('g7C:name').visible(columnList.g7C);
                    app_table_01.column('g7Ag7Bg7C:name').visible(columnList.g7Ag7Bg7C);
                    app_table_01.column('g1A:name').visible(columnList.g1A);
                    app_table_01.column('g1B:name').visible(columnList.g1B);
                    app_table_01.column('g1Ag1B:name').visible(columnList.g1Ag1B);
                    app_table_01.column('g32:name').visible(columnList.g32);
                    app_table_01.column('g37B:name').visible(columnList.g37B);
                    app_table_01.column('g37C:name').visible(columnList.g37C);
                    app_table_01.column('g2Name:name').visible(columnList.g2Name);
                    app_table_01.column('g8Code2:name').visible(columnList.g8Code2);
                    app_table_01.column('g33:name').visible(columnList.g33);
                    app_table_01.column('g31Name:name').visible(columnList.g31Name);
                    app_table_01.column('g15:name').visible(columnList.g15);
                    app_table_01.column('g11:name').visible(columnList.g11);
                    app_table_01.column('vidKontrakta:name').visible(columnList.vidKontrakta);
                    app_table_01.column('g34:name').visible(columnList.g34);
                    app_table_01.column('s34:name').visible(columnList.s34);
                    app_table_01.column('g25:name').visible(columnList.g25);
                    app_table_01.column('g20A:name').visible(columnList.g20A);
                    app_table_01.column('g20B:name').visible(columnList.g20B);
                    app_table_01.column('g20Name:name').visible(columnList.g20Name);
                    app_table_01.column('g20Ag20B:name').visible(columnList.g20Ag20B);
                    app_table_01.column('g22A:name').visible(columnList.g22A);
                    app_table_01.column('g45:name').visible(columnList.g45);
                    app_table_01.column('g45Usd:name').visible(columnList.g45Usd);
                    app_table_01.column('g42:name').visible(columnList.g42);
                    app_table_01.column('g42Usd:name').visible(columnList.g42Usd);
                    app_table_01.column('indxusd:name').visible(columnList.indxusd);
                    app_table_01.column('indxusdLn:name').visible(columnList.indxusdLn);
                    app_table_01.column('g45Usded:name').visible(columnList.g45Usded);
                    app_table_01.column('g45UsdedLn:name').visible(columnList.g45UsdedLn);
                    app_table_01.column('g31Marka:name').visible(columnList.g31Marka);
                    app_table_01.column('g35:name').visible(columnList.g35);
                    app_table_01.column('g38:name').visible(columnList.g38);
                    app_table_01.column('g41:name').visible(columnList.g41);
                    app_table_01.column('g43:name').visible(columnList.g43);
                    app_table_01.column('g31Amount:name').visible(columnList.g31Amount);
                    app_table_01.column('vesEd:name').visible(columnList.vesEd);
                    app_table_01.column('gdvipdate:name').visible(columnList.gdvipdate);
                    app_table_01.column('gc3Date:name').visible(columnList.gc3Date);
                    app_table_01.column('metod:name').visible(columnList.metod);
                    app_table_01.column('vzaimosvyaz:name').visible(columnList.vzaimosvyaz);
                    app_table_01.column('idn:name').visible(columnList.idn);
                    app_table_01.column('obl:name').visible(columnList.obl);
                    app_table_01.column('lgot20:name').visible(columnList.lgot20);
                    app_table_01.column('lgot27:name').visible(columnList.lgot27);
                    app_table_01.column('lgot29:name').visible(columnList.lgot29);
                    app_table_01.column('sovstavka:name').visible(columnList.sovstavka);
                    app_table_01.column('asosQiymat:name').visible(columnList.asosQiymat);
                    app_table_01.column('ktd:name').visible(columnList.ktd);
                }
            });
        }
        function openText(x) {
            if (x === 0){
                $('textarea.g31Name').attr('rows', 1)
            }else if(x===1){
                $('textarea.g31Name').attr('rows', 10)
            }

        }
        function myTalk() {
            var group = document.forms[0];
            var txt = "";
            var i;
            for (i = 0; i < group.length; i++) {
                if (group[i].checked) {
                    txt = txt + group[i].value + " ";
                }
            }
            document.getElementById("order").value = "You ordered a coffee with: " + txt;
        }
    </script>
</body>