<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="locale.jsp" %>

<html lang="${sessionDataValue.language.substring(0, 2)}">
    <head>
        <title><fmt:message key="systemName" bundle="${resourceBundle}"/></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="description" content=""/>
        <meta name="keywords" content="">
        <meta name="author" content="Phoenixcoded"/>
        <!-- Favicon icon -->
        <link rel="icon" href="${pageContext.servletContext.contextPath}/resources/assets/images/gtk.png" type="image/x-icon">
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/css/plugins/prism-coy.css">
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/dist/css/bootstrap-select.css">
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/css/flags/flag-icons.min.css"/>
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/flatpicker/flatpicker.min.css">
<%--        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/flatpicker/flatpickerBlue.css">--%>
    </head>
    <body>
        <div class="loader-bg">
            <div class="loader-track">
                <div class="loader-fill"></div>
            </div>
        </div>
        <nav class="pcoded-navbar theme-horizontal menu-light brand-blue fh-fixedHeader">
            <div class="navbar-wrapper container-fluid">
                <div class="navbar-content sidenav-horizontal" id="layout-sidenav">
                    <ul class="nav pcoded-inner-navbar sidenav-inner">

                        <li class="nav-item pcoded-hasmenu">
                            <a href="#!" class="nav-link "><span class="pcoded-micon"><i
                                    class="feather icon-home text-dark"></i></span><span
                                    class="pcoded-mtext"><fmt:message key="mainPage" bundle="${resourceBundle}"/></span></a>

                        </li>
                        <li class="nav-item pcoded-hasmenu">
                            <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #6fb6d5"><i
                                    class="fas fa-copy "></i></span><span class="pcoded-mtext"><fmt:message key="accPayable" bundle="${resourceBundle}"/></span></a>

                        </li>
                        <li class="nav-item pcoded-hasmenu">
                            <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #36d038"><i
                                    class="fas fa-file-signature"></i></span><span
                                    class="pcoded-mtext"><fmt:message key="inDecision" bundle="${resourceBundle}"/></span><span class="pcoded-badge badge badge-success">100+</span></a>

                        </li>
                        <li class="nav-item pcoded-hasmenu">
                            <a href="javascript:appFuncV2()" class="nav-link "><span class="pcoded-micon"
                                                                                     style="color: #4fee51"><i
                                    class="fas fa-list"></i></span><span class="pcoded-mtext"><fmt:message key="valMon" bundle="${resourceBundle}"/></span></a>

                        </li>
                        <li class="nav-item pcoded-hasmenu">
                            <a href="#!" class="nav-link"><span class="pcoded-micon" style="color: #bed52a"><i
                                    class="fas fa-cog"></i></span><span class="pcoded-mtext"><fmt:message key="logControl" bundle="${resourceBundle}"/></span></a>

                        </li>

                        <li class="nav-item pcoded-hasmenu">
                            <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #2574c5"><i
                                    class="fas fa-globe"></i></span><span class="pcoded-mtext"><fmt:message key="inSurvey" bundle="${resourceBundle}"/></span></a>

                        </li>
                        <li class="nav-item pcoded-hasmenu">
                            <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #36d038"><i
                                    class="fas fa-sliders-h"></i></span><span class="pcoded-mtext"><fmt:message key="conCusValue" bundle="${resourceBundle}"/></span></a>

                        </li>


                        <li class="nav-item pcoded-hasmenu">
                            <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #b9bbba"><i
                                    class="fas fa-copy"></i></span><span
                                    class="pcoded-mtext"><fmt:message key="desCusValue" bundle="${resourceBundle}"/></span></a>

                        </li>
                        <li class="nav-item pcoded-hasmenu">
                            <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #e58423"><i
                                    class="fas fa-calculator"></i></span><span class="pcoded-mtext"><fmt:message key="indPrices" bundle="${resourceBundle}"/></span></a>

                        </li>
                        <li class="nav-item pcoded-hasmenu">
                            <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #15d5da"><i
                                    class="fas fa-history"></i></span><span class="pcoded-mtext">БЮД тарихи</span></a>

                        </li>
                        <li class="nav-item pcoded-hasmenu">
                            <a href="#!" class="nav-link "><span class="pcoded-micon" style="color: #1c4dcb"><i
                                    class="fas fa-list-ul"></i></span><span class="pcoded-mtext">Божхона қийматини ҳавола қилиш тарихи</span></a>

                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <header class="navbar pcoded-header navbar-expand-lg navbar-light header-blue">
            <div class="container-fluid">
                <div class="m-header mr-1">
                    <a class="mobile-menu" id="mobile-collapse" href="#!"><span></span></a>
                    <a href="#!" class="b-brand">
                        <!-- ========   change your logo hear   ============ -->
                        <img src="${pageContext.servletContext.contextPath}/resources/assets/images/gtk.png" style="margin-left: 80px; margin-right: -25px; width: 35px"
                             alt="" class="logo">
                        <span class=" b-title f-16 text-nowrap" style="width: 260px;">
                            <svg   width="100%" height="50%">
                             <text x="50%" y="50%" dy=".35em" dx=".6em" text-anchor="middle" id="loop">
                             <fmt:message key="systemName" bundle="${resourceBundle}"/>
                              </text>
                          </svg>
                        </span>
                    </a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                                            <span class="d-inline-block m-b-0 text-white f-14">${sessionDataValue.userRoleName} :
                                                <span style="border-bottom: 1px solid #dee2e6 !important;">${sessionDataValue.userName}</span></span>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <li style="line-height: 1.2">
                            <div class="time" style="padding-top: 5px">
                                <span class="date"></span>
                                <p class="hms"></p>



                            </div>
                        </li>
                        <li class="mr-5">
                            <div class="row ml-4">
                                <div class="col-sm-1 col-md-1 col-lg-2 col-xl-2 user_online">
                                    <i class="fas fa-users f-20"></i>
                                </div>
                                <div class="col-sm-10 col-md-10 col-lg-10 col-xl-10 user_type">
                                    <fmt:message key="registeredUsers" bundle="${resourceBundle}"/>: ${activeCount.count} та
                                    <br>
                                    <fmt:message key="usersOnline" bundle="${resourceBundle}"/>: ${activeCount.activ} та
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="dropdown drp-user">

                                <c:if test="${sessionDataValue.language == 'uz_UZ'}">
                                    <a href="#" class="nav-link dropdown-toggle dropdown-toggle-nocaret has-ripple"
                                       data-toggle="dropdown" title="Тил" style="color:#fff; font-size: 20px; width: 80px">
                                        <img src="${pageContext.servletContext.contextPath}/resources/assets/images/uz.svg"
                                             width="20px" style="border-radius: 50%" alt="">
                                        <span style="font-weight: bold; font-size: 14px;">&nbsp;&nbsp;Ўзб&nbsp;&nbsp;</span>
                                        <span class="ripple ripple-animate"
                                              style="height: 52px; width: 52px; animation-duration: 0.7s; animation-timing-function: linear; background: rgb(26, 83, 240); opacity: 0.4; top: 3px; left: -11.9844px;"></span>
                                    </a>
                                </c:if>
                                <c:if test="${sessionDataValue.language == 'oz_OZ'}">
                                    <a href="#" class="nav-link dropdown-toggle dropdown-toggle-nocaret has-ripple"
                                       data-toggle="dropdown" title="Тил" style="color:#fff; font-size: 20px; width: 80px">
                                        <img src="${pageContext.servletContext.contextPath}/resources/assets/images/uz.svg"
                                             width="20px" style="border-radius: 50%" alt="">
                                        <span style="font-weight: bold; font-size: 14px;">&nbsp;&nbsp;O'zb&nbsp;&nbsp;</span>
                                        <span class="ripple ripple-animate"
                                              style="height: 52px; width: 52px; animation-duration: 0.7s; animation-timing-function: linear; background: rgb(26, 83, 240); opacity: 0.4; top: 3px; left: -11.9844px;"></span>
                                    </a>
                                </c:if>
                                <c:if test="${sessionDataValue.language == 'ru_RU'}">
                                    <a href="#" class="nav-link dropdown-toggle dropdown-toggle-nocaret has-ripple"
                                       data-toggle="dropdown" title="Тил" style="color:#fff; font-size: 20px; width: 80px">
                                        <img src="${pageContext.servletContext.contextPath}/resources/assets/images/ru.svg"
                                             width="20px" style="border-radius: 50%" alt="">
                                        <span style="font-weight: bold; font-size: 14px;">&nbsp;&nbsp;Рус&nbsp;&nbsp;</span>
                                        <span class="ripple ripple-animate"
                                              style="height: 52px; width: 52px; animation-duration: 0.7s; animation-timing-function: linear; background: rgb(26, 83, 240); opacity: 0.4; top: 3px; left: -11.9844px;"></span>
                                    </a>
                                </c:if>
                                <c:if test="${sessionDataValue.language == 'en_EN'}">
                                    <a href="#" class="nav-link dropdown-toggle dropdown-toggle-nocaret has-ripple"
                                       data-toggle="dropdown" title="Тил" style="color:#fff; font-size: 20px; width: 80px">
                                        <img src="${pageContext.servletContext.contextPath}/resources/assets/images/gb.svg"
                                             width="20px" style="border-radius: 50%" alt="">
                                        <span style="font-weight: bold; font-size: 14px;">&nbsp;&nbsp;Eng&nbsp;&nbsp;</span>
                                        <span class="ripple ripple-animate"
                                              style="height: 52px; width: 52px; animation-duration: 0.7s; animation-timing-function: linear; background: rgb(26, 83, 240); opacity: 0.4; top: 3px; left: -11.9844px;"></span>
                                    </a>
                                </c:if>


                                <div class="dropdown-menu dropdown-menu-right profile-notification p-2 f-16"
                                     style="min-width: 150px;">
                                    <a class="dropdown-item" href="" onclick="langF('uz_UZ')" style="padding: 10px"><img
                                            src="${pageContext.servletContext.contextPath}/resources/assets/images/uz.svg"
                                            class="mr-2" width="20px" alt=""><span>Ўзбекча</span></a>
                                    <a class="dropdown-item" href="" onclick="langF('oz_OZ')" style="padding: 10px"><img
                                            src="${pageContext.servletContext.contextPath}/resources/assets/images/uz.svg"
                                            class="mr-2" width="20px" alt=""><span>O'zbekcha</span></a>
                                    <a class="dropdown-item" href="" onclick="langF('ru_RU')" style="padding: 10px"><img
                                            src="${pageContext.servletContext.contextPath}/resources/assets/images/ru.svg"
                                            class="mr-2" width="20px" alt=""><span>Русский</span></a>
                                    <a class="dropdown-item" href="" onclick="langF('en_EN')" style="padding: 10px"><img
                                            src="${pageContext.servletContext.contextPath}/resources/assets/images/gb.svg"
                                            class="mr-2" width="20px" alt=""><span>English</span></a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="dropdown drp-user">
                                <a href="#" class="dropdown-toggle f-20" data-toggle="dropdown">
                                    <img src="${pageContext.servletContext.contextPath}/resources/assets/images/ava.svg" alt=""
                                         width="30px">
                                </a>
                                <div class="dropdown-menu dropdown-menu-right profile-notification">
                                    <div class="pro-head">
                                        <img src="${pageContext.servletContext.contextPath}/resources/assets/images/gtk.png"
                                             class="img-radius" alt="User-Profile-Image">
                                        <span>${sessionDataValue.userRoleName}</span><br><span>${sessionDataValue.userName}</span>
                                        <a href="${pageContext.request.contextPath}/exit.do" class="dud-logout" title="Logout">
                                            <i class="feather icon-log-out"></i>
                                        </a>
                                    </div>
                                    <ul class="pro-body">
                                        <c:forEach var="roleList" items="${sessionDataValue.roles}">
                                            <c:if test="${roleList.code == sessionDataValue.userRole}">
                                                <li class="active"><a href="#" class="dropdown-item"><img
                                                        src="${pageContext.servletContext.contextPath}/resources/assets/images/ava.svg"
                                                        alt="" class="mr-1" width="15px"></i>${roleList.name}</a></li>
                                            </c:if>
                                            <c:if test="${roleList.code != sessionDataValue.userRole}">
                                                <li class=""><a href="javascript:checkRole('${roleList.code}')"
                                                                class="dropdown-item"><img
                                                        src="${pageContext.servletContext.contextPath}/resources/assets/images/ava.svg"
                                                        alt="" class="mr-1" width="15px"></i>${roleList.name}</a></li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="pcoded-main-container">
            <div class="pcoded-wrapper container-fluid">
                <div class="pcoded-content">
                    <div class="pcoded-inner-content">
                        <div class="main-body" id="main-body">
                            <!--put here page -->
                            <div class="" style="background-position: center;
                                    margin-top: -10%;
                                    height: 863px;
                                    width: 100%;
                                    background-attachment: fixed;
                                    background-repeat: no-repeat;
                                    background-size: cover;
                                    position: relative;
                                    background-image: url('${pageContext.servletContext.contextPath}/resources/assets/images/background/fon2.svg')"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Required Js -->
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/jquery3-5-1.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/popper.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/vendor-all.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/bootstrap.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/ripple.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/pcoded.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/menu-setting.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/pages/data-api-custom.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/prism.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/plugins/moment.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/horizontal-menu.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/dist/js/bootstrap-select.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/dist/js/i18n/defaults-${sessionDataValue.language}.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/flatpicker/flatpicker.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/flatpicker/flatpickerI18/${sessionDataValue.language}.js"></script>
        <script>
            (function () {
                if ($('#layout-sidenav').hasClass('sidenav-horizontal') || window.layoutHelpers.isSmallScreen()) {
                    return;
                }
                try {
                    window.layoutHelpers._getSetting("Rtl")
                    window.layoutHelpers.setCollapsed(
                        localStorage.getItem('layoutCollapsed') === 'true',
                        false
                    );
                } catch (e) {
                }
            })();
            $(function () {
                $('#layout-sidenav').each(function () {
                    new SideNav(this, {
                        orientation: $(this).hasClass('sidenav-horizontal') ? 'horizontal' : 'vertical'
                    });
                });
                $('body').on('click', '.layout-sidenav-toggle', function (e) {
                    e.preventDefault();
                    window.layoutHelpers.toggleCollapsed();
                    if (!window.layoutHelpers.isSmallScreen()) {
                        try {
                            localStorage.setItem('layoutCollapsed', String(window.layoutHelpers.isCollapsed()));
                        } catch (e) {
                        }
                    }
                });
            });
            $(document).ready(function () {
                $("#pcoded").pcodedmenu({
                    themelayout: 'horizontal',
                    MenuTrigger: 'hover',
                    SubMenuTrigger: 'hover',
                });
            });

            function appFuncV2() {
                $.ajax({
                    type: "GET",
                    url: "${pageContext.servletContext.contextPath}/routeV2/V1/data/cost_monitoring_base/v1",
                    beforeSend: function () {
                    },
                    accept: function () {
                    },
                    success: function (response) {
                        $("#main-body").html(response);
                    },
                    error: function () {

                    }
                });
            }

            // $(document).ready(function () {
            //     indexUserSession();
            // });

            function indexUserSession() {
                setTimeout(() => {
                    $.get({
                        url: "..${pageContext.request.contextPath}/index/index-user-session",
                        dataType: "html",
                        header: 'Content-type: text/html; charset=utf-8',
                        success: function (res) {
                            document.body.style.cursor = 'default';
                            window.location.reload();
                        },
                        error: function (res) {
                            $(".loading2").addClass("d-none");
                            if (res.status == 401) {
                                $(".logOutForm").submit();
                            }
                            document.body.style.cursor = 'default';
                        }
                    });
                }, 300)
            }

            function checkRole(roleCode) {
                var dataS = {"role": roleCode};
                $.post({
                    url: "${pageContext.servletContext.contextPath}/checkRole/checkRole",
                    async: false,
                    data: dataS,
                    beforeSend: function () {
                    },
                    complete: function () {
                    },
                    success: function (res) {
                        window.location.reload();
                        $('#roleName').html(res.roleName);
                        $('#fullName').html(res.fullName);
                    },
                    error: function (res) {
                        if (res.status == 401) {
                            $(".logOutForm").submit();
                        }
                        $('#preloader').addClass('visually-hidden');
                    }
                });
            }

            function langF(langCode) {
                var params = {"langCode": langCode};
                $.post({
                    url: "${pageContext.servletContext.contextPath}/check_language_type/i18/v1",
                    async: false,
                    data: params,
                    beforeSend: function () {
                    },
                    complete: function () {
                    },
                    success: function (res) {
                        window.location.reload();
                    },
                    error: function (res) {
                        if (res.status == 401) {
                            $(".logOutForm").submit();
                        }
                        $('#preloader').addClass('visually-hidden');
                    }
                });
            }

        </script>
        <script src="${pageContext.servletContext.contextPath}/resources/assets/js/analytics.js"></script>

        <script>
            function updateTime() {
                var dateInfo = new Date();

                /* time */
                var hr,
                    _min =
                        dateInfo.getMinutes() < 10
                            ? "0" + dateInfo.getMinutes()
                            : dateInfo.getMinutes(),
                    sec =
                        dateInfo.getSeconds() < 10
                            ? "0" + dateInfo.getSeconds()
                            : dateInfo.getSeconds(),
                    ampm = dateInfo.getHours() >= 24 ;

                // replace 0 with 12 at midnight, subtract 12 from hour if 13–23
                if (dateInfo.getHours() == 0) {
                    hr = 24;
                } else if (dateInfo.getHours() > 24) {
                    hr = dateInfo.getHours() - 24;
                } else {
                    hr = dateInfo.getHours();
                }

                var currentTime = hr + ":" + _min + ":" + sec;

                // print time
                document.getElementsByClassName("hms")[0].innerHTML = currentTime;


                /* date */
                var dow = [
                        "<fmt:message key="dateYak" bundle="${resourceBundle}"/>",
                        "<fmt:message key="dateDu" bundle="${resourceBundle}"/>",
                        "<fmt:message key="dateSe" bundle="${resourceBundle}"/>",
                        "<fmt:message key="dateChor" bundle="${resourceBundle}"/>",
                        "<fmt:message key="datePay" bundle="${resourceBundle}"/>",
                        "<fmt:message key="dateJuma" bundle="${resourceBundle}"/>",
                        "<fmt:message key="dateShan" bundle="${resourceBundle}"/>"



                    ],
                    month = [
                        "01",
                        "02",
                        "03",
                        "04",
                        "05",
                        "06",
                        "07",
                        "08",
                        "09",
                        "10",
                        "11",
                        "12"
                    ],
                    day = dateInfo.getDate();

                // store date
                var currentDate =
                    day + "." + month[dateInfo.getMonth()] + ".2023" + " " + dow[dateInfo.getDay()] ;

                document.getElementsByClassName("date")[0].innerHTML = currentDate;
            }

            // print time and date once, then update them every second
            updateTime();
            setInterval(function () {
                updateTime();
            }, 1000);

        </script>
    </body>
</html>