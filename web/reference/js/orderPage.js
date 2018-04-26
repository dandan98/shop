//要给我传：goodsId,goodsInfo,goodsTitle,goodsPrice,goodsPhoto,goodsDescribe,smallPhoto（goodsPhoto乘以5）,size*2,color*2.为了跳转，还需要recieve，phoneNumber？？
// 我要传回：立即购买：goodsId,goodsSize,goodsColor,goodsQuantity(数量),goodsPrice，yingfu（应付金额），不知道要跳转到哪个页面

$(document).ready(function(){
    $.ajax({
        url:"http://localhost:8080/getInfo/order",
        type : "GET",
        scriptCharset: 'utf-8 ',
        contentType: 'application/json',
        headers: {
            "content-Type":"application/json"
        },
        success:function(mydata){
                var data=JSON.parse(mydata);
                var yingfu=0;
                $.each(data, function (index, item) {
                    $(".hong").empty();
                    yingfu+=parseInt(item.goodsPrice)*parseInt(item.goodsQuantity);
                    var xiaoji=parseInt(item.goodsPrice)*parseInt(item.goodsQuantity);
                    console.log(yingfu);
                    console.log("======="+item.goodsTitle);
                    $('.Sshouhuo').append("<div class=\"yitiaoxinxi\"><div class=\"shangpintu\"><img src=\""+
                        item.goodsPhoto+"\" height='100%' width='100%'><div class='shangpinzizongkuang'></div><div class=\"shangpinzi1\"><span>"+
                        item.goodsTitle+"</span></div><div class=\"shangpinzi2\"><span>￥"+
                        item.goodsPrice+"</span></div><div class=\"shangpinzi3\"><span>"+
                        item.goodsQuantity+"</span></div><div class=\"shangpinzi4\"><span>￥"+
                        xiaoji+"</span></div></div></div><hr class=\"fengexian\"/>");
                    $(".zongjia").append("<span class=\"hong\">￥"+yingfu+"</span>");
                });
        }
    });
    $(".fukuan").click(function(){
        console.log("立即购买");
        var inputs = [];
        {
            inputs[0]="goodsColor";
            inputs[0]=encodeURI(inputs[0]);
            inputs[1]='goodsSize';
            inputs[1]=encodeURI(inputs[1]);
            inputs[2]='goodsQuantity';
            inputs[2]=encodeURI(inputs[2]);
            inputs[3]='goodsId';
            inputs[3]=encodeURI(inputs[3]);
            inputs[4]='goodsPrice';
            inputs[4]=encodeURI(inputs[4]);
            inputs[5]='yingfu';
            inputs[5]=encodeURI(inputs[5]);
            inputs[6]=$("textarea[name='address']").val();
            inputs[6]=encodeURI(inputs[6]);
            inputs[7]=$("textarea[name='recipient']").val();
            inputs[7]=encodeURI(inputs[7]);
            inputs[8]=$("textarea[name='phone']").val();
            inputs[8]=encodeURI(inputs[8]);
            inputs[9]=$("select[name='sheng']").val();
            inputs[9]=encodeURI(inputs[9]);
            inputs[10]=$("select[name='shi']").val();
            inputs[10]=encodeURI(inputs[10]);
            inputs[11]=$("select[name='qu']").val();
            inputs[11]=encodeURI(inputs[11]);
        }
        $.ajax({
            url:encodeURI(encodeURI("http://localhost:8080/turn/orderPage?address="+inputs[3]+"& recipient="+inputs[6]+"& phone="+inputs[8])),
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
                    alert("付款成功")
                }
                else{
                    console.log("付款失败")
                }

            }
        });
    });
    $(".gouwuche").click(function(){
        console.log("立即购买");
        var inputs = [];
        {
            inputs[0]="goodsColor";
            inputs[0]=encodeURI(inputs[0]);
            inputs[1]='goodsSize';
            inputs[1]=encodeURI(inputs[1]);
            inputs[2]='goodsQuantity';
            inputs[2]=encodeURI(inputs[2]);
            inputs[3]='goodsId';
            inputs[3]=encodeURI(inputs[3]);
            inputs[4]='goodsPrice';
            inputs[4]=encodeURI(inputs[4]);
            inputs[5]='yingfu';
            inputs[5]=encodeURI(inputs[5]);
            inputs[6]=$("textarea[name='address']").val();
            inputs[6]=encodeURI(inputs[6]);
            inputs[7]=$("textarea[name='recipient']").val();
            inputs[7]=encodeURI(inputs[7]);
            inputs[8]=$("textarea[name='phone']").val();
            inputs[8]=encodeURI(inputs[8]);
        }
        $.ajax({
            url:encodeURI(encodeURI("http://localhost:8080/turn/orderPage?address="+inputs[3]+"& recipient="+inputs[6]+"& phone="+inputs[8])),
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
                    alert("付款成功")
                }
                else{
                    console.log("付款失败")
                }

            }
        });
    });
    $(".morendizhitu").click(function () {
        var addressdefault;


    })
});




/*
$(document).ready(function(){


    console.log("yyyyyy");
    var data=[
        {
            "goodsPhoto": "1.jpg",
            "goodsTitle": "冬眠暖绒四件套",
            "goodsPrice": "123",
            "goodsQuantity": "2",
            "goodsshifu": "100.00",
            "goodsxiaoji": "100.00"
        },
        {
            "goodsPhoto": "1.jpg",
            "goodsTitle": "冬眠暖绒四件套",
            "goodsPrice": "123",
            "goodsQuantity": "1",
            "goodsshifu": "100.00",
            "goodsxiaoji": "100.00"
        }
    ];
    var yingfu=0;
    //var html='';
    $.each(data, function (index, item) {
        $(".hong").empty();

        yingfu+=parseInt(item.goodsPrice)*parseInt(item.goodsQuantity);
        console.log(yingfu);
        $('.Sshouhuo').append("<div class=\"yitiaoxinxi\"><div class=\"shangpintu\"><img src="+
            item.goodsPhoto+"/ height='100%' width='100%'><div class='shangpinzizongkuang'></div><div class=\"shangpinzi1\"><span>"+
            item.goodsTitle+"</span></div><div class=\"shangpinzi2\"><span>￥"+
            item.goodsPrice+"</span></div><div class=\"shangpinzi3\"><span>"+
            item.goodsQuantity+"</span></div><div class=\"shangpinzi4\"><span>￥"+
            item.goodsPrice+"</span> </div></div></div><hr class=\"fengexian\"/>");

        $(".zongjia").append("<span class=\"hong\">￥"+yingfu+"</span>");
    });

});*/
