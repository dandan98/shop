<%--
  Created by IntelliJ IDEA.
  User: 小贝
  Date: 2017/12/11
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/reference/js/jquery-3.2.1.min.js"></script>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/reference/js/ajaxlogin.js"></script>


    <link href="${pageContext.request.contextPath}/reference/css/login.css" type="text/css" rel="stylesheet" />
</head>
<body style="background:url(${pageContext.request.contextPath}/reference/images/22.jpg) center center no-repeat;" >
<div class="login-page" style="display:block;top: 50%;left: 77%;">
    <div class="bd" id="box">
        <div class="header" id="titl" align="center">用户登录</div>
        <div class="midd">
            <form id="login-form">
                <table>
                    <table class="inputbox"
                           style="border-collapse:collapse;background:#fff;">
                        <tr>
                            <td><div class="u-logo" id="u-id" style="background-image:url('${pageContext.request.contextPath}/reference/images/u1.png')"></div></td>
                            <td><input name="username" tabindex="2" class="input"
                                       id="usern" spellcheck="false" type="text" placeholder="账户"
                                       autocomplete="off" /></td>
                        </tr>
                    </table>
                </table>

                <div class="blank"></div>

                <table>
                    <table class="inputbox"
                           style="border-collapse:collapse;background:#fff;">
                        <tr>
                            <td><div class="u-logo" id="pass"
                                     style="background-image:url('${pageContext.request.contextPath}/reference/images/u2.png')"></div></td>
                            <td><input name="password" tabindex="2" class="input"
                                       id="passw" spellcheck="false" type="password"
                                       placeholder="输入密码" autocomplete="off" /></td>
                        </tr>
                    </table>
                </table>
                <p id="warnmsg" style="z-index:99999999;display:none;font-size: 12px;color: red;margin-top:20px;margin-left:20px;">账号或密码错误！</p>

            </form>

            <div class="loginbox">
                <a tabindex="8" type="button" class="loginbtn" id="dologin"
                    >登录</a>
            </div>

            <div class="unlogin" id="ul">
                <a class="regbtn" href="" target="_blank">忘记密码</a> <a tabindex="10"
                                                                      class="regbtn" id="changepage" href="http://localhost:8080/turn/registerPage" target="_blank"
                                                                      data-action="none" style="float:right;">去注册</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
