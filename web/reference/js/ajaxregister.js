/**
 *
 */
function register(){
    	console.log("111111111111");

        var inputs = [];
        $(".finput input").each(function(){
            inputs.push($(this).val());
        });
        $.ajax({
            url:"http://localhost:8080/session/register?userName="+inputs[0]+"&rname="+inputs[1]+"&passWord1="+inputs[2]+"&password2="+inputs[3]+"&phone="+inputs[4],
            type : "get",
            scriptCharset: 'utf-8 ',
            contentType: 'application/json',
            dataType: 'json',
            headers: {
                "content-Type":"application/json"
            },
            success:function(data){
                console.log(data);
                if(data.msg=="success"){
                    console.log("success");
                    window.location.href='http://localhost:8080/turn/loginPage';
                }
                else{
                    console.log("失败")
                }

            }
        });



    }
