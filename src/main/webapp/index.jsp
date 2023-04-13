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
    <title>Title</title>
</head>
<body>
<h1>Salom olam</h1>
<h1>Salom olam2</h1>
<h1>Salom olam3</h1>
<h1>Salom olam4</h1>
<h1><fmt:message key="systemName" bundle="${resourceBundle}"/></h1>
</body>
</html>
