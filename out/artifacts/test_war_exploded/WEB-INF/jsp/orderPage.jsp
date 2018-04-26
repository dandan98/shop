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
    <script type="text/javascript" src="${pageContext.request.contextPath}/reference/js/orderPage.js" ></script>
    <title>商品订单页面</title>
</head>
<style>
    .zongyemian{
        margin-top: 2px;
        width: auto;
        height: auto;
        color: #ffffff;
    }
    .shouhuo{
        border: #e8e8e8 solid 1px;
        height: auto;
        width: 1100px;
        margin-top: 20px;
        margin-left: 120px;
    }
    .Sshouhuo{
        border: #e8e8e8 solid 1px;
        height: auto;
        width: 1100px;
        margin-top: 20px;
        margin-left: 120px;
    }
    .shouhuolan{
        height: 40px;
        width: 1100px;
        margin-left: 0;
        margin-top: 0;
        background-color: #f5f5f5;
    }
    .shouhuowenzi{
        position: absolute;
        display: block;
        margin-top: 7px;
        margin-left: 14px;
        font-size: 15px;
        color: #999999;
        font-weight: inherit;
    }
    .tianxie{
        width: 700px;
        height: 200px;
        border-right: #e8e8e8 dashed 1px;
        margin-top: 48px;
        margin-left: 0;
    }
    .diqu{
        width: 660px;
        height: 40px;
        margin-top: 0;
        margin-left: 40px;
    }
    .zi{
        color: black;
        width: 100px;
        font-size: 15px;
        font-weight: inherit;
        display: block;
        margin-top: 10px;
    }
    .liebiao1{
        display: block;
        width: 160px;
        height: 30px;
        margin-top:-25px;
        margin-left: 90px;
        position: absolute;
    }
    .liebiao2{
        display: block;
        width: 160px;
        height: 30px;
        margin-top:-25px;
        margin-left: 260px;
        position: absolute;
    }
    .liebiao3{
        display: block;
        width: 160px;
        height: 30px;
        margin-top:-25px;
        margin-left: 430px;
        position: absolute;
    }
    .dizhi{
        width: 660px;
        height: 80px;
        margin-top: 0;
        margin-left: 40px;
    }
    .xiangxidizhi{
        width: 495px;
        height: 65px;
        position: absolute;
        margin-top: -25px;
        margin-left: 90px;
    }
    .zi2{
        color: black;
        width: 100px;
        font-size: 15px;
        font-weight: inherit;
        display: block;
        margin-top: 10px;
        margin-left: 15px;
    }
    .zi3{
        color: black;
        width: 100px;
        font-size: 15px;
        font-weight: inherit;
        display: block;
        margin-top: -20px;
        margin-left: 330px;
    }
    .shouhuo1{
        display: block;
        width: 160px;
        height: 30px;
        margin-top:-25px;
        margin-left: 90px;
        position: absolute;
    }
    .haoma3{
        display: block;
        width: 160px;
        height: 30px;
        margin-top:-25px;
        margin-left: 425px;
        position: absolute;
    }
    .baocun{
        width: 300px;
        height: 130px;
        margin-left: 750px;
        margin-top: -150px;
        position: absolute;
    }
    .moren{
        margin-top: 0;
        margin-left: 10px;
    }
    .zimoren{
        color: black;
        width: 100px;
        font-size: 15px;
        font-weight: inherit;
        display: block;
        margin-top: -20px;
        margin-left: 35px;
        position: absolute;
    }
    .goumai{
        border: #c0ae8a solid 1px;
        background-color: #efefef;
        border-radius: 3px;
        color: #c0ae8a;
        font-size: 16px;
        height: 38px;
        width: 100px;
        margin-left: 12px;
        margin-right: 5px;
        margin-top: 10px;
    }
    .goumai:hover{
        background-color: white;
        text-decoration: none;
    }
    .gouwuche{
        border: #c0ae8a solid 1px;
        background-color: #c0ae8a;
        border-radius: 3px;
        color: white;
        font-size: 16px;
        height: 38px;
        width: 100px;
    }
    .gouwuche:hover{
        background-color: #CEBB94;
        text-decoration: none;
    }
    .z1{
        position: absolute;
        display: block;
        margin-top: 7px;
        margin-left: 430px;
        font-size: 15px;
        color: #999999;
        font-weight: inherit;
    }
    .z2{
        position: absolute;
        display: block;
        margin-top: 7px;
        margin-left: 630px;
        font-size: 15px;
        color: #999999;
        font-weight: inherit;
    }
    .z3{
        position: absolute;
        display: block;
        margin-top: 7px;
        margin-left: 860px;
        font-size: 15px;
        color: #999999;
        font-weight: inherit;
    }
    .z4{
        position: absolute;
        display: block;
        margin-top: 7px;
        margin-left: 1000px;
        font-size: 15px;
        color: #999999;
        font-weight: inherit;
    }
    .yitiaoxinxi{
        border-bottom: #f5f5f5 dashed 1px;
        margin-top: 0;
        margin-left: 0;
        height: 98px;
        width: 1100px;
    }
    .shangpintu{
        width: 78px;
        height: 78px;
        margin-top: 20px;
        margin-left: 20px;
    }
    .shangpinzizongkuang{
        margin-top: -95px;
        margin-left: 10px;
        height: 40px;
        width: 1100px;
    }
    .shangpinzi1{
        position: absolute;
        width: 210px;
        height: 78px;
        margin-top:0;
        margin-left: 120px;
        color: black;
        font-size: 14px;
    }
    .shangpinzi2{
        position: absolute;
        width: 110px;
        height: 78px;
        margin-top: 0;
        margin-left: 405px;
        color: black;
        font-size: 14px;
    }
    .shangpinzi3{
        position: absolute;
        width: 30px;
        height: 78px;
        margin-top: 0;
        margin-left: 620px;
        color: black;
        font-size: 14px;
    }
    .shangpinzi4{
        position: absolute;
        width: 110px;
        height: 78px;
        margin-top: 0;
        margin-left: 835px;
        color: black;
        font-size: 14px;
    }
    .shangpinzi5{

        position: absolute;
        width: 60px;
        height: 78px;
        margin-top: 0;
        margin-left: 1000px;
        color: black;
        font-size: 14px;
    }
    .shouhuolan1{

        height: 160px;
        width: 1100px;
        margin-left: 120px;
        margin-top: 0;
        background-color: #f5f5f5;
        border: #e8e8e8 solid 1px;
        border-top: none;
    }
    .zongjia{
        margin-left: 820px;
        margin-top: 20px;
        font-size: 14px;
        color: black;
        font-weight: inherit;
        position: absolute;
    }
    .hong{
        font-weight: bold;
        font-size: 20px;
        color: #d4282d;
    }
    .anniu1{
        position: absolute;
        margin-top: 80px;
        margin-left: 815px;
    }
    .fukuan{
        border: #c0ae8a solid 1px;
        background-color: #c0ae8a;
        border-radius: 3px;
        color: white;
        font-size: 16px;
        height: 50px;
        width: 180px;
    }
    .fukuan:hover{
        background-color: #CEBB94;
        text-decoration: none;
    }
    .fengexian{
        border-top: dashed #e8e8e8 1px;
        border-bottom: none;
    }
    .morendizhi{
        height: 18px;
        width: 100px;
        margin-top: 0;
        margin-left: 10px;
    }
    .morendizhitu{
        height: 18px;
        width: 18px;
        margin-top: 0;
        margin-left: 0;
    }
</style>
<body>
<div class="zongyemian">
    <div class="shouhuo">
        <div class="shouhuolan">
            <b class="shouhuowenzi">收货信息</b>
        </div>
        <div class="tianxie">
            <div class="diqu">
                <span class="zi">所在地区：</span>
                <select class="liebiao1" name="sheng">
                    <option>陕西省</option>
                    <option>陕西</option>
                </select>
                <select class="liebiao2" name="shi">
                    <option>西安市</option>
                </select>
                <select class="liebiao3" name="qu">
                    <option>未央区</option>
                </select>
            </div>
            <div class="dizhi">
                <span class="zi">详细地址：</span>
                <textarea placeholder="详细地址，街道、门牌号等" class="xiangxidizhi" name="address" id="textarea1"></textarea>
            </div>
            <div class="diqu">
                <span class="zi2">收货人：</span>
                <textarea class="shouhuo1" name="recipient" id="textarea2"></textarea>
                <span class="zi3">手机号码：</span>
                <textarea class="haoma3" name="phone" id="textarea3"></textarea>
            </div>
        </div>
        <div class="baocun">
            <div class="morendizhi">
                <div class="morendizhitu">
                    <img src="${pageContext.request.contextPath}/reference/images/weixuanzhong.png"/>
                </div>
                <span class="zimoren">设为默认</span>
            </div>

            <div class="yanse">
                <button class="gouwuche" onclick="fukuan2()">立即购买</button>
                <button class="goumai" id="clear">取消</button>
            </div>
        </div>
    </div>
    <div class="Sshouhuo">
        <div class="shouhuolan">
            <span class="shouhuowenzi">商品信息</span>
            <span class="z1">单价</span>
            <span class="z2">数量</span>
            <span class="z3">小计</span>
            <!--<span class="z4">实付</span>-->
        </div>
    </div>
    <div class="shouhuolan1">
        <div class="zongjia">
            <span>应付总额：</span>
            <span class="hong"></span>
        </div>
        <div class="anniu1">
            <button class="fukuan" onclick="fukuan1()">去付款</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(".fukuan").click(function () {
            console.log("yyyyyy");
        });
    $("#clear").click(function (){
        $("#textarea1").val('');
        $("#textarea2").val('');
        $("#textarea3").val('');
    });
</script>
</html>
