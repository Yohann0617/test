<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部读者</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="img/u1.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>
<c:if test="${!empty info}">
    <script>alert("${info}");window.location.href="allreaders.html"</script>
</c:if>

<div style="position: relative;top: 15%">
<c:if test="${!empty succ}">
    <div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${succ}
    </div>
</c:if>
<c:if test="${!empty error}">
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
            ${error}
    </div>
</c:if>
</div>


<div class="panel panel-default" style="position:relative;top: 200px;width: 90%;margin-left: 5%" align="center">
    <div class="panel-heading" align="center" style="background-color: #337ab7">
        <h3 class="panel-title" style="color: white">
            全部读者
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>读者号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>生日</th>
                <th>地址</th>
                <th>电话</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${readers}" var="reader">
                <tr>
                    <td>${reader.readerId}</td>
                    <td>${reader.name}</td>
                    <td>${reader.sex}</td>
                    <td>${reader.birth}</td>
                    <td>${reader.address}</td>
                    <td>${reader.phone}</td>
                    <td><a href="reader_edit.html?readerId=${reader.readerId}"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
                    <td><a href="reader_delete.html?readerId=${reader.readerId}"><button type="button" class="btn btn-danger btn-xs">删除</button></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <ul class="pagination">
            <li><a href="${pageContext.request.contextPath}/allreaders.html?page=1&size=5" aria-label="Previous" id="first">首页</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/allreaders.html?page=${pageInfo.pageNum-1}&size=5"
                   id="firstPage">上一页</a></li>


            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                <li><a href="${pageContext.request.contextPath}/allreaders.html?page=${pageNum}&size=5">${pageNum}</a>
                </li>
            </c:forEach>


            <li><a href="${pageContext.request.contextPath}/allreaders.html?page=${pageInfo.pageNum+1}&size=5"
                   id="lastPage">下一页</a></li>
            <li><a href="${pageContext.request.contextPath}/allreaders.html?page=${pageInfo.pages}&size=5"
                   aria-label="Next" id="last">尾页</a></li>
        </ul>
    </div>
</div>
<script>
    $(function () {
        //首先获取jstl中的当前页及尾页页码
        var pageIndex = "${pageInfo.pageNum}";
        var totalPage = "${pageInfo.pages}";
        if (pageIndex == 1) {//当前页为首页
            document.getElementById("firstPage").style.backgroundColor = '#d3d3d3';//设置背景色
            document.getElementById("first").style.backgroundColor = '#d3d3d3';//设置背景色
            $("#firstPage").attr("href", "javascript:false");//禁用指定id的button
            $("#first").attr("href", "javascript:false");//禁用指定id的button
        }
        if (pageIndex == totalPage) {//当前页为尾页
            document.getElementById("lastPage").style.backgroundColor = '#d3d3d3';//设置背景色
            document.getElementById("last").style.backgroundColor = '#d3d3d3';//设置背景色
            $("#lastPage").attr("href", "javascript:false");
            $("#last").attr("href", "javascript:false");
        }
    })
</script>
</body>
</html>
