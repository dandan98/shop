$(document).ready(function() {
    console.log("进入图片");
    $.ajax({
        url: "http://localhost:8080/getInfo/goodsList",
        type: "GET",
        scriptCharset: 'utf-8 ',
        contentType: 'application/json',
        headers: {
            "content-Type": "application/json"
        },
        success: function (mydata) {
            var data = JSON.parse(mydata);
            console.log(data);
            if (data.msg == "success") {
                var goodsdata = JSON.parse(data.data);//封装好的商品信息部分
                console.log(goodsdata);
                document.getElementById('container').innerHTML = '';
                //首先清空该页面已有的元素
                $('.container').empty();
                var str="<div><ul class=\"ul1\">";

                $.each(goodsdata, function (index, item) {

                                str += "<li class=\"li1\"><div class=\"div1\"><div class=\"div11\"><a href=\"http://localhost:8080/turn/goodsShowPage?goodsId=" +
                                    item.goodsId + "\" class=\"a1\"><img src=\"" +
                                    item.goodsPhoto + "\" class=\"bedsimage\"></a></div><div><h4 class=\"bedsname\"><a href=\"http://localhost:8080/turn/goodsShowPage?goodsId=" +
                                    item.goodsId + "\" class=\"a1\"><span>" +
                                    item.goodsTitle + "</span></a></h4></div><div><p class=\"price\"><span>￥</span><span>" +
                                    item.goodsPrice + "</span></p></div><div class=\"foot1\"><hr class=\"foot2\"><p class=\"foot3\">" +
                                    item.goodsInfo + "</p></div></div></li>";

                    });
                str += "</ul></div>";
                    $("#container").append(str);

            }
        }
    })
})