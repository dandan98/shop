<%--
  Created by IntelliJ IDEA.
  User: 小贝
  Date: 2017/12/12
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath}/reference/js/jquery-3.2.1.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/reference/js/lists.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/css/swipebox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/css/import.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/css/goodsListPage.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/reference/js/jquery-3.2.1.js"></script>

    <title>商品列表页</title>


</head>
<body>
<%--
//动态生成导航栏
--%>
<script>
    $(document).ready(function () {
        console.log("zhixing");
        {
            $.ajax({
                url: "http://localhost:8080/getInfo/type",
                type: "GET",
                scriptCharset: 'utf-8 ',
                contentType: 'application/json',
                headers: {
                    "content-Type": "application/json"
                },
                error: function () {
                    alert("失败");
                },
                success: function (myData) {
                    console.log("zhixng");
                    var data = JSON.parse(myData);
                    console.log(data);
                    if (data.msg == "success") {
                        var type = JSON.parse(data.data);
                        console.log(type);
                        var baseUrl = "http://localhost:8080";
                        $.each(type, function (index, item) {
                            console.log("=======" + item.grade);
                            if (item.grade == "1") {
                                $.each(item.typeResult, function (indexx, itemm) {
                                    var url = baseUrl + "/turn/goodsListPage?typeId=" + itemm.typeId+"&name="+itemm.typeName;
                                    console.log(document.getElementById('typeID').value);
                                    if(document.getElementById('typeID').value==itemm.typeId){
                                        $('#1233').append("<li class=\"layui-nav-item layui-this\"><a href=\"" + url + "\">" + itemm.typeName + "</a></li>");

                                    }
                                    else{
                                        $('#1233').append("<li class=\"layui-nav-item\"><a href=\"" + url + "\">" + itemm.typeName + "</a></li>");

                                    }

                                })

                            }
                        });
                    }
                }
            });
        }
    })
</script>
<div class='uou-block-1a has-bg-image'>

    <div class="container">
        <div class="search">
            <a href="#" class="toggle fa fa-search">好的生活，没那么贵</a>
            <form action="http://localhost:8080/getInfo/goodsList?typeId=1">
                <input type="text" class="search-input" placeholder="Search ...">
                <input type="submit" value="">
            </form>
        </div>
        <ul class="authentication">
            <div id="state_content">
            </div>
            <script>
                jQuery(document).ready(function () {
                    getUserData();
                });
                function getUserData() {
                    var Option =
                        {
                            url: encodeURI('http://localhost:8080/getStatus'),
                            type: "get",
                            dataType: 'text',
                            cache: false, //设置为 false 将不会从浏览器缓存中加载请求信息。
                            async: true, //(默认: true)，所有请求均为异步请求。发送同步请求，请将此选项设置为 false。同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。
                            timeout: 150000, //设置请求超时时间（毫秒）。此设置将覆盖全局设置。
                            error: function () {
                                alert:("gg");
                            },
                            success: function (data, textStatus) {
                                if (data == null || data == undefined) {
                                    return false;
                                }
                                jsondata = eval('(' + data + ')');

                                if (jsondata.msg == "success") {
                                    var weburl = '<a class="sf-menu" style="display:inline-block;margin-right:20px;padding-top:10px;">' + jsondata.userName + '</a><a class="sf-menu" onclick="ExitLoginState()">退出</a>';

                                    $("#state_content").html(weburl); //内容
                                    document.getElementById('loginStatu').style.display='display';
                                }
                                else {
                                    var textList = '<li><a href="http://localhost:8080/turn/loginPage" class="sf-menu">登录</a></li><li><a href="http://localhost:8080/turn/registerPage" class="sf-menu">注册</a></li>';
                                    $("#state_content").html(textList); //内容
                                    document.getElementById('loginStatu').style.display='none';

                                }
                            },
                            beforeSend: function () {
                            }
                        };
                    jQuery.ajax(Option);
                    return false;
                }

                function ExitLoginState() {
                    $.ajax({
                        url: "http://localhost:8080/session/logout",
                        type: "GET",
                        scriptCharset: 'utf-8 ',
                        contentType: 'application/json',
                        headers: {
                            "content-Type": "application/json"
                        },
                        error: function () {
                            alert("退出失败");
                        },
                        success: function () {
                            console.log("退出成功");
                            var textList = '<li><a href="http://localhost:8080/turn/loginPage" class="sf-menu">登录</a></li><li><a href="http://localhost:8080/turn/registerPage" class="sf-menu">注册</a></li>';
                            $("#state_content").html(textList); //内容
                            window.location.href='http://localhost:8080/turn/homePage';
                        }
                    });
                    return false;
                }
            </script>
        </ul>


        <ul class="authentication" id="loginStatu">
            <li>
                <a href="http://localhost:8080/turn/orderPage" class="sf-menu">我的订单</a>
            </li>
            <li>
                <a href="http://localhost:8080/turn/cartPage" class="sf-menu">购物车(<span><%=session.getAttribute("num")%></span>)</a>
            </li>

        </ul>


    </div>
</div>


<ul class="layui-nav layui-bg-cyan" id="1233" style="text-align: center">
    <li class="layui-nav-item"><a href="http://localhost:8080/turn/homePage">首页</a></li>
</ul>
<div><!--最外层灰色背景-->
    <div id="curSite" class="homepage">
        <a href="http://localhost:8080/turn/homePage" style="color:#333">首页</a>
        <c:set var="hidden" value="<%=request.getParameter("name")%>"/>
        <c:if test="${hidden!=null}">
            <span class="arrow"></span>
            <span class="gray" id="bread02"><%=request.getParameter("name")%></span>
            <span class="gray" id="bread03"></span>
        </c:if>
    </div>

    <!--商品展示区域-->
    <div class="list"><!--次外层白色背景-->
        <div class="guide">
            <div class="row1">
                <div><span class="row1col1">分类：</span></div>
                <a href="javascript:;" class="row1col2">全部</a>

            </div>

        </div>
        <div class="goodslist"><!--列表展示区-->
            <!--添加商品处-->
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/reference/js/jquery-2.1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/plugins/hoverIntent.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/plugins/superfish.min.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/plugins/mejs/mediaelement-and-player.min.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/plugins/jquery.flexslider-min.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/plugins/rangeslider.min.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/uou-accordions.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/uou-tabs.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/plugins/rangeslider.min.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/jquery.swipebox.min.js"></script>
<script src="${pageContext.request.contextPath}/reference/js/scripts.js"></script>

<script src="${pageContext.request.contextPath}/reference/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['carousel', 'form'], function () {
        var carousel = layui.carousel
            , form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1'
            , arrow: 'always'
        });

        //改变下时间间隔、动画类型、高度
        carousel.render({
            elem: '#test2'
            , interval: 1800
            , anim: 'fade'
            , height: '120px'
        });

        //设定各种参数
        var ins3 = carousel.render({
            elem: '#test3'
        });
        //图片轮播
        carousel.render({
            elem: '#test10'
            , width: '98%'
            , height: '440px'
            , interval: 5000
        });

        //事件
        carousel.on('change(test4)', function (res) {
            console.log(res)
        });

        var $ = layui.$, active = {
            set: function (othis) {
                var THIS = 'layui-bg-normal'
                    , key = othis.data('key')
                    , options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        //监听开关
        form.on('switch(autoplay)', function () {
            ins3.reload({
                autoplay: this.checked
            });
        });

        $('.demoSet').on('keyup', function () {
            var value = this.value
                , options = {};
            if (!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });

        //其它示例
        $('.demoTest .layui-btn').on('click', function () {
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });

    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>


</body>
</html>
