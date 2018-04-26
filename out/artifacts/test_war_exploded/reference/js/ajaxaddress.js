
$(function(){
	$("#reserve").click(function(){

		var inputs = [];
		{
		inputs[0]=$("textarea[name='address']").val();
        inputs[0]=encodeURI(inputs[0]);
		inputs[1]=$("input[name='receive']").val();
		inputs[1]=encodeURI(inputs[1]);
		inputs[2]=$("input[name='tele']").val();
		inputs[2]=encodeURI(inputs[2]);
		}
		//$(".region input").each(function(){
		//	inputs.push($(this).val());
		//});
		$.ajax({
			url:encodeURI(encodeURI("http://localhost:8080/turn/addAddressPage?address="+inputs[0]+"& recieve="+inputs[1]+"& phoneNumber="+inputs[2])),

			type : "get",
			scriptCharset: 'utf-8 ',
			contentType: 'application/json',
			dataType: 'json',
			headers: {
				"content-Type":"application/json;charset=UTF-8"
			},
			success:function(data){
				console.log(data);
				if(data.msg=="success"){
					console.log("success");
                    window.location.href='http://localhost:8080/turn/cartPage';
				}
				else{
					console.log("新增失败")
				}

			}
		});
	});

});