<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>全部图书信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>
    <style>
        th{
            background-color: #5bc0de;
        }
    </style>
</head>
<body background="img/lizhi.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>

<div style="padding: 20px 550px 10px">
    <form method="post" action="reader_querybook_do.html" class="form-inline" id="searchform">
        <div class="input-group">
            <input type="text" placeholder="输入:图书名/作者/简介" class="form-control" id="search" name="searchWord"
                   class="form-control" value="${queryResult}">
            <span class="input-group-btn">
                <input type="submit" value="搜索" class="btn btn-default">
            </span>
        </div>
    </form>
    <script>
        $("#searchform").submit(function () {
            var val = $("#search").val();
            if (val == '') {
                alert("请输入关键字");
                return false;
            }
        })
    </script>
</div>
<div style="position: relative;top: 0%">
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
<div class="panel panel-default" style="width: 90%;margin-left: 5%" align="center">
    <div class="panel-heading" align="center" style="background-color: #337ab7">
        <h3 class="panel-title" style="color: white">
            全部图书
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>ISBN</th>
                <th>价格</th>
                <th>剩余数量</th>
                <th>借还</th>
                <th>详情</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${books}" var="book">
                <tr>
                    <td>${book.name}</td>
                    <td>${book.author}</td>
                    <td>${book.publish}</td>
                    <td>${book.isbn}</td>
                    <td>${book.price}</td>
                    <td>${book.number}</td>

                    <c:set var="flag" value="false"/>
                    <c:forEach var="lend" items="${myLendList}">
                        <c:if test="${lend eq book.bookId}">
                            <c:set var="flag" value="true"/>
                        </c:if>
                    </c:forEach>
                    <c:if test="${flag}">
                        <td><a href="returnbook.html?bookId=${book.bookId}">
                            <button type="button" class="btn btn-danger btn-xs">归还</button>
                        </a></td>
                    </c:if>
                    <c:if test="${not flag}">
                        <c:if test="${book.number>0}">
                            <td><a href="lendbook.html?bookId=${book.bookId}">
                                <button type="button" class="btn btn-primary btn-xs">借阅</button>
                            </a></td>
                        </c:if>
                        <c:if test="${book.number==0}">
                            <td>
                                <button type="button" class="btn btn-defalut btn-xs" disabled="disabled">已空</button>
                            </td>
                        </c:if>
                    </c:if>
                    <td><a href="reader_book_detail.html?bookId=${book.bookId}">
                        <button type="button" class="btn btn-success btn-xs">详情</button>
                    </a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <ul class="pagination">
            <li><a href="${pageContext.request.contextPath}/reader_books.html?page=1&size=5" aria-label="Previous" id="first">首页</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/reader_books.html?page=${pageInfo.pageNum-1}&size=5"
                   id="firstPage">上一页</a></li>


            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                <li><a href="${pageContext.request.contextPath}/reader_books.html?page=${pageNum}&size=5">${pageNum}</a>
                </li>
            </c:forEach>


            <li><a href="${pageContext.request.contextPath}/reader_books.html?page=${pageInfo.pageNum+1}&size=5"
                   id="lastPage">下一页</a></li>
            <li><a href="${pageContext.request.contextPath}/reader_books.html?page=${pageInfo.pages}&size=5"
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
