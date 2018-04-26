
$(function(){
	$("#dologin").click(function(){

		var inputs = [];
		$(".inputbox input").each(function(){
			inputs.push($(this).val());
		});
		$.ajax({
			url:"http://localhost:8080/session/login?userName="+inputs[0]+"&passWord="+inputs[1],
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
                    window.location.href='http://localhost:8080/turn/homePage';
				}
				else{
                    document.getElementById("warnmsg").style.display='block';
                }

			}
		});



	});

});
