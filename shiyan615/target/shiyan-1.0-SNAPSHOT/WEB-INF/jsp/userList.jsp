<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/6/5
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
用户信息<br>
<c:forEach items="${userList}" var="user">
    ID：${user.uid}&nbsp;&nbsp;&nbsp;&nbsp;
    NAME：${user.uname}&nbsp;&nbsp;&nbsp;&nbsp;
    SEX：${user.usex}<br>
</c:forEach>
</body>

</html>
