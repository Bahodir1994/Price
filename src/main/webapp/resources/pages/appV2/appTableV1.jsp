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
                                <label for="tif" class="f-w-600" style=" margin-right: 5px;">ТИФ ТН код </label>
                                <input type="text" id="tif" class="form-control form-control-sm w-100 "
                                       placeholder="8703 80 000 0">
                            </div>
                            <div class="col-1 mx-2  p-0 text-center">
                                <label for="tovar" class="f-w-600" style=" margin-right: 5px;">Товар номи </label>
                                <input type="text" id="tovar" class="form-control form-control-sm w-100 "
                                       placeholder="BYD">
                            </div>
                            <div class="col-2 mr-2  p-0 text-center">
                                <label for="country" class="f-w-600" style=" margin-right: 5px;">Юк жўнатувчи
                                    мамлакат </label>
                                <select class="selectpicker form-control show-menu-arrow"
                                        data-style="form-control form-control-sm" id="country" multiple
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
                                        <span class="ripple ripple-animate"
                                              style="height: 20px; width: 20px; animation-duration: 0.689655s; animation-timing-function: linear; background: rgb(136, 136, 136); opacity: 0.4; top: -4.375px; left: 0px;"></span>
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
                                                        <label for="inputState1">ХББ</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="inputState1" multiple
                                                                data-selected-text-format="count > 3"
                                                                data-actions-box="true" data-live-search="true">
                                                            <option data-icon="fi fi-af" class="option-class"
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
                                                        <label for="inputState2">Олиб ўтиш хусусияти</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="inputState2" multiple
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
                                                        <label for="inputState3">Қўшимча ўлчов бирлиги</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="inputState3" multiple
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
                                                        <label for="inputState4">Божхона режими</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="inputState4" multiple
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
                                                        <label for="inputState5">Етказиб шарти</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="inputState5" multiple
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
                                                        <label for="inputState11">Божхона пости</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="inputState11" multiple
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
                                                        <label for="inputState12">Шартнома тури</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="inputState12" multiple
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
                                                        <label for="inputState13">Метод</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="inputState13" multiple
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
                                                        <label for="inputState14">Аввалги режим</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="inputState14" multiple
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
                                                        <label for="inputState15">Товар маркаси</label>
                                                        <input type="text" class="form-control form-control-sm px-1"
                                                               id="inputState15" placeholder="Товар маркаси">
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState20">Тузатиш киритилган</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="inputState20" multiple
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
                                                        <label for="inputState21">БЮД рақами</label>
                                                        <input type="text" class="form-control form-control-sm px-1"
                                                               id="inputState21" placeholder="пост/сана/рақам">
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState22">Имортер СТИР/ЖШШИР</label>
                                                        <input type="text" class="form-control form-control-sm px-1"
                                                               id="inputState22" placeholder="СТИР/ЖШШИР">
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState23">Ўз еҳтиёжи/тижорат</label>
                                                        <select class="selectpicker form-control show-menu-arrow"
                                                                data-style="form-control form-control-sm"
                                                                id="inputState23" multiple
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
                                                        <label for="inputState24">Шартнома ИДН рақами</label>
                                                        <input type="text" class="form-control form-control-sm px-1"
                                                               id="inputState24" placeholder="Шартнома ИДН рақами">
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="inputState25">Божхона қиймати асоси</label>
                                                        <input type="text" class="form-control form-control-sm px-1"
                                                               id="inputState25" placeholder="Божхона қиймати асоси">
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
                    <div class="modal-header">
                        <h4 class="modal-title ml-auto" id="exampleModalLongTitle">Ҳисобот</h4>
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
                <table id="app_table_01" class="table row-border order-column nowrap table-bordered"
                       style="width: 100%">
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
        src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/lottie.js"></script>
<script>

    $('select').selectpicker();
    var table = $('#app_table_01').DataTable({
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
        dom: "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>> <'row'<'col-sm-12'tr>> <'row'<'col-sm-12 col-md-1'l><'col-sm-12 col-md-4'i><'col-sm-12 col-md-7'p>>",
        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "барча"]],
        columns: [
            {
                // title: '№',
                data: null,
                sortable: false,
                searchable: false,
                orderable: false,
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1
                }
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