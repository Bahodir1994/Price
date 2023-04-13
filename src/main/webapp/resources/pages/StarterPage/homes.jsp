<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/locale.jsp" %>

<div class="col-12">
    <div class="card" style="opacity: 0.97">
        <div class="row p-4">
            <div class=" col-lg-3 col-md-6">
                <a href="#">
                    <div class="card   nav-link">
                        <div class="card-body">
                            <div class="row align-items-center ">
                                <div class="col-8">
                                    <h4 class="text-c-yellow">5 та</h4>
                                    <h5 class=" m-b-0 text-nowrap"><fmt:message key="systemName" bundle="${resourceBundle}"/></h5>
                                </div>
                                <div class="col-4 text-right">
                                    <i class="feather icon-layers f-28"></i>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-c-yellow">
                            <div class="row align-items-center">

                                <div class="col-12 text-right">

                                    <p class="text-white m-b-0">+5</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class=" col-xl-3 col-md-6">
                <a href="tasniflash.html">
                    <div class="card   ">
                        <div class="card-body">
                            <div class="row align-items-center ">
                                <div class="col-8">
                                    <h4 class="text-c-green">32 та</h4>
                                    <h5 class=" m-b-0 text-nowrap"><fmt:message key="systemName" bundle="${resourceBundle}"/></h5>
                                </div>
                                <div class="col-4 text-right">
                                    <i class="feather icon-layers f-28"></i>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-c-green">
                            <div class="row align-items-center">

                                <div class="col-12 text-right">

                                    <p class="text-white m-b-0">+5</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class=" col-xl-3 col-md-6">
                <a href="#">
                    <div class="card   nav-link">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-8">
                                    <h4 class="text-c-red">14 та</h4>
                                    <h5 class=" m-b-0"><fmt:message key="systemName" bundle="${resourceBundle}"/></h5>
                                </div>
                                <div class="col-4 text-right">
                                    <i class="feather icon-layers f-28"></i>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-c-red">
                            <div class="row align-items-center">

                                <div class="col-12 text-right">

                                    <p class="text-white m-b-0">+5</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class=" col-xl-3 col-md-6">
                <a href="#">
                    <div class="card   nav-link">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-8">
                                    <h4 class="text-c-blue">66 та</h4>
                                    <h5 class=" m-b-0"><fmt:message key="systemName" bundle="${resourceBundle}"/></h5>
                                </div>
                                <div class="col-4 text-right">
                                    <i class="feather icon-layers f-28"></i>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-c-blue">
                            <div class="row align-items-center">

                                <div class="col-12 text-right">

                                    <p class="text-white m-b-0">+5</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-sm-12 ">
            <div class="row m-0 pb-4 justify-content-center" style="border-bottom: 1px #000 solid">
                <div
                        class="col-3 mt-2 p-0 ml-1"><span class="f-22 "><i class="feather icon-list " style="color:#0c6af3;"></i>&nbsp;
                    &nbsp;<fmt:message key="systemName" bundle="${resourceBundle}"/></span></div>
                <div class="col-1 text-right m-0 p-0"><label for="DT1" class="f-w-600" style="margin-top: 8px; margin-right: 5px;"><fmt:message key="systemName" bundle="${resourceBundle}"/>: </label>
                </div>
                <div class="col-2 text-left m-0 p-0">
                    <input type="date" class="form-control w-100" maxlength="10" tabindex="1" name="dcodate" id="DT1" min="2020-01-01" max="2023-12-31" value="2023-03-25">
                </div>
                <div class="col-1 text-right m-0 p-0"><label for="DT2" class="f-w-600" style="margin-top: 8px; margin-right: 5px;"><fmt:message key="systemName" bundle="${resourceBundle}"/>: </label></div>
                <div class="col-2 text-left m-0 p-0">
                    <input type="date" class="form-control w-100" maxlength="10" tabindex="2" name="dcodate" id="DT2" min="2020-01-01" max="2023-12-31" value="2023-04-01">
                </div>
                <div class="col-2 text-right ml-4 p-0">
                    <button type="button" tabindex="3" onclick="getAllautoDecl2(1)" class="btn btn-outline-primary f-w-900 w-75">
                        <i class="feather icon-refresh-ccw"></i>&nbsp;&nbsp;<fmt:message key="systemName" bundle="${resourceBundle}"/>
                    </button>
                </div>

            </div>
            <div class="mt-3 dt-responsive table-responsive p-4">
                <table id="footer-search" class="table table-striped table-bordered nowrap">
                    <thead class="text-center">
                    <tr>
                        <th><fmt:message key="systemName" bundle="${resourceBundle}"/>Мурожаат тартиб рақами</th>
                        <th><fmt:message key="systemName" bundle="${resourceBundle}"/>Жўнатилган вақт</th>
                        <th><fmt:message key="systemName" bundle="${resourceBundle}"/>Товарлар</th>
                        <th><fmt:message key="systemName" bundle="${resourceBundle}"/>Маъсул шахс</th>
                        <th><fmt:message key="systemName" bundle="${resourceBundle}"/>Телефон рақами</th>
                        <th><fmt:message key="systemName" bundle="${resourceBundle}"/>Мурожаат мақоми</th>
                        <th><fmt:message key="systemName" bundle="${resourceBundle}"/>Намуна</th>
                    </tr>
                    </thead>
                    <tbody class="text-center justify-content-center">
                    <tr>
                        <td class="font-weight-bold"><a href="#">SU.T.AERO.00026</a></td>
                        <td style="color: #007BFF">13.02.2022 15:13</td>
                        <td>1 товар</td>
                        <td>Кўрик гуруҳи инспектори Дусматов Д.</td>
                        <td>+998 90 152 31 85</td>
                        <td>Янги</td>
                        <td><span
                                style="background-color: #6C757D; border-radius: 5px; color: #fff; padding: 5px">Намуна</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"><a href="#">BN.T.AERO.00025</a></td>
                        <td style="color: #007BFF">11.02.2022 09:05</td>
                        <td>1 товар</td>
                        <td>Кўрик гуруҳи инспектори Ахмадов А.Р.</td>
                        <td>+998 97 715 45 89</td>
                        <td>Кўрилган</td>
                        <td><span
                                style="background-color: #6C757D; border-radius: 5px; color: #fff; padding: 5px">Намуна</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"><a href="#">BN.T.AERO.00024</a></td>
                        <td style="color: #007BFF">10.02.2022 09:05</td>
                        <td>1 товар</td>
                        <td>Кўрик гуруҳи инспектори Ахмадов А.Р.</td>
                        <td>+998 97 715 45 89</td>
                        <td>Янги</td>
                        <td><span
                                style="background-color: #6C757D; border-radius: 5px; color: #fff; padding: 5px">Намуна</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"><a href="#">SU.T.AERO.00022</a></td>
                        <td style="color: #007BFF">09.02.2022 15:13</td>
                        <td>1 товар</td>
                        <td>Кўрик гуруҳи инспектори Дусматов Д.</td>
                        <td>+998 90 152 31 85</td>
                        <td>Янги</td>
                        <td><span
                                style="background-color: #6C757D; border-radius: 5px; color: #fff; padding: 5px">Намуна</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"><a href="#">BN.T.AERO.00020</a></td>
                        <td style="color: #007BFF">19.01.2022 09:05</td>
                        <td>1 товар</td>
                        <td>Кўрик гуруҳи инспектори Ахмадов А.Р.</td>
                        <td>+998 97 715 45 89</td>
                        <td>Кўрилган</td>
                        <td><span
                                style="background-color: #6C757D; border-radius: 5px; color: #fff; padding: 5px">Намуна</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"><a href="#">BN.T.AERO.00024</a></td>
                        <td style="color: #007BFF">17.01.2022 15:05</td>
                        <td>1 товар</td>
                        <td>Кўрик гуруҳи инспектори Дусматов Д.</td>
                        <td>+998 97 715 45 89</td>
                        <td>Янги</td>
                        <td><span
                                style="background-color: #6C757D; border-radius: 5px; color: #fff; padding: 5px">Намуна</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"><a href="#">BN.T.AERO.00024</a></td>
                        <td style="color: #007BFF">10.02.2022 09:05</td>
                        <td>1 товар</td>
                        <td>Кўрик гуруҳи инспектори Ахмадов А.Р.</td>
                        <td>+998 97 715 45 89</td>
                        <td>Янги</td>
                        <td><span
                                style="background-color: #6C757D; border-radius: 5px; color: #fff; padding: 5px">Намуна</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"><a href="#">SU.T.AERO.00022</a></td>
                        <td style="color: #007BFF">09.02.2022 15:13</td>
                        <td>1 товар</td>
                        <td>Кўрик гуруҳи инспектори Дусматов Д.</td>
                        <td>+998 90 152 31 85</td>
                        <td>Янги</td>
                        <td><span
                                style="background-color: #6C757D; border-radius: 5px; color: #fff; padding: 5px">Намуна</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"><a href="#">BN.T.AERO.00020</a></td>
                        <td style="color: #007BFF">19.01.2022 09:05</td>
                        <td>1 товар</td>
                        <td>Кўрик гуруҳи инспектори Ахмадов А.Р.</td>
                        <td>+998 97 715 45 89</td>
                        <td>Кўрилган</td>
                        <td><span
                                style="background-color: #6C757D; border-radius: 5px; color: #fff; padding: 5px">Намуна</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"><a href="#">BN.T.AERO.00024</a></td>
                        <td style="color: #007BFF">17.01.2022 15:05</td>
                        <td>1 товар</td>
                        <td>Кўрик гуруҳи инспектори Дусматов Д.</td>
                        <td>+998 97 715 45 89</td>
                        <td>Янги</td>
                        <td><span
                                style="background-color: #6C757D; border-radius: 5px; color: #fff; padding: 5px">Намуна</span>
                        </td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start date</th>
                        <th>Salary</th>
                        <th>Salary</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready();

    function getChartValues(){
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/statisticController",
            success: function (response){
            }
        });
    }

    function onch(x) {
        var urli = '';
        if (x === 1) {
            urli = "<%=request.getContextPath()%>/s01imocontroller/resources/pages/imo/ImoMainUrl"
        } else if (x === 2) {
            urli = "<%=request.getContextPath()%>/s01imocontroller/resources/pages/imo/ImoMainUrl"
        } else if (x === 3) {
            urli = "<%=request.getContextPath()%>/s03recyclecontroller/resources/pages/recycle/RecycleMainUrl"
        } else if (x === 4) {
            urli = "<%=request.getContextPath()%>/s04refundcontroller/resources/pages/refund/RefundMainUrl"
        } else if (x === 5) {
            urli = "<%=request.getContextPath()%>/s05hscodecontroller/resources/pages/hsCode/HsCodeMainUrl"
        } else if (x === 6) {
            urli = "<%=request.getContextPath()%>/rule/resources/pages/Apage/mainPage"
        }else if (x === 8) {
            urli = "<%=request.getContextPath()%>/s08latepaymentcontroller/resources/pages/latePayment/LatePaymentMainUrl"
        }else if (x === 9) {
            urli = "<%=request.getContextPath()%>/s09autosealcontroller/resources/pages/autoSeal/AutoSealMainUrl"
        } else {
            urli = "<%=request.getContextPath()%>/resources/pages/StarterPage/unique";
        }
        var dataSSS = {
            "selectedBar": "yangi"
        };
        $.ajax({
            type: "GET",
            url: urli,
            data: dataSSS,
            dataType: "html",
            header: 'Content-type: text/html; charset=utf-8',
            success: function (res) {
                $('div#MainContent').html(res);
                changeNameProg(x);
            },
            error: function (res) {
                if (res.status == 401) {
                    $(".logOutForm").submit();
                }
            }
        });
    }
</script>

