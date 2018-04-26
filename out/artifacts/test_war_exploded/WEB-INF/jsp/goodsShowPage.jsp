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
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/reference/js/goodsShowPage.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/reference/js/buy.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/reference/bootstrap/js/bootstrap.min.js"></script>
    <title>商品详情页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/css/goodsShowPage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/bootstrap/css/bootstrap.min.css">

</head>
<body id="body">


<div class="zongyemian">
    <div class="suozaiweizhi">
        <p><a href="http://localhost:8080/turn/homePage" class="a1">
            首页&nbsp;&gt;</a>
            &nbsp;<a href="javascript:history.go(-1)" class="a1"><%=request.getParameter("name1")%>&nbsp;&gt;</a>
            &nbsp;<a href="javascript:history.go(-1)" class="a1"><%=request.getParameter("name2")%>&nbsp;&gt;</a>
            &nbsp;<a href="" class="a1"><%=request.getParameter("name3")%></a></p>
    </div>
    <div class="Stu">
        <div class="datu">
        </div>

    </div>
    <div class="wen">
        <div class="Smingzi" id="mingzijs"><!--gaidong-->
        </div>
        <div class="xianshigou2">
            <table class="jutixinxi">
                <tr class="Sjiajia">
                </tr>
                <tr>
                    <td class="jieshao">简介</td>
                    <td class="jieshao">购买最高得22积分</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="jieshao">服务</td>
                    <td class="jieshao">30天无忧退换货&nbsp;&nbsp;48小时快速退款&nbsp;&nbsp;师大自营品牌</td>
                </tr>
            </table>
        </div>
        <div class="xianshigou3">
            <div class="Syanse">
                <b class="yanseziyang1">颜色</b>
                <div class="chicunhang1">
                </div>

            </div>
            <div class="Schicun">
                <b class="yanseziyang2">尺寸</b>
                <div class="chicunhang2">

                </div>
            </div>
            <div class="yanse" id="shumu">
                <b class="yanseziyang">数量</b>
            </div>
        </div>
        <span style="display:block; color: red;font-size: 14px;margin: 0  0 10px 20px;" id="buyInfo"></span>
        <div class="yanse" id="buy">

            <a><button class="goumai" type="button" id="goumai">立即购买</button></a>
            <button class="gouwuche" id="gouwuche">加入购物车</button>
        </div>

    </div>

</div>
</body>
<script>
    function lijigoumai() {
        console.log("11121");
        $.ajax({
            url:"http://localhost:8080/turn/orderPage",
            type : "get",
            scriptCharset: 'utf-8 ',
            contentType: 'text/html',
            headers: {
                "content-Type":"text/html"
            },
            success:function(data){
                console.log("yuuyu");
            }
        });
    }
</script>
</html>
