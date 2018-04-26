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
    <title>新建地址</title>

    <link href="${pageContext.request.contextPath}/reference/css/address.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/reference/js/ajaxaddress.js"></script>
</head>
<body>
<div class="ftitle"></div>
<div class="a-bd">
    <div class="a-hd">
        <span>收货信息</span>
    </div>

    <div class="region">
        <span class="lable">详细地址：</span>
        <div class="region1">
				<textarea name="address" tabindex="6" class="region2"
                          placeholder="详细地址，街道，门牌号等" rows="10" cols="30"></textarea>
        </div>
    </div>

    <div class="blank"></div>

    <div class="region">
        <div class="receive-left">
            <span class="lable3">收货人：</span>
            <div class="receive-box">
                <input name="receive" tabindex="1" class="input" type="text" />
            </div>
        </div>


        <div class="region">
            <div class="receive-right">
                <span class="lable2">手机号:</span>
                <div class="receive-box">
                    <input name="tele" tabindex="2" class="input" type="text" />
                </div>
            </div>
        </div>
    </div>


    <div class="operate">
        <div class="operate2">
            <div class="operate3">
                <button class="button1">保存地址</button>
                <button class="button2">取消</button>
            </div>
        </div>
    </div>

</div>

</body>
</html>
