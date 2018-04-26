$(document).ready(function(){
    $.ajax({
        url:"http://localhost:8080/getInfo/goodsList",
        type : "GET",
        scriptCharset: 'utf-8 ',
        contentType: 'application/json',
        headers: {
            "content-Type":"application/json"
        },
        success:function(mydata){
            var data=JSON.parse(mydata);
            console.log(data.msg);
            if(data.msg=="success"){

                var type=JSON.parse(data.type);//封装好的类型数据
                console.log(type);
                var goodsdata=JSON.parse(data.data);//封装好的商品信息部分
                console.log(goodsdata);
                $.each(type, function (index, item)
                {
                    //动态添加的标签绑定事件需要通过事件委托而非事件绑定
                    $('.row1').append("<a href=\"javascript:;\" class=\"row1col3\" id=\""+item.typeId+"\">"+item.typeName+"</a>");
                    //a.setAttribute("id",goods_typeID+index);

                    var name2=document.getElementById('bread02').innerHTML;
                    var str="<div class=\"goodsclass\"><p class=\"classinfo\"><img src=\""+
                        item.typePhoto+"\" class=\"classimage\"></img><span>"+
                        item.typeName+"</span></p><p class=\"intro\">"+
                        item.typeInfo+"</p></div><div><ul class=\"ul1\">";

                    $.each(goodsdata, function (indexx,vall)
                    {
                        console.log("内层循环咋不出来");
                        console.log("goods的类型"+vall.typeId);
                        console.log("index "+index);

                        $.each(vall.goods, function (i,val)//循环该类下的商品
                        {
                            if(vall.typeId==item.typeId)
                            {
                                str+="<li class=\"li1\"><div class=\"div1\"><div class=\"div11\"><a href=\"http://localhost:8080/turn/goodsShowPage?goodsId="+
                                    val.goodsId+"&name1="+name2+"&name2="+item.typeName+"&name3="+val.goodsTitle+
                                    "\" class=\"a1\"><img src=\""+
                                    val.goodsPhoto+"\"class=\"bedsimage\"></a></div><div><h4 class=\"bedsname\"><a href=\"http://localhost:8080/turn/goodsShowPage?goodsId="+
                                    val.goodsId+"\" class=\"a1\"><span>"+
                                    val.goodsTitle+"</span></a></h4></div><div><p class=\"price\"><span>￥</span><span>"+
                                    val.goodsPrice+"</span></p></div><div class=\"foot1\"><hr class=\"foot2\"><p class=\"foot3\">"+
                                    val.goodsInfo+"</p></div></div></li>";
                            }
                        })
                    })

                    str+="</ul></div>";
                    $(".goodslist").append(str);

                })

                $(".row1col3").on("click",function()
                {
                    $(this).css('color','#b4a078');
                    $(this).siblings('a').css('color','#333');//选取每个匹配元素的所有同胞元素(不包括自己)
                    var typeID=$(this).attr("id");//获取当前点击的id值
                    //alert("a标签被点击了");
                    var str="<ul class=\"ul1\">";

                    var bread03=document.getElementById(typeID).innerHTML;
                    document.getElementById("bread03").innerHTML="&nbsp;>&nbsp; "+bread03;
                    $.each(goodsdata, function (key,value)
                    {
                        $.each(value.goods, function (keyy,valuee)
                        {
                            console.log("yangmei");
                            console.log("当前类型名称为："+typeID);
                            console.log("循环类型为："+value.typeId);
                            console.log("下面检验是否一致");
                            if(value.typeId==typeID)
                            {
                                console.log("一致哦");
                                console.log("========="+valuee.goodsId);
                                str+="<li class=\"li1\"><div class=\"div1\"><div class=\"div11\"><a href=\"http://localhost:8080/turn/goodsShowPage?goodsId="+
                                    valuee.goodsId+"\" class=\"a1\"><img src=\""+
                                    valuee.goodsPhoto+"\" class=\"bedsimage\"></a></div><div><h4 class=\"bedsname\"><a href=\"http://localhost:8080/turn/goodsShowPage?goodsId="+
                                    valuee.goodsId+"\" class=\"a1\"><span>"+
                                    valuee.goodsTitle+"</span></a></h4></div><div><p class=\"price\"><span>￥</span><span>"+
                                    valuee.goodsPrice+"</span></p></div><div class=\"foot1\"><hr class=\"foot2\"><p class=\"foot3\">"+
                                    valuee.goodsInfo+"</p></div></div></li>";

                            }
                            else
                            {
                                console.log("不一致");
                            }
                        })

                    });
                    str+="</ul>";
                    $(".goodslist").html(str);//设置被选元素的内容(当使用该方法设置一个值时，它会覆盖所有匹配元素的内容)
                })

                //点击全部时不重新加载该页面
                $(".row1 .row1col2").on("click",function()

                {
                    document.getElementById('bread03').innerHTML='';
                    $(this).css('color','#b4a078')
                    $(this).siblings('a').css('color','#333');//选取每个匹配元素的所有同胞元素(不包括自己)
                    //首先清空该页面已有的元素
                    $('.goodslist').empty();
                    $.each(type, function (index, item)
                    {
                        var str="<div class=\"goodsclass\"><p class=\"classinfo\"><img src=\""+item.typePhoto+"\" class=\"classimage\"></img><span>"+item.typeName+"</span></p><p class=\"intro\">"+item.typeInfo+"</p></div><div><ul class=\"ul1\">";
                        $.each(goodsdata, function (indexx,vall)
                        {
                            $.each(vall.goods, function (i,val)
                            {
                                if(vall.typeId==item.typeId)
                                {
                                    str+="<li class=\"li1\"><div class=\"div1\"><div class=\"div11\"><a href=\"http://localhost:8080/turn/goodsShowPage?goodsId="+
                                        val.goodsId+"\" class=\"a1\"><img src=\""+
                                        val.goodsPhoto+"\" class=\"bedsimage\"></a></div><div><h4 class=\"bedsname\"><a href=\"http://localhost:8080/turn/goodsShowPage?goodsId="+
                                        val.goodsId+"\" class=\"a1\"><span>"+
                                        val.goodsTitle+"</span></a></h4></div><div><p class=\"price\"><span>￥</span><span>"+
                                        val.goodsPrice+"</span></p></div><div class=\"foot1\"><hr class=\"foot2\"><p class=\"foot3\">"+
                                        val.goodsInfo+"</p></div></div></li>";
                                }
                            })
                        })
                        str+="</ul></div>";
                        $(".goodslist").append(str);
                    })
                })
            }
            else{
                console.log("shibai");
            }

            // $("#main-frame",window.parent.document).attr("src","http://localhost:8080/jcjk/user/show");

        }
    });
});
