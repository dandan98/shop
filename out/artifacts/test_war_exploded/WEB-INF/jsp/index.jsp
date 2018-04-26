<%--
  Created by IntelliJ IDEA.
  User: danda
  Date: 2018/1/15
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>严选</title>
    <!-- Stylesheets -->

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/css/swipebox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/css/import.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/reference/js/jquery-3.2.1.js"></script>

    <style>
        .flex-next {
            background: #b4a078;
        }
    </style>
</head>
<body id="index">

<div id="main-wrapper">
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
                                    }
                                    else {
                                        var textList = '<li><a href="http://localhost:8080/turn/loginPage" class="sf-menu">登录</a></li><li><a href="http://localhost:8080/turn/registerPage" class="sf-menu">注册</a></li>';
                                        $("#state_content").html(textList); //内容
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
                            }
                        });
                        return false;
                    }
                </script>
            </ul>


            <ul class="authentication">
                <li>
                    <a href="http://localhost:8080/turn/orderPage" class="sf-menu">我的订单</a>
                </li>
                <li>
                    <a href="http://localhost:8080/turn/cartPage" class="sf-menu">购物车</a>
                </li>

            </ul>


        </div>
    </div>

    <ul class="layui-nav layui-bg-cyan" id="1233" style="text-align: center">
        <li class="layui-nav-item layui-this"><a href="">首页</a></li>
    </ul>
    <iframe src="goodsListPage.jsp"></iframe>
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
    //动态生成导航栏
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
                                        var url = baseUrl + "/turn/goodsListPage?typeId=" + itemm.typeId;
                                        $('#1233').append("<li class=\"layui-nav-item\"><a href=\"" + url + "\">" + itemm.typeName + "</a></li>");
                                    })

                                }
                            });
                        }
                    }
                });
            }
        })
    </script>
</body>
</html>
