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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/css/cartPage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/reference/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/reference/layui/layui.js" charset="utf-8"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/reference/js/jquery-3.2.1.js" ></script>
    <title>购物车页面</title>
    <style>
        #goodInfo tbody tr{
            border-bottom: 1px #eee dashed;
            padding: 5px 0;
        }
        #yitiaoxinxi{
            font-weight: 100;
        }
        #yitiaoxinxi tbody tr{
            font-weight: 100;
        }
    </style>
</head>

<body>
<div class="suozaiweizhi">
    <p><a href="http://localhost:8080/turn/homePage" class="a1">
        首页&nbsp;</a>&nbsp;||&nbsp;
        &nbsp;<a href="javascript:history.go(-1)" class="a1">返回上一页&nbsp;</a>

</div>
<div class="shouhuo">


       <table lay-even lay-skin="line" lay-size="lg" id="goodInfo">
           <colgroup>
               <col width="50">
               <col width="350">
               <col width="233">
               <col width="233">
               <col width="234">
           </colgroup>
           <thead>
            <tr style="background-color: #eee;">
               <th><input type="checkbox" class= "qx" name="allCheck" id="allCheck"/></th>
               <th style="display: block;margin: 5px 0;">商品信息</th>
               <th>单价</th>

               <th>数量</th>
               <th>小计</th>
           </tr>
           </thead>
           <tbody id="goodsInfoContain">

           </tbody>
       </table>
</div>
<div class="shouhuolan1">
    <div class="zongjia">
        <span>应付总额：</span>
        <span class="hong" id="result">0.00</span>
    </div>
    <div class="anniu1">
        <button class="fukuan" onclick="xiadan()">下单</button>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url: "http://localhost:8080/getInfo/cartsList",
            type: "GET",
            scriptCharset: 'utf-8 ',
            contentType: 'application/json',
            headers: {
                "content-Type": "application/json"
            },
            success: function (mydata) {
                var data = JSON.parse(mydata);
                console.log(data);
                if(data.msg=="success") {
                    var goodsData=JSON.parse(data.data);
                    $.each(goodsData, function (index, item) {
                        var goodsMoney = parseFloat(item.goodsPrice) * parseFloat(item.goodsQuantity);
                        console.log("beibei");
                        var goodsInfo = "<tr id=\"yitiaoxinxi\"><th><input type=\"checkbox\" onclick=\"fun()\" class=\"qx\" name=\"check0001\" value=\""
                            +goodsMoney+
                            "\"/></th><th><div><div class=\"shangpintu\" style=\"float: left;\"><img src=\"" +
                            item.goodsPhoto +
                            "\"class=\"tupian\"/></div><span class=\"mingzi\">" +
                            item.goodsTitle +
                            "</span></div></th><th><span class=\"danjia\">￥" +
                            item.goodsPrice +
                            "</span></th><th><span class=\"shuliang\">" +
                            item.goodsQuantity + "</span></th><th><span class=\"xiaoji\">" +
                            goodsMoney +
                            "</span></th></tr>";

                        $('#goodsInfoContain').append(goodsInfo);
                        /*$('.shouhuo').append("<div id=\"yitiaoxinxi\"><input type=\"checkbox\" onclick=\"fun()\" class=\"qx\" name=\"check\" value=\""+goodsMoney+"\"/><div class=\"shangpintu\"><img src=\"" +
                            item.goodsPhoto + "\" class=\"tupian\"/></div><div class=\"goumaixinxi\"><div class=\"shangpinzi1\"><span class=\"mingzi\">" +
                            item.goodsTitle + "</span></div><div class=\"shangpinzi2\"><span class=\"danjia\">￥" +
                            item.goodsPrice + "</span></div><div class=\"shangpinzi3\"><span class=\"shuliang\">" +
                            item.goodsQuantity + "</span></div><div class=\"shangpinzi5\"><span class=\"xiaoji\">" +
                            goodsMoney + "</span></div></div><hr class=\"fengexian\"/>");*/

                    });
                }
                else console.log("shibai");
            }
        })
    })

        function fun(){
            var obj = document.getElementsByName("check0001");
            var check_val=0;
            for(k in obj){
                if(obj[k].checked)
                    check_val += parseFloat(obj[k].value);
            }
            document.getElementById('result').innerHTML=check_val;

        }
    $(document).ready(function(){
        $("#allCheck").on("click",function(){
            if(document.getElementById('allCheck').checked) {
                var obj = document.getElementsByName("check0001");
                console.log(obj);
                var check_val = 0;
                for(var k=0;k<obj.length;k++)
                {
                    console.log("========="+k);
                    console.log(parseFloat(obj[k].value));
                    obj[k].checked = true;
                        check_val += parseFloat(obj[k].value);
                }
                document.getElementById('result').innerHTML = check_val;
            }
            else{
                var obj = document.getElementsByName("check0001");
                console.log(obj);
                for(var k=0;k<obj.length;k++)
                {
                    console.log("========="+k);
                    console.log(parseFloat(obj[k].value));
                    obj[k].checked = false;

                }
                document.getElementById('result').innerHTML = "0.00";
               /* window.location.href='http://localhost:8080/turn/cartPage';*/
            }
        })
    })

</script>
</body>
</html>
