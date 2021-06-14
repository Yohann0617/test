<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/6/10
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增用户</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/addUser" method="post">
<%--        <div class="form-group">--%>
<%--            <label>uid：</label>--%>
<%--            <input type="text" class="form-control" name="uid" required><br><br><br>--%>
<%--        </div>--%>
        <div class="form-group">
            <label>uname：</label>
            <input type="text" class="form-control" name="uname" required><br><br><br>
        </div>
        <div class="form-group">
            <label>usex：</label>
            <input type="text" class="form-control" name="usex" required><br><br><br>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary btn-lg btn-block" value="添加">
        </div>

    </form>
</div>

</body>
</html>
