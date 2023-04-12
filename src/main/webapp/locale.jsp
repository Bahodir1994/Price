<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    if (pageContext.getRequest().getParameter("lang") == null) {
        if (session.getAttribute("lang") == null) {
            session.setAttribute("lang", "uz_UZ");
        }
    } else {
        session.setAttribute("lang", pageContext.getRequest().getParameter("lang").trim());
    }
    String lang = session.getAttribute("lang").toString();
    System.out.println(" lang Type => " + lang);

%>
<fmt:setLocale value="<%=lang%>" scope="page"/>
<fmt:setBundle basename="locale.i18" var="resourceBundle"/>
