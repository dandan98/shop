var goodsId="";
var goodsSize="";
var goodsColor="";
var goodsQuantity="";
var goodsPrice="";
$(document).ready(function(){
    $.ajax({
        url:"http://localhost:8080/getInfo/goodsShow",
        type : "GET",
        scriptCharset: 'utf-8 ',
        contentType: 'application/json',
        headers: {
            "content-Type":"application/json"
        },
        success:function(mydata){
            var goodsdata=JSON.parse(mydata);
            console.log(goodsdata.msg);
            if(goodsdata.msg==="success"){
                var strxiaotu="";
                var stryanse="";
                var strchicun="";
                goodsQuantity=1;
                /*var goodsColor="";*/
                /*var goodsSize="";*/
                goodsId=goodsdata.goodsId;
                goodsPrice=goodsdata.goodsPrice;
            /*    var goodsId=JSON.parse(goodsdata.goodsId);*/
                console.log(JSON.parse(goodsdata.smallPhoto));
                $.each(JSON.parse(goodsdata.smallPhoto), function (index1, item1){
                    strxiaotu+="<div class=\"xiaotu\"><img class='smallShow' src=\""+
                        item1.goodsPhoto+
                        "\" onclick=\"bigShow('"+item1.goodsPhoto
                        +"')\" width=\"100%\" height='100%'/></div>";
                });
                $.each(JSON.parse(goodsdata.size), function (index2, item2){
                    strchicun+="<div class=\"chicunweizhi\" id=\""+item2.goodsSize+"\"><p class=\"chicun\">"+item2.goodsSize+"</p></div>";

                });
                $.each(JSON.parse(goodsdata.color), function (index3, item3){
                    stryanse+="<div class=\"yanseweizhi\" id=\""+item3.goodsColor+"\"><p class=\"chicun color\">"+item3.goodsColor+"</p></a></div>";

                });
                $('.Smingzi').append("<p class=\"mingcheng\">"+goodsdata.goodsTitle+"</p><p class=\"jieshao1\">"+goodsdata.goodsDescribe+"</p>");
                $('.Sjiajia').append("<td class=\"jieshao\">活动价</td><td class=\"jiage\">￥"+goodsdata.goodsPrice+"</td>");
                $('.chicunhang1').append(stryanse);
                $('.chicunhang2').append(strchicun);
                $('.datu').append("<div class=\"datu\"><img id='bigShow' src="+goodsdata.goodsPhoto+" width=\"100%\" height='100%'/></div>");
                $('.Stu').append(strxiaotu);
                $('#shumu').append("<div class=\"shuzikuang\"><img src=\"http://localhost:8080/reference/img/jian.png\" class=\"shuzijian\" />" +
                    "<div class=\"dangqianshuzi\"><p class=\"shuzi\"  id=\""+goodsdata.goodsQuantity+"\" ><span class='shuzispan'>"+goodsQuantity+"</span></p>" +
                    "</div><img src=\"http://localhost:8080/reference/img/jia.png\" class=\"shuzijia\"/>");
                $(".chicunweizhi").on("click",function() {
                    goodsSize=$(this).attr("id");//获取当前点击的id值
                    console.log(goodsSize);
                    $(this).css("border","solid #c0ae8a 1px");
                    $(this).siblings('.chicunweizhi').css("border","solid #dddddd 1px");
                });
                $(".yanseweizhi").on("click",function() {
                    goodsColor=$(this).attr("id");//获取当前点击的id值
                    console.log(goodsColor);
                    $(this).css("border","solid #c0ae8a 1px");
                    $(this).siblings('.yanseweizhi').css("border","solid #dddddd 1px");
                });
                $(".shuzijian").on("click",function () {
                    if(goodsQuantity===0){
                        goodsQuantity=0;
                    }else{
                        goodsQuantity--;
                        document.getElementsByClassName("shuzi").id=goodsQuantity;
                        $(".shuzispan").empty();
                        $('.shuzi').append("<span class='shuzispan'>"+goodsQuantity+"</span>");
                        console.log(goodsQuantity);
                    }
                });
                $(".shuzijia").on("click",function () {
                    goodsQuantity++;
                    document.getElementsByClassName("shuzi").id=goodsQuantity;
                    $(".shuzispan").empty();
                    $('.shuzi').append("<span class='shuzispan'>"+goodsQuantity+"</span>");
                    console.log(goodsQuantity);
                });

            }
            else{
                console.log("失败");
            }
        }
    });
    $(".smallShow").click(function () {
        console.log("小图")
        var ccc=$(this).src;
        console.log(ccc);

        document.getElementById('bigShow').src=ccc;


    });

    $(".goumai").click(function(){

        console.log("立即购买");
        if(goodsSize==""||goodsColor==""||goodsQuantity==0){
            console.log("-----------不能购买");
            if(goodsSize==""){
                document.getElementById('buyInfo').innerHTML='请选择物品尺寸!';}

            if(goodsColor==""){
                document.getElementById('buyInfo').innerHTML='请选择物品颜色!';}
            if(goodsQuantity==0){
                document.getElementById('buyInfo').innerHTML='物品数量不能为0!';}

        }
        else{
            $.ajax({
                url:"http://localhost:8080/addOrder?goodsId="+goodsId+"&goodsQuantity="+goodsQuantity+"&goodsPrice="+goodsPrice+"&goodsSize="+goodsSize+"&goodsColor="+goodsColor,
                type : "get",
                scriptCharset: 'utf-8 ',
                contentType: 'application/json',
                dataType: 'json',
                headers: {
                    "content-Type":"application/json;charset=UTF-8"
                },
                success:function(data){
                    console.log(data);
                    if(data.msg==="success"){
                        console.log("success");
                        window.location.href='http://localhost:8080/turn/orderPage';
                    }
                    else{
                        console.log("付款失败")
                    }

                }
            });
        }


    });
    $(".gouwuche").click(function(){
        console.log("加入购物车");
        if(goodsSize==""||goodsColor==""||goodsQuantity==0){
            console.log("-----------不能购买");
            if(goodsSize==""){
                document.getElementById('buyInfo').innerHTML='请选择物品尺寸!';}

            if(goodsColor==""){
                document.getElementById('buyInfo').innerHTML='请选择物品颜色!';}
            if(goodsQuantity==0){
                document.getElementById('buyInfo').innerHTML='物品数量不能为0!';}

        }
        else{
            $.ajax({
                url:"http://localhost:8080/addCart?goodsId="+goodsId+"&goodsQuantity="+goodsQuantity+"&goodsSize="+goodsSize+"&goodsColor="+goodsColor,
                type : "get",
                scriptCharset: 'utf-8 ',
                contentType: 'application/json',
                dataType: 'json',
                headers: {
                    "content-Type":"application/json;charset=UTF-8"
                },
                success:function(data){
                    console.log(data);
                    if(data.msg==="success"){
                        console.log("success");
                        var str11="<div class=\"alert alert-success alert-dismissible\" role=\"alert\">" +
                            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" +
                            "添加购物车成功</div>";

                        $("#body").append(str11);
                    }
                    else{

                        var str12="<div class=\"alert alert-warning alert-dismissible\" role=\"alert\">" +
                            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" +
                            "添加购物车失败</div>";

                        $("#body").append(str12);

                    }

                }
            });
        }

    });
});
function bigShow(bigPhoto) {
    document.getElementById('bigShow').src=bigPhoto;

}
function Quit_del() {
    document.getElementById("buyCar").style.display='none';

}


/*$(document).ready(function (){
    var data={
        "goodsInfo": "纯棉拉舍尔，被窝享冬眠",
        "goodsTitle": "冬眠暖绒四件套",
        "goodsPrice": "123",
        "goodsPhoto": "http://yanxuan.nosdn.127.net/1d545b023598a953c2968c1d5f71473a.jpg?imageView&quality=95&thumbnail=245x245",
        "goodsDescribe": "这是一个被子",
        "smallPhoto": [
            {
                "goodsPhoto": "http://yanxuan.nosdn.127.net/1d545b023598a953c2968c1d5f71473a.jpg?imageView&quality=95&thumbnail=245x245"
            },
            {
                "goodsPhoto": "http://yanxuan.nosdn.127.net/1d545b023598a953c2968c1d5f71473a.jpg?imageView&quality=95&thumbnail=245x245"
            },
            {
                "goodsPhoto": "http://yanxuan.nosdn.127.net/1d545b023598a953c2968c1d5f71473a.jpg?imageView&quality=95&thumbnail=245x245"
            },
            {
                "goodsPhoto": "http://yanxuan.nosdn.127.net/1d545b023598a953c2968c1d5f71473a.jpg?imageView&quality=95&thumbnail=245x245"
            },
            {
                "goodsPhoto": "http://yanxuan.nosdn.127.net/1d545b023598a953c2968c1d5f71473a.jpg?imageView&quality=95&thumbnail=245x245"
            }
        ],
        "size": [
            {
                "goodsSize": "1.5M"
            },
            {
                "goodsSize": "1.8M"
            }
        ],
        "color": [
            {
                "goodsColor": "红色"
            },
            {
                "goodsColor": "绿色"
            }
        ]
    };
    console.log("maying");
    var strxiaotu="";
    var stryanse="";
    var strchicun="";
    var goodsQuantity=0;
    var goodsColor="";
    var goodsSize="";
    var goodsId="";
    $.each(data.smallPhoto, function (index1, item1){
        strxiaotu+="<div class=\"xiaotu\"><img src=\""+item1.goodsPhoto+"\" width=\"100%\" height='100%'/></div>";
    });
    $.each(data.size, function (index2, item2){
        strchicun+="<div class=\"chicunweizhi\" id=\""+item2.goodsSize+"\"><p class=\"chicun\">"+item2.goodsSize+"</p></div>";


    });
    $.each(data.color, function (index3, item3){
        stryanse+="<div class=\"yanseweizhi\" id=\""+item3.goodsColor+"\"><p class=\"chicun\">"+item3.goodsColor+"</p></a></div>";

    });
    $('.Smingzi').append("<p class=\"mingcheng\">"+data.goodsTitle+"</p><p class=\"jieshao1\">"+data.goodsDescribe+"</p>");
    $('.Sjiajia').append("<td class=\"jieshao\">活动价</td><td class=\"jiage\">￥"+data.goodsPrice+"</td>");
    $('.chicunhang1').append(stryanse);
    $('.chicunhang2').append(strchicun);
    $('.datu').append("<div class=\"datu\"><img src="+data.goodsPhoto+" width=\"100%\" height='100%'/></div>");
    $('.Stu').append(strxiaotu);
    $('#shumu').append("<div class=\"shuzikuang\"><img src=\"jian.png\" class=\"shuzijian\" />" +
        "<div class=\"dangqianshuzi\"><p class=\"shuzi\"  id=\""+goodsQuantity+"\" ><span class='shuzispan'>"+goodsQuantity+"</span></p>" +
        "</div><img src=\"jia.png\" class=\"shuzijia\"/>");
    $(".chicunweizhi").on("click",function() {
        goodsSize=$(this).attr("id");//获取当前点击的id值
        console.log(goodsSize);
        $(this).css("border","solid #c0ae8a 1px");
        $(this).siblings('.chicunweizhi').css("border","solid #dddddd 1px");
    });
    $(".yanseweizhi").on("click",function() {
        goodsColor=$(this).attr("id");//获取当前点击的id值
        console.log(goodsColor);
        $(this).css("border","solid #c0ae8a 1px");
        $(this).siblings('.yanseweizhi').css("border","solid #dddddd 1px");
    });
    $(".shuzijian").on("click",function () {
        if(goodsQuantity===0){
            goodsQuantity=0;
        }else{
            goodsQuantity--;
            document.getElementsByClassName("shuzi").id=goodsQuantity;
            $(".shuzispan").empty();
            $('.shuzi').append("<span class='shuzispan'>"+goodsQuantity+"</span>");
            console.log(goodsQuantity);
        }
    });
    $(".shuzijia").on("click",function () {
        goodsQuantity++;
        document.getElementsByClassName("shuzi").id=goodsQuantity;
        $(".shuzispan").empty();
        $('.shuzi').append("<span class='shuzispan'>"+goodsQuantity+"</span>");
        console.log(goodsQuantity);
    });

});*/


