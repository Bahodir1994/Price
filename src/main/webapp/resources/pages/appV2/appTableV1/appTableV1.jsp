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
                                <div class="form-group mx-2  p-0 text-center" data-tg-tour="Step 1" data-tg-title="Example heading 1">
                                    <label for="g33" class="f-w-600" style=" margin-right: 5px;"><fmt:message key="hsCode" bundle="${resourceBundle}"/></label>
                                    <input type="text" id="g33" class="form-control form-control-sm w-100 g33" placeholder="0000 00 000 0">
                                </div>
                                <div class="form-group mx-2  p-0 text-center" data-tg-tour="Step 2" data-tg-title="Example heading 2">
                                    <label for="g31Name" class="f-w-600" style=" margin-right: 5px;"><fmt:message key="commodityName" bundle="${resourceBundle}"/></label>
                                    <input type="text" id="g31Name" class="form-control form-control-sm w-100 g31Name"
                                           placeholder="BYD">
                                </div>
                                <div class="form-group mr-2  p-0 text-center" data-tg-tour="Step 3" data-tg-title="Example heading 3">
                                    <label for="g15" class="f-w-600" style=" margin-right: 5px;"><fmt:message key="shipmentCountry" bundle="${resourceBundle}"/></label>
                                    <select class="selectpicker form-control show-menu-arrow g15"
                                            data-style="form-control form-control-sm" id="g15" multiple
                                            data-selected-text-format="count > 3" data-actions-box="true"
                                            data-live-search="true">
                                        <c:forEach items="${country}" var="country" varStatus="i">
                                            <option data-icon="fi fi-${country.cdIdL}" class="option-class"
                                                    value="${country.code}"
                                                    data-subtext="${country.code}">${country.cdNm}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-sm-2 mr-2  p-0 text-center">
                                    <label for="g11" class="f-w-600" style=" margin-right: 5px;"><fmt:message key="originCountry" bundle="${resourceBundle}"/></label>
                                    <select class="selectpicker form-control show-menu-arrow g11"
                                            data-style="form-control form-control-sm" id="g11" multiple
                                            data-selected-text-format="count > 3" data-actions-box="true"
                                            data-live-search="true">
                                        <c:forEach items="${country}" var="country" varStatus="i">
                                            <option data-icon="fi fi-${country.cdIdL}" class="option-class" value="${country.code}"
                                                    data-subtext="${country.code}">${country.cdNm}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group text-right m-0 p-0 mr-1">
                                    <label for="gc3DateStart"
                                           class="f-w-600"
                                           style=" margin-right: 5px;"><fmt:message key="from" bundle="${resourceBundle}"/>: </label>
                                    <input type="date" class="form-control form-control-sm w-100 gc3DateStart" maxlength="10" tabindex="1" name="dcodate" id="gc3DateStart">
                                </div>
                                <div class="form-group col-md-1 col-sm-1 text-right m-0 p-0"><label for="gc3DateEnd" class="f-w-600" style=" margin-right: 5px;"><fmt:message key="to" bundle="${resourceBundle}"/>: </label>
                                    <input type="date" class="form-control form-control-sm w-100 gc3DateEnd" maxlength="10" tabindex="2" name="dcodate" id="gc3DateEnd">
                                </div>
                                <div class="form-group col-md-1 col-sm-1 text-right ml-1 p-0 " style="margin-top: 20px">
                                    <button type="button" tabindex="3"
                                            class="btn btn-sm btn-outline-primary f-w-900 w-75 updateAppTableV1"
                                            style="border-radius: 5px">
                                        <i class="feather icon-search"></i>&nbsp;<fmt:message key="search" bundle="${resourceBundle}"/>
                                    </button>
                                </div>
                                <div class="form-group col-md-1 col-sm-1 text-right ml-1 p-0 " style="margin-top: 20px">
                                    <button type="button" tabindex="3"
                                            class="btn btn-sm btn-outline-success f-w-900 w-75 updateAppTableV2V3"
                                            style="border-radius: 5px" data-toggle="modal"
                                            data-target="#exampleModalCenter">
                                        <i class="feather icon-bar-chart"></i>&nbsp;<fmt:message key="report" bundle="${resourceBundle}"/>
                                    </button>
                                </div>
                                <div class="form-group col-md-1 col-sm-1 text-right ml-1 p-0 " style="margin-top: 20px">
                                    <button type="button" tabindex="3"
                                            class="btn btn-sm btn-outline-primary f-w-900 w-75"
                                            style="border-radius: 5px"
                                            data-toggle="modal"
                                            data-target="#columnSetting"
                                            onclick="columnSetting()">
                                        <i class="fas fa-wrench"></i> <fmt:message key="configuration" bundle="${resourceBundle}"/>
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
                    <div class="col-sm-12 p-2">
                        <div id="main">
                            <div class="container-fluid">
                                <div class="" id="faq">
                                    <div class="card m-0">
                                        <div class="card-header" id="faqhead2">
                                            <a href="#" class="btn btn-header-link collapsed" data-toggle="collapse"
                                               data-target="#faq2" aria-expanded="true" aria-controls="faq2"><fmt:message key="additionalSearch" bundle="${resourceBundle}"/></a>
                                        </div>
                                        <div id="faq2" class="collapse" aria-labelledby="faqhead2" data-parent="#faq">
                                            <div class="card-body text-left justify-content-center">
                                                <form>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-2" data-tg-tour="Step 4" data-tg-title="Example heading 4">
                                                            <label for="ugtk"><fmt:message key="regionalCustomsOffice" bundle="${resourceBundle}"/></label>
                                                            <select class="selectpicker form-control show-menu-arrow ugtk"
                                                                    data-style="form-control form-control-sm"
                                                                    id="ugtk" multiple
                                                                    data-selected-text-format="count > 3"
                                                                    data-actions-box="true" data-live-search="true">
                                                                <c:forEach items="${location}" var="location" varStatus="i">
                                                                    <option class="option-class" value="${location.code.substring(2,4)}" data-subtext="${location.code}">${location.cdNm}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="g37C"><fmt:message key="transferFeature" bundle="${resourceBundle}"/></label>
                                                            <select class="selectpicker form-control show-menu-arrow g37C"
                                                                    data-style="form-control form-control-sm"
                                                                    id="g37C" multiple
                                                                    data-selected-text-format="count > 3"
                                                                    data-actions-box="true" data-live-search="true">
                                                                <c:forEach items="${featMove}" var="featMove" varStatus="i">
                                                                    <option class="option-class" value="${featMove.code}" >${featMove.code}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="g41"><fmt:message key="additionalUnitMeasurement" bundle="${resourceBundle}"/></label>
                                                            <select class="selectpicker form-control show-menu-arrow g41"
                                                                    data-style="form-control form-control-sm"
                                                                    id="g41" multiple
                                                                    data-selected-text-format="count > 3"
                                                                    data-actions-box="true" data-live-search="true">
                                                                <c:forEach items="${unit}" var="unit" varStatus="i">
                                                                    <option class="option-class" value="${unit.code}" >${unit.code} - ${unit.cdDesc}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="g1B"><fmt:message key="customsMode" bundle="${resourceBundle}"/></label>
                                                            <select class="selectpicker form-control show-menu-arrow g1B"
                                                                    data-style="form-control form-control-sm"
                                                                    id="g1B" multiple
                                                                    data-selected-text-format="count > 3"
                                                                    data-actions-box="true" data-live-search="true">
                                                                <c:forEach items="${customsMode}" var="customsMode" varStatus="i">
                                                                    <option class="option-class" value="${customsMode.code}" >${customsMode.code} - ${customsMode.cdDesc}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="g20A"><fmt:message key="deliveryCondition" bundle="${resourceBundle}"/></label>
                                                            <select class="selectpicker form-control show-menu-arrow g20A"
                                                                    data-style="form-control form-control-sm"
                                                                    id="g20A" multiple
                                                                    data-selected-text-format="count > 3"
                                                                    data-actions-box="true" data-live-search="true">
                                                                <c:forEach items="${deliveryTerms}" var="deliveryTerms" varStatus="i">
                                                                    <option class="option-class" value="${deliveryTerms.raqam}" >${deliveryTerms.raqam} - ${deliveryTerms.sign}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-1">
                                                            <label for="g7BStart"><fmt:message key="ccd" bundle="${resourceBundle}"/> (:<fmt:message key="from" bundle="${resourceBundle}"/>)</label>
                                                            <input type="date"
                                                                   class="form-control form-control-sm px-1 g7BStart"
                                                                   id="g7BStart"
                                                                   maxlength="10" tabindex="1"
                                                                   name="dcodate">
                                                        </div>
                                                        <div class="form-group col-md-1">
                                                            <label for="g7BEnd"><fmt:message key="ccd" bundle="${resourceBundle}"/> (:<fmt:message key="to" bundle="${resourceBundle}"/>)</label>
                                                            <input type="date"
                                                                   class="form-control form-control-sm px-1 g7BEnd"
                                                                   id="g7BEnd"
                                                                   maxlength="10" tabindex="1"
                                                                   name="dcodate">
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="g7A"><fmt:message key="customsPost" bundle="${resourceBundle}"/> </label>
                                                            <select class="selectpicker form-control show-menu-arrow g7A"
                                                                    data-style="form-control form-control-sm"
                                                                    id="g7A" multiple
                                                                    data-selected-text-format="count > 3"
                                                                    data-actions-box="true" data-live-search="true">
                                                                <c:forEach items="${post}" var="post" varStatus="i">
                                                                    <option class="option-class" value="${post.code}" >${post.code} - ${post.cdNm}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="vidKontrakta"><fmt:message key="existenceContract" bundle="${resourceBundle}"/></label>
                                                            <select class="selectpicker form-control show-menu-arrow vidKontrakta"
                                                                    data-style="form-control form-control-sm"
                                                                    id="vidKontrakta" multiple
                                                                    data-selected-text-format="count > 3"
                                                                    data-live-search="true">
                                                                <option class="option-class" value="1"><fmt:message key="yes" bundle="${resourceBundle}"/></option>
                                                                <option class="option-class" value="0"><fmt:message key="no" bundle="${resourceBundle}"/></option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="metod"><fmt:message key="method" bundle="${resourceBundle}"/></label>
                                                            <select class="selectpicker form-control show-menu-arrow metod"
                                                                    data-style="form-control form-control-sm"
                                                                    id="metod" multiple
                                                                    data-selected-text-format="count > 3"
                                                                    data-actions-box="true" data-live-search="true">
                                                                <c:forEach items="${method}" var="method" varStatus="i">
                                                                    <option class="option-class" value="${method.id}" >${method.id.replace('0','')} - усул</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="g37B"><fmt:message key="oldCustomsMode" bundle="${resourceBundle}"/></label>
                                                            <select class="selectpicker form-control show-menu-arrow g37B"
                                                                    data-style="form-control form-control-sm"
                                                                    id="g37B" multiple
                                                                    data-selected-text-format="count > 3"
                                                                    data-actions-box="true" data-live-search="true">
                                                                <c:forEach items="${customsMode}" var="customsMode" varStatus="i">
                                                                    <option class="option-class" value="${customsMode.code}" >${customsMode.code} - ${customsMode.cdDesc}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="g31Marka"><fmt:message key="brandName" bundle="${resourceBundle}"/></label>
                                                            <input type="text" class="form-control form-control-sm px-1 g31Marka" id="g31Marka" placeholder="<fmt:message key="brandName" bundle="${resourceBundle}"/>">
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="ktd"><fmt:message key="correctionIncluded" bundle="${resourceBundle}"/></label>
                                                            <select class="selectpicker form-control show-menu-arrow ktd"
                                                                    data-style="form-control form-control-sm"
                                                                    id="ktd" multiple
                                                                    data-selected-text-format="count > 3">
                                                                <option class="option-class" value="1"><fmt:message key="yes" bundle="${resourceBundle}"/></option>
                                                                <option class="option-class" value="0"><fmt:message key="no" bundle="${resourceBundle}"/></option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="g7C"><fmt:message key="ccd" bundle="${resourceBundle}"/> <fmt:message key="number" bundle="${resourceBundle}"/></label>
                                                            <input type="text" class="form-control form-control-sm px-1 g7C"
                                                                   id="g7C" placeholder="<fmt:message key="ccd" bundle="${resourceBundle}"/> <fmt:message key="number" bundle="${resourceBundle}"/>">
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="g8Code2"><fmt:message key="importer" bundle="${resourceBundle}"/> <fmt:message key="tin" bundle="${resourceBundle}"/>/<fmt:message key="pin" bundle="${resourceBundle}"/></label>
                                                            <input type="text" class="form-control form-control-sm px-1 g8Code2"
                                                                   id="g8Code2" placeholder="<fmt:message key="tin" bundle="${resourceBundle}"/>/<fmt:message key="pin" bundle="${resourceBundle}"/>">
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="g43"><fmt:message key="needOrCommerce" bundle="${resourceBundle}"/></label>
                                                            <select class="selectpicker form-control show-menu-arrow g43"
                                                                    data-style="form-control form-control-sm"
                                                                    id="g43" multiple
                                                                    data-selected-text-format="count > 3">
                                                                <option class="option-class" value="1"><fmt:message key="yes" bundle="${resourceBundle}"/></option>
                                                                <option class="option-class" value="0"><fmt:message key="no" bundle="${resourceBundle}"/></option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="idn"><fmt:message key="contractIdnNumber" bundle="${resourceBundle}"/></label>
                                                            <input type="text" class="form-control form-control-sm px-1 idn"
                                                                   id="idn" placeholder="<fmt:message key="contractIdnNumber" bundle="${resourceBundle}"/>">
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="asosQiymat"><fmt:message key="customsValueBasis" bundle="${resourceBundle}"/></label>
                                                            <input type="text" class="form-control form-control-sm px-1 asosQiymat"
                                                                   id="asosQiymat" placeholder="<fmt:message key="customsValueBasis" bundle="${resourceBundle}"/>">
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label><fmt:message key="dateOfBorderCrossing" bundle="${resourceBundle}"/></label>
                                                            <div class="px-1" style="margin-top: -2px">
                                                                <button type="button" class="btn btn-outline-primary btn-sm day30">30 <fmt:message key="day" bundle="${resourceBundle}"/></button>
                                                                <button type="button" class="btn btn-outline-primary btn-sm day90">90 <fmt:message key="day" bundle="${resourceBundle}"/></button>
                                                                <button type="button" class="btn btn-outline-primary btn-sm day180">180 <fmt:message key="day" bundle="${resourceBundle}"/></button>
                                                            </div>
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
        <!-- Modal -->
        <div class="col-12">
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
<%--    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/ColReorderWithResize.js"></script>--%>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/jquery.dataTables.colResize.js"></script>
<%--    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/jquery.mask.min.js"></script>--%>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/jquery.maskMoney.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/datetime.js"></script>
    <script type="text/javascript"
            src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/lottie.js"></script>
    <script type="text/javascript" id="plugin_column_i18" src="${pageContext.servletContext.contextPath}/resources/pages/appV2/js/plugin_column_i18_${sessionLanguage}.js"></script>
    <script>
        $('select').selectpicker();
        var sessionData = ${sessionGetterDataValue};

        setTimeout(() => {
            fisibatoreColumns();
        }, 100);
        var app_table_01 = $('#app_table_01').DataTable({
            scrollY: '70vh',
            scrollX: true,
            scrollCollapse: true,
            scrollResize: true,
            fixedHeader: {
                header: true,
                headerOffset: $('#fixed').height()
            },
            // fixedColumns: {
            //     left: 1
            // },
            searching: true,
            processing: true,
            responsive: true,
            ajax: '<%=request.getContextPath()%>/routeV2/V1/data/cost_monitoring_base/v2',
            serverSide: true,
            dom: "<'row'<'col-sm-12 col-md-6'R><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'l><'col-sm-12 col-md-3'i><'col-sm-12 col-md-7 mt-2'p>>",
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, appTableV1.all]],
            fields: [{
                name: 'g33',
                mask: '0000 00 000 0'
            }],
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
                {className: "dt-head-center", title: appTableV1.ugtk, name: 'ugtk', data: 'ugtk'},
                {className: "dt-head-center", title: appTableV1.g7A, name: 'g7A', data: 'g7A'},
                {className: "dt-head-center", title: appTableV1.g7B, name: 'g7B', data: 'g7B'},
                {className: "dt-head-center nowrap", title: appTableV1.g7C, name: 'g7C', data: 'g7C'},
                {className: "dt-head-center", title: appTableV1.g7Ag7Bg7C, name: 'g7Ag7Bg7C', data: 'g7C', render: (_, __, row) => {return row.g7A +'/'+ row.g7B +'/'+ row.g7C}},
                {className: "dt-head-center", title: appTableV1.g1A, name: 'g1A', data: 'g1A'},
                {className: "dt-head-center", title: appTableV1.g1B, name: 'g1B', data: 'g1B'},
                {className: "dt-head-center", title: appTableV1.g1Ag1B, name: 'g1Ag1B', data: 'g1B', render: (_, __, row) => {return row.g1A +' - '+ row.g1B}},
                {className: "dt-head-center", title: appTableV1.g32, name: 'g32', data: 'g32'},
                {className: "dt-head-center", title: appTableV1.g37B, name: 'g37B', data: 'g37B'},
                {className: "dt-head-center", title: appTableV1.g37C, name: 'g37C', data: 'g37C'},
                {className: "dt-head-center", title: appTableV1.g2Name, name: 'g2Name', data: 'g2Name'},
                {className: "dt-head-center", title: appTableV1.g8Code2, name: 'g8Code2', data: 'g8Code2', render: data => {return data.replace(/^(\d{3})(\d{3})(\d{3})(\d{3})(\d{2}).*/, '$1 $2 $3 $4 $5');} },
                {className: "dt-head-center", title: appTableV1.g33, name: 'g33', data: 'g33', render: data => {return data.replace(/^(\d{4})(\d{2})(\d{3})(\d{1}).*/, '$1 $2 $3 $4');}},
                {className: "dt-head-center nowrap g31Wi", searchable: false, title: appTableV1.g31Name, name: 'g31Name', width: '500px!important', data: 'g31Name', render: data => {return '<textarea rows="1" class="border-0 font-weight-normal m-0 p-0 g31Name" style="background-color: rgb(0, 0, 0, 0); overflow:visible">'+data+'</textarea>'}, orderable: false},
                {className: "dt-head-center", title: appTableV1.g15, name: 'g15', data: 'g15'},
                {className: "dt-head-center", title: appTableV1.g11, name: 'g11', data: 'g11'},
                {className: "dt-head-center", title: appTableV1.vidKontrakta, name: 'vidKontrakta', data: 'vidKontrakta'},
                {className: "dt-head-center", title: appTableV1.g34, name: 'g34', data: 'g34'},
                {className: "dt-head-center", title: appTableV1.s34, name: 's34', data: 's34'},
                {className: "dt-head-center", title: appTableV1.g25, name: 'g25', data: 'g25'},
                {className: "dt-head-center", title: appTableV1.g20A, name: 'g20A', data: 'g20A'},
                {className: "dt-head-center", title: appTableV1.g20B, name: 'g20B', data: 'g20B'},
                {className: "dt-head-center", title: appTableV1.g20Name, name: 'g20Name', data: 'g20Name'},
                {className: "dt-head-center", title: appTableV1.g20Ag20B, name: 'g20Ag20B', data: 'g20Name', render: (_, __, row) => {return row.g20A +' - '+ row.g20B}},
                {className: "dt-head-center", title: appTableV1.g22A, name: 'g22A', data: 'g22A'},
                {className: "dt-head-center", title: appTableV1.g45, name: 'g45', data: 'g45', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.g45Usd, name: 'g45Usd', data: 'g45Usd', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.g42, name: 'g42', data: 'g42', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.g42Usd, name: 'g42Usd', data: 'g42Usd', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.indxusd, name: 'indxusd', data: 'indxusd', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.indxusdLn, name: 'indxusdLn', data: 'indxusdLn'},
                {className: "dt-head-center", title: appTableV1.g45Usded, name: 'g45Usded', data: 'g45Usded'},
                {className: "dt-head-center", title: appTableV1.g45UsdedLn, name: 'g45UsdedLn', data: 'g45UsdedLn'},
                {className: "dt-head-center", title: appTableV1.g31Marka, name: 'g31Marka', data: 'g31Marka'},
                {className: "dt-head-center", title: appTableV1.g35, name: 'g35', data: 'g35', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.g38, name: 'g38', data: 'g38', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.g41, name: 'g41', data: 'g41'},
                {className: "dt-head-center", title: appTableV1.g43, name: 'g43', data: 'g43', render: data => {if (data === 1 ){return '<span class="text-primary">'+appTableV1.oblYes+'</span>'}else {return '<span class="text-danger">'+appTableV1.oblNo+'</span>'}}},
                {className: "dt-head-center", title: appTableV1.g31Amount, name: 'g31Amount', data: 'g31Amount', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.vesEd, name: 'vesEd', data: 'vesEd'},
                {className: "dt-head-center", title: appTableV1.gdvipdate, name: 'gdvipdate', data: 'gdvipdate'},
                {className: "dt-head-center", title: appTableV1.gc3Date, name: 'gc3Date', data: 'gc3Date'},
                {className: "dt-head-center", title: appTableV1.metod, name: 'metod', data: 'metod', render: data => {return data + '-' +appTableV1.methodText}},
                {className: "dt-head-center", title: appTableV1.vzaimosvyaz, name: 'vzaimosvyaz', data: 'vzaimosvyaz', render: data => {if (data === 1 ){return '<span class="text-primary">'+appTableV1.oblYes+'</span>'}else {return '<span class="text-danger">'+appTableV1.oblNo+'</span>'}}},
                {className: "dt-head-center", title: appTableV1.idn, name: 'idn', data: 'idn'},
                {className: "dt-head-center", title: appTableV1.obl, name: 'obl', data: 'obl',  render: data => {if (data === 1 ){return '<span class="text-primary">'+appTableV1.oblYes+'</span>'}else {return '<span class="text-danger">'+appTableV1.oblNo+'</span>'}}},
                {className: "dt-head-center", title: appTableV1.lgot20, name: 'lgot20', data: 'lgot20', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.lgot27, name: 'lgot27', data: 'lgot27', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.lgot29, name: 'lgot29', data: 'lgot29', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.sovstavka, name: 'sovstavka', data: 'sovstavka', render: $.fn.dataTable.render.number( ' ', ',', 3 )},
                {className: "dt-head-center", title: appTableV1.asosQiymat, name: 'asosQiymat', data: 'asosQiymat'},
                {className: "dt-head-center", title: appTableV1.ktd, name: 'ktd', data: 'ktd', render: data => {if (data === 1 ){return '<span class="text-primary">'+appTableV1.oblYes+'</span>'}else {return '<span class="text-danger">'+appTableV1.oblNo+'</span>'}}},
            ],
            // colReorder: {
            //     addFixed: false
            // },
            colReorder: true,
            colResize: true,
            order: [[1, 'asc']],
            language: {
                url: '${pageContext.servletContext.contextPath}/resources/assets/json/datatablePlugini18/plugin_i18_'+sessionData.language+'.json'
            },
        });
        $(document).ready(function () {
            app_table_01.on('order.dt search.dt', function () {
                let i = 1;
                app_table_01.cells(null, 0, {search: 'applied', order: 'applied'}).every(function (cell) {
                    this.data(i++);
                });
            }).draw();
            $('.day30').click();
        });

        $('.updateAppTableV1').on('click', function () {
            if ([undefined, null, ''].includes($('#g33').val()) && [undefined, null, ''].includes($('#g31Name').val())){
                // if ([undefined, null, ''].includes($('#g33').val()) && ![undefined, null, ''].includes($('#g31Name').val())){
                //     $.toast({
                //         position: 'top-right',
                //         heading: 'Тақиқланган амал!',
                //         text: 'Излашни амалга ошириш учун Тиф Тн коди киритилиши лозим.',
                //         icon: 'error',
                //         loader: true,        // Change it to false to disable loader
                //         loaderBg: '#9EC600'  // To change the background
                //     })
                //     return;
                // }
                // if (![undefined, null, ''].includes($('#g33').val()) && [undefined, null, ''].includes($('#g31Name').val())){
                //     $.toast({
                //         position: 'top-right',
                //         heading: 'Тақиқланган амал!',
                //         text: 'Излашни амалга ошириш учун Товар номи киритилиши лозим.',
                //         icon: 'error',
                //         loader: true,        // Change it to false to disable loader
                //         loaderBg: '#9EC600'  // To change the background
                //     })
                //     return;
                // }
                // if ([undefined, null, ''].includes($('#g33').val()) && [undefined, null, ''].includes($('#g31Name').val())){
                //     $.toast({
                //         position: 'top-right',
                //         heading: 'Тақиқланган амал!',
                //         text: 'Излашни амалга ошириш учун Тиф Тн коди ва Товар номи киритилиши лозим.',
                //         icon: 'error',
                //         loader: true,        // Change it to false to disable loader
                //         loaderBg: '#9EC600'  // To change the background
                //     })
                //     return;
                // }
                $.toast({
                    position: 'top-right',
                    heading: 'Тақиқланган амал!',
                    text: 'Излашни амалга ошириш учун Тиф Тн коди ёки Товар номи киритилиши лозим.',
                    icon: 'error',
                    loader: true,        // Change it to false to disable loader
                    loaderBg: '#9EC600'  // To change the background
                })
                return;

            }
            app_table_01
                .column('gc3Date:name').search($('input#gc3DateStart').val() + ';' + $('input#gc3DateEnd').val())
                .column('g7B:name').search($('input#g7BStart').val() + ';' + $('input#g7BEnd').val())
                .column('g33:name').search($('input#g33').val())
                .column('g31Name:name').search($('input#g31Name').val())
                .column('ugtk:name').search($('select#ugtk').val())
                .column('g37C:name').search($('select#g37C').val())
                .column('g1B:name').search($('select#g1B').val())
                .column('g7A:name').search($('select#g7A').val())
                .column('g7C:name').search($('input#g7C').val())
                .column('g37B:name').search($('select#g37B').val())
                .column('metod:name').search($('select#metod').val())
                .column('g20A:name').search($('select#g20A').val())
                .column('ktd:name').search($('select#ktd').val())
                .column('g43:name').search($('select#g43').val())
                .column('g31Marka:name').search($('input#g31Marka').val())
                .column('g8Code2:name').search($('input#g8Code2').val())
                .column('idn:name').search($('input#idn').val())
                .column('asosQiymat:name').search($('input#asosQiymat').val())
                .column('vidKontrakta:name').search($('select#vidKontrakta').val())
                .column('g11:name').search($('select#g11').val())
                .column('g15:name').search($('select#g15').val())
                .draw();
        })
        $('#toggle_fullscreen').on('click', function () {
            // if already full screen; exit
            // else go fullscreen
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
        $('.day30').on('click', function () {
            var startDate = '', endDate = '';
            $('.day30').addClass('active');
            $('.day90').removeClass('active');
            $('.day180').removeClass('active');
            var todayDate = new Date();
            var startDate = new Date (todayDate.setMonth(todayDate.getMonth() - 1));
            var endDate = new Date();
            $('.gc3DateStart').val(startDate.toISOString().slice(0, 10));
            $('.gc3DateEnd').val(endDate.toISOString().slice(0, 10));
            $.toast({
                position: 'top-right',
                heading: 'Тахрирланди!',
                text: 'Чегарани кесиб ўтиш санаси 30 кун этиб белгиланди.',
                icon: 'info',
                loader: true,        // Change it to false to disable loader
                loaderBg: '#9EC600'  // To change the background
            })
        });
        $('.day90').on('click', function () {
            var startDate = '', endDate = '';
            $('.day30').removeClass('active');
            $('.day90').addClass('active');
            $('.day180').removeClass('active');
            var todayDate = new Date();
            var startDate = new Date (todayDate.setMonth(todayDate.getMonth() - 3));
            var endDate = new Date();
            $('.gc3DateStart').val(startDate.toISOString().slice(0, 10));
            $('.gc3DateEnd').val(endDate.toISOString().slice(0, 10));
            $.toast({
                position: 'top-right',
                heading: 'Тахрирланди!',
                text: 'Чегарани кесиб ўтиш санаси 90 кун этиб белгиланди.',
                icon: 'info',
                loader: true,        // Change it to false to disable loader
                loaderBg: '#9EC600'  // To change the background
            })
        });
        $('.day180').on('click', function () {
            var startDate = '', endDate = '';
            $('.day30').removeClass('active');
            $('.day90').removeClass('active');
            $('.day180').addClass('active');
            var todayDate = new Date();
            var startDate = new Date (todayDate.setMonth(todayDate.getMonth() - 6));
            var endDate = new Date();
            $('.gc3DateStart').val(startDate.toISOString().slice(0, 10));
            $('.gc3DateEnd').val(endDate.toISOString().slice(0, 10));
            $.toast({
                position: 'top-right',
                heading: 'Тахрирланди!',
                text: 'Чегарани кесиб ўтиш санаси 180 кун этиб белгиланди.',
                icon: 'info',
                loader: true,        // Change it to false to disable loader
                loaderBg: '#9EC600'  // To change the background
            })
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
        function fisibatoreColumns(){
            var columnListAll = ${columns}
            var columnList = JSON.parse(JSON.stringify(columnListAll.activeSetting));

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