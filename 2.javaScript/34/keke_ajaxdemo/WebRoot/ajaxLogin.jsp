<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>My JSP 'login.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
  
  		
  		<!-- 请求地址和请求方式 -->
  		<form id="loginForm"> 
	 		<p>账号：<input type="text" name="account" id="account"/></p>
			<p>密码：<input type="password" name="password" id="password"/></p>
			<p><input type="button" onclick="login()" value="登陆"/></p>
  		</form>
  		
  		
  		<script type="text/javascript">
  		
  			if(!String.prototype.trim){
  				String.prototype.trim = function (){  
  				    return this.replace(/(^\s*)|(\s*$)/g, "");  
  				};
			}
//   			String.prototype.ltrim = function () {  
//   			    return this.replace(/(^\s*)/g, "");  
//   			}; 

//   			String.prototype.rtrim = function () {  
//   			    return this.replace(/(\s*$)/g, "");  
//   			}; 
  			//请求地址一定要有，
  			//请求方式
  			//传递参数
  			
  			//ajax---对应javascript的知识点：XMLHttpRequest
  			
  			//javascript中原生态的ajax
  			
  			//ajax对象 ie8+才支持
  			/*
	  			var xhr = new XMLHttpRequest();
	  			xhr.onreadystatechange = function(){
	  			};
	  			xhr.open("请求方式post/get","请求地址");
	  			//发送请求
	  			xhr.send();
	  			
	  			参数传递
	  			get请求的方式
		  			var xhr = new XMLHttpRequest();
		  			xhr.onreadystatechange = function(){
		  			};
		  			var params = "?username=keke&password=12346";
		  			xhr.open("get",url+params);
		  			//发送请求
		  			xhr.send();
		  			
		  			
		  		post请求的方式
		  			var xhr = new XMLHttpRequest();
		  			xhr.onreadystatechange = function(){
		  			};
		  			var params = "?username=keke&password=12346";
		  			xhr.open("post",url);
		  			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		  			//发送请求
		  			xhr.send(params);	
	  			
  			
  			*/
  			/*
  			function login(){
  				var xhr = getXHR();
  	  			var account = document.getElementById("account").value;
  	  			var password = document.getElementById("password").value;
  	  			if(!password){
  	  				alert("javascript验证密码....");
					document.getElementById("password").value ="";
					document.getElementById("password").focus();
					return;
  	  			}
  	  			var params ="?account="+account+"&password="+password;
  	  			xhr.open("get", "login"+params);
  	  			xhr.onreadystatechange = function(){
 	  				//this.readyStat=4和this.status==200(是服务器响应的状态)。200 请求和响应是正常的
  	  				if(this.readyState==4 && this.status==200){
  	  					var text = this.responseText.trim();
  	  					if(text=="success"){
  	  						alert("登陆成功....");
  	  					}else{
  	  						alert("你的账号密码输入有误....");
  	  						document.getElementById("password").value ="";
  	  						document.getElementById("password").focus();
  	  					}
  	  				}
  	  			};
  	  			xhr.send();
  			}*/
  			
  			function login(){
  				var xhr = getXHR();//ie8
  	  			var account = document.getElementById("account").value;
  	  			var password = document.getElementById("password").value;
  	  			if(!password){
  	  				alert("javascript验证密码....");
					document.getElementById("password").value ="";
					document.getElementById("password").focus();
					return;
  	  			}
  	  			//var params ="account="+account+"&password="+password;
  	  			var params = tzParams(document.getElementById("loginForm"));
  	  			
  	  			alert(params);
  	  			xhr.open("post", "login");
  	  			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  	  			xhr.onreadystatechange = function(){
 	  				//this.readyStat=4和this.status==200(是服务器响应的状态)。200 请求和响应是正常的
  	  				if(this.readyState==4 && this.status==200){
  	  					var text = this.responseText.trim();
  	  					if(text=="success"){
  	  						window.location.href = "index.jsp";
  	  					}else{
  	  						alert("你的账号密码输入有误....");
  	  						document.getElementById("password").value ="";
  	  						document.getElementById("password").focus();
  	  					}
  	  				}
  	  			};
  	  			//发送请求
  	  			xhr.send(params);
  			}
  			
  			
  			function getXHR(){
  				var xhr = null;
  				if(XMLHttpRequest){
  					xhr = new XMLHttpRequest();
  				}else{
  					var ids = ["MSXML2.XMLHTTP","MSXML2.XMLHTTP.3.0","Microsoft.XMLHTTP"];
  					for(var i=0,len=ids.length;i<len;i++){
  						try{
  							xhr = new ActiveXObject(ids[i]);
  							break;
  						}catch(e){
  							
  						}
  					}
  				}
  				return xhr;
  			}
  			
  			//jquery ---中serialize的原理
  			function tzParams(formDom){
  				var formElements = formDom.elements;
  				var params = "";
				for(var i=0,len=formElements.length;i<len;i++){
					var type = formElements[i].type.toLowerCase();
					if(type!="button" && type!="submit" && type!="reset"){
						if((type=="radio" || type=="checkbox") && formElements[i].checked){
							params+=((i>0)?"&":"")+formElements[i].name+"="+encodeURIComponent(formElements[i].value);
						}else{
							if(type!="radio" && type!="checkbox"){
								params+=((i>0)?"&":"")+formElements[i].name+"="+encodeURIComponent(formElements[i].value);
							}
						}
					}
				}
				return params;
  			}
  			
  			
  			
  			
  			//如何去传递参数，如何去监控这些数据的流程和状态。，又如何去跳转页面
  			
  			//ajax-----javascript一部分--通过事件触发的方式去提交。它和form无关.它是另外一种请求的方式
  		
  		</script>
  </body>
</html>
