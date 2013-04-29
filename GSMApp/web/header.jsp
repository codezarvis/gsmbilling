<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:if test="${param['lang']!=null}">

    <fmt:setLocale value="${param['lang']}" scope="session"/>


</c:if>

<div>
  <a href="?lang=en">English</a> | <a href="?lang=te">Telugu</a>
</div>