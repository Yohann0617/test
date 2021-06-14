<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #msg{
            color: red;
        }
        #demo{
            position: absolute;
            top: calc(50% - 150px);
            left: calc(50% - 550px);
        }
        body{
            background: url("img/电脑壁纸.JPG") no-repeat center top;
            background-attachment:fixed;
            background-size:cover;
        }
    </style>
    <!--先引入需要的jQuery 和 Bootstrap 文件以及相关插件 这里我直接引用网上的核心库 记得联网-->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery.js"></script>
</head>
<body>
<%--<form action="${pageContext.request.contextPath }/select" method="post">--%>
<%--    输入用户名：<input type="text" name="uname"/><br>--%>
<%--    <input type="submit" value="提交"/>--%>
<%--</form>--%>
<!--bs中所有的均应该包裹在其中。-->
<div class="container" id="demo">
    <!-- row是珊栏系统的包裹容器-->
    <div class="row">
        <!-- col-md-x 表示此珊栏占据几个格子，offset-x 是偏移x格子-->
        <div class="col-md-4 col-md-offset-4">
            <!-- panel分为3个部分，heading,body,footer其中heading部分的颜色来自于panel-default的颜色-->
            <div class="panel panel-default">
                <!-- panel-headeing是有颜色的，此颜色来自于panel-default-->
                <div class="panel-heading">登录信息</div>
                <div class="panel-body">
                    <form action="/login">
                        <!--
                             1. form-group设置了距离上下部分div的距离，更美观。
                             2. 对于form-group 设置了has-feedback可以使其有背景图
                        -->
                        <div class="form-group has-feedback">
                            <!-- form-control 设置了边框有弧度圆角以及其中输入字体的pading以及margin,placeholder为默认的问题-->
                            <input type="text" class="form-control" name="username" placeholder="用户名">
                            <!-- 此项如果要显示必须在form-group的class上添加has-feedback且还要添加一个span-->
                            <!-- glyphicon是添加图片，form-control-feedback是指示这个是一个样式，同时设置其在右边-->
                            <span class="glyphicon  glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" name="password" placeholder="密码">
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>

                        <div class="form-group">
                            <div class="checkbox">
                                <!-- 此处用label包裹checkbox 的原因是为了点击记住密码也能对复选框进行选择。-->
                                <label>
                                    <input type="checkbox">记住密码
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="checkbox">
                                <span id="msg">${msg}</span>
                            </div>
                        </div>
                        <!-- button的btn-block 可以占满当前珊栏而不用自适应。-->
                        <button type="submit" class="btn btn-success btn-block btn-lg">登录</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<form action="/login">--%>
<%--    <center><h1>登录</h1></center>--%>
<%--    <center>--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <td>账号：<input type="text" name="username" placeholder="请输入账号"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>密码：<input type="password" name="password" placeholder="请输入密码"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <span id="msg">${msg}</span>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <center><button type="submit" value="登录">登录</button></center>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </center>--%>
<%--</form>--%>
</body>

</html>
