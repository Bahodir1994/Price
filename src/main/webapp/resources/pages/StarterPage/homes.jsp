<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/locale.jsp" %>

<style>

    .clss {
        background: rgba(0, 0, 10, 0.5);
        left: 0%;
        right: -10%;
        top: 15vh;
        width: 100%;
        position: absolute;
        -webkit-transform: translateY(-50%);
        -ms-transform: translateY(-50%);
        -o-transform: translateY(-50%);
        transform: translateY(-50%);
        text-align: center;
    }
    .cpt {
        border: 4px solid rgba(255, 255, 255, 0.7);
        color: #ffffff;
        font-size: 50px;
        font-weight: 900;
        letter-spacing: 3px;
        line-height: 50px;
        text-shadow: 0 2px 5px #333333;
        border-right: none;
        border-left: none;
        width: 78%;
        text-transform: uppercase;
        text-align: center;
        position: relative;
        margin: 20% auto;
    }
    .cptSub {
        color: #ffffff;
        font-size: 24px;
        font-weight: 300;
        letter-spacing: 1px;
        line-height: 38px;
        text-align: center;
        width: 1068px;
        margin-bottom: 13%;
        margin-left: auto;
        margin-right: auto;
    }
</style>
<div class="m-0 p-0" style="background: rgba(0, 0, 1, 0.3)">
<%--    style="vertical-align: middle; text-align: center; border: 5px solid white; width: 80%; height: 60%"--%>
    <div class="clss">
        <p class="cpt" >БОЖХОНА ТЎЛОВЛАРИ</p>
        <p class="cptSub">БОЖХОНА ТЎЛОВЛАРИ</p>
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

