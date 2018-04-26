
function  checkvalue(n,  obj)  {
		var  oTip = document.getElementById("tip" + n);
		if (obj.value == "") {
			oTip.innerHTML = obj.title ;
		} else {
			oTip.innerHTML = "";
		}
	}
 

	//�˻�
	var usernameRegex = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	//�û���
	var rnameRegex=/^[a-zA-Z0-9_-]{4,10}$/;
	//����
	var passwordRegex = /^\w{6,12}$/;
	//�ֻ���
	var teleRegex = /^[1][3,4,5,7,8][0-9]{9}$/;


	function validateForm() { //����validateForm�������ڿͻ���У��  
		var flag = true;
		//У���˻�  
		var usernameNode = byId("username"); //���IDֵΪusername�Ľڵ����  
		var username = usernameNode.value; //���usernameNode�ڵ��ֵ�����û���username�ı�������д��ֵ  
		if (!usernameRegex.test(username)) {//��֤��õ���ֵ�Ƿ����������ʽ  
            byId("username_span").style.color = "red";
			document.getElementById("uspan").style.display="block"; //��������ϣ���IDֵΪusername_span�Ľڵ�������ݱ�Ϊ��ɫ  
			flag = false; //����false�����ύ  
		}

		var flag = true;
		//У���û���  
		var rnameNode = byId("rname"); //���IDֵΪusername�Ľڵ����  
		var rname = rnameNode.value; //���usernameNode�ڵ��ֵ�����û���username�ı�������д��ֵ  
		if (!rnameRegex.test(rname)) {//��֤��õ���ֵ�Ƿ����������ʽ  
			byId("rname_span").style.color = "red";
			document.getElementById("rspan").style.display="block"; //��������ϣ���IDֵΪusername_span�Ľڵ�������ݱ�Ϊ��ɫ  
			flag = false; //����false�����ύ  
		}

		//У������  
		var passwordNode = byId("password1"); //���IDֵΪpassword�Ľڵ����  
		var password = passwordNode.value;
		if (!passwordRegex.test(password)) {
			byId("password1_span").style.color = "red";
			document.getElementById("pspan1").style.display="block";
			flag = false;
		}

		//ȷ������  
		var rePasswordNode = byId("password2"); //���IDֵΪrePassword�Ľڵ����  
		var rePassword = rePasswordNode.value;
		if (!password == rePassword) {
			byId("password2_span").style.color = "red";
			document.getElementById("pspan2").style.display="block";
			flag = false;
		} else if (!passwordRegex.test(rePassword)) {
			byId("password2_span").style.color = "red";
			document.getElementById("pspan2").style.display="block";
			flag = false;
		} else {
			byId("password2_span").style.color = "green";
		}


		//У���ֻ���
		var teleNode = byId("tele");
		var tele = teleNode.value;
		if (!teleRegex.test(tele)) {
			byId("tele_span").style.color = "red";
			document.getElementById("tspan").style.display="block";
			flag = false;
		}

		return flag;
	}

	function byId(id) { //�Զ��巽�������ڻ�ȡ���ݹ�����IDֵ��Ӧ�Ľڵ����  
		return document.getElementById(id);
	}


	function checkUsername(node) { //������뿪�ڵ�ʱ���ô˷�������֤�ڵ������Ƿ����ע��淶  
		//У���˻�  
		var username = node.value; //�õ����ݹ����Ľڵ�����ֵ  
		if (!usernameRegex.test(username)) { //��֤�Ƿ���Ͻڵ��Ӧ��������ʽ 
			byId("username_span").style.color = "red";
			document.getElementById("uspan").style.display="block"; //�����ϣ���Ӧ���ݱ�ɺ�ɫ  
		} else {
			byId("username_span").style.color = "green";
			document.getElementById("uspan").style.display="none"; //���ϣ���Ӧ���ݱ����ɫ  
		}
	}

	function checkrname(node) { //������뿪�ڵ�ʱ���ô˷�������֤�ڵ������Ƿ����ע��淶  
		//У���û��� 
		var rname = node.value; //�õ����ݹ����Ľڵ�����ֵ  
		if (!rnameRegex.test(rname)) { //��֤�Ƿ���Ͻڵ��Ӧ��������ʽ 
			byId("rname_span").style.color = "red";
			document.getElementById("rspan").style.display="block"; //�����ϣ���Ӧ���ݱ�ɺ�ɫ  
		} else {
			byId("rname_span").style.color = "green";
			document.getElementById("rspan").style.display="none"; //���ϣ���Ӧ���ݱ����ɫ  
		}
	}

	function checkPassword(node) { //������뿪�ڵ�ʱ���ô˷�������֤�ڵ������Ƿ����ע��淶  
		//У������  
		var password1 = node.value;
		//alert("111");  
		if (!passwordRegex.test(password1)) {
			byId("password1_span").style.color = "red";
			document.getElementById("pspan1").style.display="block";
		} else {
			byId("password1_span").style.color = "green";
			document.getElementById("pspan1").style.display="none";
		}
	}

	function checkRePassword(node) { //������뿪�ڵ�ʱ���ô˷�������֤�ڵ������Ƿ����ע��淶  
		//ȷ������                
		var rePassword = node.value;
		var password = byId("password2").value;
		//alert(repassword+"***"+password);           
		if (!password == rePassword) {
			byId("password2_span").style.color = "red";
			document.getElementById("pspan2").style.display="block";
		} else if (!passwordRegex.test(rePassword)) {
			byId("password2_span").style.color = "red";
			document.getElementById("pspan2").style.display="block";
		} else {
			byId("password2_span").style.color = "green";
			document.getElementById("pspan2").style.display="none";
		}
	}



	function checkTele(node) { //������뿪�ڵ�ʱ���ô˷�������֤�ڵ������Ƿ����ע��淶  
		//У��绰
		var tele = node.value;
		if (!teleRegex.test(tele)) {
			byId("tele_span").style.color = "red";
			document.getElementById("tspan").style.display="block";
		} else {
			byId("tele_span").style.color = "green";
			document.getElementById("tspan").style.display="none";
		}
	}

	
