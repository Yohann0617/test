<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--先引入需要的jQuery 和 Bootstrap 文件以及相关插件 这里我直接引用网上的核心库 记得联网-->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery.js"></script>
    <style>
        #td_del,#td_edit{
            width: 100px;
        }
        div{
            margin:125px;
            vertical-align:middle;
            padding-top:15%;
            background-color: white;
        }
        tr,th{
            text-align: center;
        }
        body{
            background: url("img/1.jpg") no-repeat center top;
            background-attachment:fixed;
            background-size:cover;
        }
    </style>
</head>
<body>
<%--<form action="${pageContext.request.contextPath }/select" method="post">--%>
<%--    输入用户名：<input type="text" name="uname"/><br>--%>
<%--    <input type="submit" value="提交"/>--%>
<%--</form>--%>
<nav align="center">
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/toAddUser">新增用户</a>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/findAllUser.do">显示全部用户</a>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/loginOut">退出</a>
</nav>
<div  align="center">
    <table border="1" cellpadding="10" cellspacing="0" class="table-responsive" width="960px" >
        <thead>
        <tr>
            <td>编号</td>
            <td>用户名</td>
            <td>性别</td>
            <td id="td_edit">Edit</td>
            <td id="td_del">Delete</td>
        </tr>
        </thead>
        <c:forEach items="${userList}" var="u">
            <tr>
                <th>${u.uid }</th>
                <th>${u.uname }</th>
                <th>${u.usex }</th>
                <th><a class="btn btn-info" href="${pageContext.request.contextPath}/toUpdateUser/?uid=${u.uid}">Edit</a></th>
                <th><a class="btn btn-danger" href="${pageContext.request.contextPath}/del/${u.uid}" onclick="return confirm('确定要删除吗')">Delete</a></th>
            </tr>
        </c:forEach>
    </table>

    <ul class="pagination">
        <li><a href="${pageContext.request.contextPath}/findAllUser.do?page=1&size=4" aria-label="Previous">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/findAllUser.do?page=${pageInfo.pageNum-1}&size=4">上一页</a></li>


        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
            <li><a href="${pageContext.request.contextPath}/findAllUser.do?page=${pageNum}&size=4">${pageNum}</a></li>
        </c:forEach>




        <li><a href="${pageContext.request.contextPath}/findAllUser.do?page=${pageInfo.pageNum+1}&size=4">下一页</a></li>
        <li><a href="${pageContext.request.contextPath}/findAllUser.do?page=${pageInfo.pages}&size=4" aria-label="Next">尾页</a></li>
    </ul>
</div>
</body>

</html>
