<%@ page language="java" import="java.util.*, java.sql.*"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>账号中心</title>

    <link href="${pageContext.request.contextPath}/reference/css/register.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/reference/js/register.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/reference/js/jquery-3.2.1.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/reference/js/ajaxregister.js"></script>



</head>

<body background="${pageContext.request.contextPath}/reference/images/22.PNG">
<div class="hd">
    <div class="in">
        <div class="top-login">
            已有账号？去 <a id="login-btn" href="http://localhost:8080/turn/loginPage">登录</a>
        </div>
    </div>
</div>

<div class="r-bd" id="r-block">
    <div class="fselect">
        <!--<div class="select">账号注册</div>-->

        <div class="blank"></div>
        <div class="blank"></div>

        <div class="bd2">
            <form class="" id="register-form">
                <div class="finput">
                    <lable class="lable">账号:</lable>
                    <input name="email" class="input" id="username" type="text"
                           placeholder="邮箱账号" onblur="checkUsername(this)"
                           onclick="checkvalue(1,this);" onkeyup="checkvalue(1,this);"
                           title="邮箱账号/例:18729263796@163.com" /><label id="tip1"
                                                                       class="font"></label> <span id="username_span">*</span><div id="uspan" class="r" style="display:none;width: 310px;font-size: 12px;color:#d4282d;">请输入正确的邮箱账号</div>
                </div>

                <div class="finput">
                    <lable class="lable">用户名:</lable>
                    <input name="rn" class="input" id="rname" type="text"
                           placeholder="用户名" onblur="checkrname(this)"
                           onclick="checkvalue(2,this);" onkeyup="checkvalue(2,this);"
                           title="4-10位字母、数字、下划线" /><label id="tip2"
                                                           class="font"></label> <span id="rname_span">*</span><div id="rspan" class="r" style="display:none;width: 310px;font-size: 12px;color:#d4282d;">用户名由4-10位字母、数字、下划线组成</div>
                </div>

                <div class="finput">
                    <lable class="lable">密码:</lable>
                    <input name="password" class="input" id="password1"
                           type="password" placeholder="6-12位密码，区分大小写"
                           onblur="checkPassword(this)" onclick="checkvalue(3,this);"
                           onkeyup="checkvalue(3,this);" title="6-12位字母、数字、下划线。" /><label
                        id="tip3" class="font"></label> <span id="password1_span" >*</span><div id="pspan1" class="r" style="display:none;width: 310px;font-size: 12px;color:#d4282d;">密码须由6-12位字母数字下划线组成</div>
                </div>

                <div class="finput">
                    <lable class="lable">确认密码:</lable>
                    <input name="password2" class="input" id="password2"
                           type="password" placeholder="再次输入密码"
                           onblur="checkRePassword(this)" onclick="checkvalue(4,this);"
                           onkeyup="checkvalue(4,this);" title="与密码不一致" /><label id="tip4"
                                                                                 class="font"></label> <span id="password2_span">*</span><div id="pspan2" class="r" style="display:none;width: 310px;font-size: 12px;color:#d4282d;">与密码不一致</div>
                </div>

                <div class="finput">
                    <lable class="lable">手机号:</lable>
                    <input name="phone" class="input" id="tele" type="text"
                           placeholder="11位手机号" onblur="checkTele(this)"
                           onclick="checkvalue(5,this);" onkeyup="checkvalue(5,this);"
                           title="例:18729263796" /><label id="tip5" class="font"></label> <span
                        id="tele_span">*</span><div id="tspan" class="r" style="display:none;width: 310px;font-size: 12px;color:#d4282d;">请输入正确的手机号</div>
                </div>



                <div class="fregister">
                    <div class="register"><a id="reg" onclick="register()">注册</a></div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>