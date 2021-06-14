<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/6/10
  Time: 0:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<%--<form action="${pageContext.request.contextPath}/edit" method="post">--%>
<%--    <input type="hidden" name="uid" value="${user.uid}"/>--%>
<%--    账号：<input type="text" name="uname" value="${user.uname}"/>--%>
<%--    性别：<input type="text" name="usex" value="${user.usex}"/>--%>
<%--    <input type="submit" value="提交"/>--%>
<%--</form>--%>


<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改用户</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/edit" method="post">
        <div class="form-group">
            <label>uid：</label>
            <input type="text" type="hidden" class="form-control" name="uid" value="${user.uid}"><br><br><br>
        </div>
        <div class="form-group">
            <label>用户名：</label>
            <input type="text" class="form-control" name="uname" required value="${user.uname}"><br><br><br>
        </div>
        <div class="form-group">
            <label>性&nbsp;别：</label>
            <input type="text" class="form-control" name="usex" required value="${user.usex}"><br><br><br>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary btn-lg btn-block" value="提交">
        </div>

    </form>
</div>

</body>
</html>
