<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Божхона қиймати</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content=""/>
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded"/>
    <link rel="icon" href="${pageContext.servletContext.contextPath}/resources/assets/images/gtk.png" type="image/x-icon">

    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/css/style.css">
</head>
<body>
<div class="auth-wrapper">
    <div class="auth-content">
        <div class="card">
            <div class="row align-items-center text-center">
                <div class="col-md-12">
                    <div class="card-body">
                        <img src="${pageContext.servletContext.contextPath}/resources/assets/images/cyb.gif" alt=""
                             class="img-fluid mb-4" style="width: 280px; margin-bottom: 50px!important;">
                        <form:form modelAttribute="auth-signin" method="post"
                                   cssClass="win3PartInfPartF needs-validation form-horizontal login-form"
                                   action="${pageContext.request.contextPath}/user/auth/auth-signin"
                                   id="signin" name="signin" novalidate="true">
                            <div class="form-group relative">
                                <form:input id="login_username" path="username" cssClass="form-control input-lg"
                                            type="text" placeholder="Логин"/>
                                <i class="fa fa-user"></i>
                            </div>
                            <div class="form-group relative password">
                                <form:input id="login_password" path="password" cssClass="form-control input-lg"
                                            type="password" placeholder="Парол"/>
                                <i class="fa fa-lock"></i>
                            </div>

                            <div class="form-group" style="margin-top: 50px!important;">
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Кириш</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.servletContext.contextPath}/resources/js/vendor-all.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/ripple.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/pcoded.min.js"></script>
<script>
    function signUp() {
        signin.action = "..${pageContext.request.contextPath}/user/auth/authIn";
        signin.target = '_self';
        signin.submit();
    }

    function signIn() {
        let username = $('input#username').val();
        let password = $('input#password').val();
        var dataS = {}
        var tipform = "<%=request.getContextPath()%>/user/auth/auth-signin/" + username + "/" + password;
        $.ajax({
            type: "POST",
            url: tipform,
            data: dataS,
            dataType: "json",
            success: function (res) {
            },
            error: function (res) {
                alert('ERROR! \n ' + res.statusText);
            }
        });
    }
</script>

</body>

</html>
