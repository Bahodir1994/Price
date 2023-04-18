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
          href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/buttons.dataTables.min.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/buttons.bootstrap4.min.css">
</head>
<body>
<div class="page-wrapper" id="container">
    <div class="page-header">
        <div class="page-block">
            <div class="row align-items-center">
                <div class="col-sm-12 my-0 py-0 px-0 " style="vertical-align: middle">
                    <div class="justify-content-center py-1 pb-2 mt-2">
                        <div class="row m-0 justify-content-center">
                            <div class="col-1 mx-2  p-0 text-center">
                                <label for="g33" class="f-w-600" style=" margin-right: 5px;">ТИФ ТН код </label>
                                <input type="text" id="g33" class="form-control form-control-sm w-100 g33"
                                       placeholder="8703 80 000 0">
                            </div>
                            <div class="col-1 mx-2  p-0 text-center">
                                <label for="g31Name" class="f-w-600" style=" margin-right: 5px;">Товар номи </label>
                                <input type="text" id="g31Name" class="form-control form-control-sm w-100 g31Name"
                                       placeholder="BYD">
                            </div>
                            <div class="col-2 mr-2  p-0 text-center">
                                <label for="g15" class="f-w-600" style=" margin-right: 5px;">Юк жўнатувчи
                                    мамлакат </label>
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
                            <div class="col-2 mr-2  p-0 text-center">
                                <label for="country_made" class="f-w-600" style=" margin-right: 5px;">Келиб чиқиш
                                    мамлакати </label>
                                <select class="selectpicker form-control show-menu-arrow"
                                        data-style="form-control form-control-sm" id="country_made" multiple
                                        data-selected-text-format="count > 3" data-actions-box="true"
                                        data-live-search="true">
                                    <c:forEach items="${country}" var="country" varStatus="i">
                                        <option data-icon="fi fi-${country.cdIdL}" class="option-class"
                                                value="${country.code}"
                                                data-subtext="${country.code}">${country.cdNm}</option>
                                    </c:forEach>
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
                            <div class="col-1 text-right m-0 p-0"><label for="maxFirstDay" class="f-w-600"
                                                                         style=" margin-right: 5px;">гача: </label>
                                <input type="date" class="form-control form-control-sm w-100 "
                                       maxlength="10" tabindex="2"
                                       name="dcodate" id="maxFirstDay" min="2020-01-01"
                                       max="2023-12-31" value="2023-04-11">
                            </div>
                            <div class="col-1 text-right ml-1 p-0 " style="margin-top: 20px">
                                <button type="button" tabindex="3"
                                        class="btn btn-sm btn-outline-primary f-w-900 w-75 updateAppTableV1"
                                        style="border-radius: 5px">
                                    <i class="feather icon-search"></i>&nbsp;Излаш
                                </button>
                            </div>
                            <div class="col-1 text-right ml-1 p-0 " style="margin-top: 20px">
                                <button type="button" tabindex="3"
                                        class="btn btn-sm btn-outline-success f-w-900 w-75 updateAppTableV2V3"
                                        style="border-radius: 5px" data-toggle="modal"
                                        data-target="#exampleModalCenter">
                                    <i class="feather icon-bar-chart"></i>&nbsp;Ҳисобот
                                </button>
                            </div>
                            <div class="col-1 text-right ml-1 p-0 " style="margin-top: 20px">
                                <button type="button" tabindex="3"
                                        class="btn btn-sm btn-outline-primary f-w-900 w-75 updateAppTableV1"
                                        style="border-radius: 5px">
                                    <i class="fas fa-wrench"></i>&nbsp;Созлама
                                </button>
                            </div>
                            <div class="card-header-right "
                                 style="position: absolute; z-index: 3; margin-top: -1.2%; margin-left: 94%">
                                <div class="btn-group card-option ">
                                    <button type="button" class="btn dropdown-toggle has-ripple" data-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                        <i class="feather icon-more-horizontal"></i>
                                        <span class="ripple ripple-animate" style="height: 20px; width: 20px; animation-duration: 0.689655s; animation-timing-function: linear; background: rgb(136, 136, 136); opacity: 0.4; top: -4.375px; left: 0px;"></span>
                                    </button>
                                    <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right" style="">
                                        <li class="dropdown-item full-card" id="toggle_fullscreen"><span style=""><i
                                                class="feather icon-maximize"></i> Кенгайтириш / Йиғиш</span>
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
                                           data-target="#faq2" aria-expanded="true" aria-controls="faq2">Қўшимча қидирув
                                            филтрлари</a>
                                    </div>
                                    <div id="faq2" class="collapse" aria-labelledby="faqhead2"
                                         data-parent="#faq">
                                        <div class="card-body text-left justify-content-center">
                                            <form>
                                                <div class="form-row">
                                                    <div class="form-group col-md-2">
                                                        <label for="ugtk">ҲББ</label>
                                                        <select class="selectpicker form-control show-menu-arrow ugtk"
                                                                data-style="form-control form-control-sm"
                                                                id="ugtk" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <c:forEach items="${location}" var="location" varStatus="i">
                                                                <option class="option-class" value="${location.code.substring(0,2)}" data-subtext="${location.code}">${location.cdNm}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="g37C">Олиб ўтиш хусусияти</label>
                                                        <select class="selectpicker form-control show-menu-arrow g37C"
                                                                data-style="form-control form-control-sm"
                                                                id="g37C" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <option data-icon="fa fa-heart" class="option-class" value="26002" data-subtext="26002">"Тошкент-товар1"
                                                                ТИФ
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="g41">Қўшимча ўлчов бирлиги</label>
                                                        <select class="selectpicker form-control show-menu-arrow g41"
                                                                data-style="form-control form-control-sm"
                                                                id="g41" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <option data-icon="fa fa-heart" class="option-class"
                                                                    value="26002" data-subtext="26002">"Тошкент-товар1"
                                                                ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="g1B">Божхона режими</label>
                                                        <select class="selectpicker form-control show-menu-arrow g1B"
                                                                data-style="form-control form-control-sm"
                                                                id="g1B" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <option data-icon="fa fa-heart" class="option-class"
                                                                    value="26002" data-subtext="26002">"Тошкент-товар1" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="g20A">Етказиб бериш шарти</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="g20A" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <option data-icon="fa fa-heart" class="option-class"
                                                                    value="26002" data-subtext="26002">"Тошкент-товар1"
                                                                ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
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
                                                        <label for="g7A">Божхона пости</label>
                                                        <select class="selectpicker form-control show-menu-arrow g7A"
                                                                data-style="form-control form-control-sm"
                                                                id="g7A" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <option data-icon="fa fa-heart" class="option-class"
                                                                    value="26002" data-subtext="26002">"Тошкент-товар1"
                                                                ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="vidKontrakta">Шартнома тури</label>
                                                        <select class="selectpicker form-control show-menu-arrow vidKontrakta"
                                                                data-style="form-control form-control-sm"
                                                                id="vidKontrakta" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <option data-icon="fa fa-heart" class="option-class"
                                                                    value="26002" data-subtext="26002">"Тошкент-товар1"
                                                                ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="metod">Метод</label>
                                                        <select class="selectpicker form-control show-menu-arrow metod"
                                                                data-style="form-control form-control-sm"
                                                                id="metod" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <option data-icon="fa fa-heart" class="option-class"
                                                                    value="26002" data-subtext="26002">"Тошкент-товар1"
                                                                ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for=" g37B">Аввалги режим</label>
                                                        <select class="selectpicker form-control show-menu-arrow g37B"
                                                                data-style="form-control form-control-sm"
                                                                id=" g37B" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <option data-icon="fa fa-heart" class="option-class"
                                                                    value="26002" data-subtext="26002">"Тошкент-товар1"
                                                                ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="g31Marka">Товар маркаси</label>
                                                        <input type="text" class="form-control form-control-sm px-1 g31Marka"
                                                               id="g31Marka" placeholder="Товар маркаси">
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="ktd">Тузатиш киритилган</label>
                                                        <select class="selectpicker form-control show-menu-arrow ktd"
                                                                data-style="form-control form-control-sm"
                                                                id="ktd" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <option data-icon="fa fa-heart" class="option-class"
                                                                    value="26002" data-subtext="26002">"Тошкент-товар1"
                                                                ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="g7C">БЮД рақами</label>
                                                        <input type="text" class="form-control form-control-sm px-1 g7C"
                                                               id="g7C" placeholder="пост/сана/рақам">
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="g8Code2">Имортер СТИР/ЖШШИР</label>
                                                        <input type="text" class="form-control form-control-sm px-1 g8Code2"
                                                               id="g8Code2" placeholder="СТИР/ЖШШИР">
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="g43">Ўз еҳтиёжи/тижорат</label>
                                                        <select class="selectpicker form-control show-menu-arrow g43"
                                                                data-style="form-control form-control-sm"
                                                                id="g43" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <option data-icon="fa fa-heart" class="option-class"
                                                                    value="26002" data-subtext="26002">"Тошкент-товар1"
                                                                ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26003"
                                                                    data-subtext="26003">"Арқбулоқ" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26004"
                                                                    data-subtext="26004">"Чуқурсой" ТИФ
                                                            </option>
                                                            <option class="option-class" value="26010"
                                                                    data-subtext="26010">"Сирғали" ТИФ божхона пости
                                                            </option>
                                                            <option class="option-class" value="26002"
                                                                    data-subtext="26002">"Тошкент-товар" ТИФ
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="idn">Шартнома ИДН рақами</label>
                                                        <input type="text" class="form-control form-control-sm px-1 idn"
                                                               id="idn" placeholder="Шартнома ИДН рақами">
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="asosQiymat">Божхона қиймати асоси</label>
                                                        <input type="text" class="form-control form-control-sm px-1 asosQiymat"
                                                               id="asosQiymat" placeholder="Божхона қиймати асоси">
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
                        <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-history text-white"></i> Қиймат мониторингидан фойдаланиш натижаларини қайд этиш ҳисоботи</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <ul class="nav nav-pills m-auto w-75 justify-content-center" id="pills-tab" role="tablist">
                            <li class="nav-item w-50 border border-primary rounded-0 text-center"
                                onclick="appFuncV2_ajax_v1()">
                                <a class="nav-link active rounded-0" id="pills-home-tab" data-toggle="pill"
                                   href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Ходимлар
                                    кесимида</a>
                            </li>
                            <li class="nav-item w-50 border border-primary rounded-0 text-center"
                                onclick="appFuncV2_ajax_v2()">
                                <a class="nav-link rounded-0" id="pills-profile-tab" data-toggle="pill"
                                   href="#pills-profile"
                                   role="tab" aria-controls="pills-profile" aria-selected="false">Товарлар кесимида</a>
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
    <div class="row">
        <div class="col-sm-12">
            <div class="mt-0 dt-responsive p-2">
                <table id="app_table_01" class="table table-striped row-border order-column nowrap table-bordered" style="width: 100%">
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
        src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/dataTables.dateTime.min.js">
</script>
<script type="text/javascript"
        src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/datetime.js"></script>
<script type="text/javascript"
        src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/lottie.js"></script>
<script type="text/javascript" id="plugin_column_i18" 
        src="${pageContext.servletContext.contextPath}/resources/pages/appV2/js/plugin_column_i18_${sessionLanguage}.js"></script>
<script>

    $('select').selectpicker();
    var sessionData = ${sessionGetterDataValue};

    /******************************************************************************************************************/
    var app_table_01 = $('#app_table_01').DataTable({
        scrollY: '70vh',
        scrollX: true,
        scrollCollapse: true,
        scrollResize: true,
        fixedHeader: {
            header: true,
            headerOffset: $('#fixed').height()
        },
        fixedColumns: {
            left: 1
        },
        searching: true,
        processing: true,
        responsive: true,
        ajax: '<%=request.getContextPath()%>/routeV2/data/cost_monitoring_base/v2',
        serverSide: true,
        dom: "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-2 mt-2'l><'col-sm-12 col-md-3'i><'col-sm-12 col-md-7 mt-2'p>>",
        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "барча"]],
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
            {title: appTableV1.ugtk, name: 'ugtk', data: 'ugtk'},
            {title: appTableV1.g7A, name: 'g7A', data: 'g7A'},
            {title: appTableV1.g7B, name: 'g7B', data: 'g7B'},
            {title: appTableV1.g7C, name: 'g7C', data: 'g7C'},
            {title: appTableV1.g1A, name: 'g1A', data: 'g1A'},
            {title: appTableV1.g1B, name: 'g1B', data: 'g1B'},
            {title: appTableV1.g32, name: 'g32', data: 'g32'},
            {title: appTableV1.g37B, name: 'g37B', data: 'g37B'},
            {title: appTableV1.g37C, name: 'g37C', data: 'g37C'},
            {title: appTableV1.g2Name, name: 'g2Name', data: 'g2Name'},
            {title: appTableV1.g8Code2, name: 'g8Code2', data: 'g8Code2'},
            {title: appTableV1.g33, name: 'g33', data: 'g33'},
            {title: appTableV1.g31Name, name: 'g31Name', data: 'g31Name'},
            {title: appTableV1.g15, name: 'g15', data: 'g15'},
            {title: appTableV1.g11, name: 'g11', data: 'g11'},
            {title: appTableV1.vidKontrakta, name: 'vidKontrakta', data: 'vidKontrakta'},
            {title: appTableV1.g34, name: 'g34', data: 'g34'},
            {title: appTableV1.s34, name: 's34', data: 's34'},
            {title: appTableV1.g25, name: 'g25', data: 'g25'},
            {title: appTableV1.g20A, name: 'g20A', data: 'g20A'},
            {title: appTableV1.g20B, name: 'g20B', data: 'g20B'},
            {title: appTableV1.g20Name, name: 'g20Name', data: 'g20Name'},
            {title: appTableV1.g22A, name: 'g22A', data: 'g22A'},
            {title: appTableV1.g45, name: 'g45', data: 'g45'},
            {title: appTableV1.g45Usd, name: 'g45Usd', data: 'g45Usd'},
            {title: appTableV1.g42, name: 'g42', data: 'g42'},
            {title: appTableV1.g42Usd, name: 'g42Usd', data: 'g42Usd'},
            {title: appTableV1.indxusd, name: 'indxusd', data: 'indxusd'},
            {title: appTableV1.indxusdLn, name: 'indxusdLn', data: 'indxusdLn'},
            {title: appTableV1.g45Usded, name: 'g45Usded', data: 'g45Usded'},
            {title: appTableV1.g45UsdedLn, name: 'g45UsdedLn', data: 'g45UsdedLn'},
            {title: appTableV1.g31Marka, name: 'g31Marka', data: 'g31Marka'},
            {title: appTableV1.g35, name: 'g35', data: 'g35'},
            {title: appTableV1.g38, name: 'g38', data: 'g38'},
            {title: appTableV1.g41, name: 'g41', data: 'g41'},
            {title: appTableV1.g43, name: 'g43', data: 'g43'},
            {title: appTableV1.g31Amount, name: 'g31Amount', data: 'g31Amount'},
            {title: appTableV1.vesEd, name: 'vesEd', data: 'vesEd'},
            {title: appTableV1.gdvipdate, name: 'gdvipdate', data: 'gdvipdate'},
            {title: appTableV1.gc3Date, name: 'gc3Date', data: 'gc3Date'},
            {title: appTableV1.metod, name: 'metod', data: 'metod'},
            {title: appTableV1.vzaimosvyaz, name: 'vzaimosvyaz', data: 'vzaimosvyaz'},
            {title: appTableV1.idn, name: 'idn', data: 'idn'},
            {title: appTableV1.obl, name: 'obl', data: 'obl'},
            {title: appTableV1.lgot20, name: 'lgot20', data: 'lgot20'},
            {title: appTableV1.lgot27, name: 'lgot27', data: 'lgot27'},
            {title: appTableV1.lgot29, name: 'lgot29', data: 'lgot29'},
            {title: appTableV1.sovstavka, name: 'sovstavka', data: 'sovstavka'},
            {title: appTableV1.asosQiymat, name: 'asosQiymat', data: 'asosQiymat'},
            {title: appTableV1.ktd, name: 'ktd', data: 'ktd'},
        ],
        colReorder: true,
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
        app_table_01.column('ugtk:name').visible(false);
    });
    /******************************************************************************************************************/

    $('.updateAppTableV1').on('click', function () {
        app_table_01
            .column('gc3Date:name').search($('input#minFirstDay').val() + ';' + $('input#maxFirstDay').val())
            .column('g33:name').search($('input#g33').val())
            .column('g31Name:name').search($('input#g31Name').val())
            .column('ugtk:name').search($('select#ugtk').val())
            .column('g37C:name').search($('select#g37C').val())
            .column('g1B:name').search($('select#g1B').val())
            .column('g7A:name').search($('select#g7A').val())
            .column('g7C:name').search($('input#g7C').val())
            .column('metod:name').search($('select#metod').val())
            .column('g37B:name').search($('select#g37B').val())
            .column('ktd:name').search($('select#ktd').val())
            .column('g43:name').search($('select#g43').val())
            .column('g31Marka:name').search($('input#g31Marka').val())
            .column('g8Code2:name').search($('input#g8Code2').val())
            .column('idn:name').search($('input#idn').val())
            .column('asosQiymat:name').search($('input#asosQiymat').val())
            .column('vidKontrakta:name').search($('select#vidKontrakta').val())
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

    /******************************************************************************************************************/
    $('.updateAppTableV2V3').on('click', function () {
        $('#pills-profile-tab').removeClass('active')
        $('#pills-home-tab').removeClass('active').addClass('active')
        $('#pills-tabContent').html('')
        let preImg = '<div class="col-12 m-auto"><lottie-player src="${pageContext.servletContext.contextPath}/resources/assets/images/jsonImage/report.json"   background="transparent"  speed="2"  style="margin-left:auto;    margin-right:auto; width: 500px; height: 500px;"  loop  autoplay></lottie-player> </div>';
        $('#pills-tabContent').html(preImg);
        setTimeout(() => {
            appFuncV2_ajax_v1();
        }, 1500);
    })
    function appFuncV2_ajax_v1() {
        $.ajax({
            type: "GET",
            url: "${pageContext.servletContext.contextPath}/routeV2/data/cost_monitoring_base/v3",
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
            url: "${pageContext.servletContext.contextPath}/routeV2/data/cost_monitoring_base/v5",
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
</script>
</body>