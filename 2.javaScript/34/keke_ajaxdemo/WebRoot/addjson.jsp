
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'table.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	body{padding:100PX;font-family:"微软雅黑";}
		table{width:100%;border-collapse:collapse;}
		table tr td{border:1px solid #ccc;padding:5px;}
	</style>
  </head>
  
  <body>
  		<form id="loginForm">
  			<p>用户名:<input type="text" name="username" id="username"/></p> 
  			<p>年龄	:<input type="text" name="age" id="age"/></p>  	
  			<p>地址	:<input type="text" name="address" id="address"/></p> 
  			<p>邮箱	:<input type="text" name="email" id="email"/></p>
  			<div id="text">时代发生的发生地方</div>
  			 <a href="javascript:void(0)" onclick="tzSave()">保存数据</a>
  		</form>	
  		
   		<table >
   			<thead>
	   			<tr>
	   				<td>id</td>
	   				<td>用户名</td>
	   				<td>年龄</td>
	   				<td>邮箱</td>
	   				<td>地址</td>
	   			</tr>
   			</thead>
   			<tbody id="tbody">
	   			<tr>
	   				<td>1</td>
	   				<td>胡方雷</td>
	   				<td>30</td>
	   				<td>690328661@qq.com</td>
	   				<td>日照大学城</td>
	   			</tr>
	   			<tr>
	   				<td>2</td>
	   				<td>胡惊涛</td>
	   				<td>56</td>
	   				<td>1125@136.com</td>
	   				<td>北京四合院</td>
	   			</tr>
	   			<tr>
	   				<td>3</td>
	   				<td>随风</td>
	   				<td>16</td>
	   				<td>112ddd5@136.com</td>
	   				<td>北京上海</td>
	   			</tr>
   			</tbody>
   		</table>
   		<a href="javascript:void(0)" onclick="tzAdd()">追加行</a>
   		<form enctype=""></form>
  </body>
  <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
  <script type="text/javascript">
  		function dom(id){
  			return document.getElementById(id);
  		}
  		
  		function tzSave(){
  			//第一个版本:正常版本
  			//var username = dom("username").value;//$("#username").val();
  			//var email = dom("email").value;//$("#email").val();
  			//var address = dom("address").value;//$("#address").val();
  			//var age = dom("age").value;//$("#age").val();
  			//var text = dom("text").innerHTML;
 
  			//var json = {username:username,email:email,address:address,age:age,text:text};
  			//var jsonString = JSON.stringify(json);
  			
  			//第一种写法
  			/* $.ajax({
  				type:"post",
  				url:"add",
  				data:json,
  				success:function(data){
  					
  				}
  			}); */
  			//第二种方式
  			/* $.ajax({
  				type:"post",
  				url:"add",
  				data:{data:jsonString},
  				success:function(data){
  					alert(data);
  				}
  			}); */
  			
  			//3:完整版本
  			 var loginForm = dom("loginForm");
  			var vjson = getFromValue(loginForm);
  			if(vjson.username.value==""){
  				alert("请输入用户名......");
  				vjson.username.ele.focus();
  				vjson.username.ele.style.border = "2px solid red";
  				return;
  			}
  			var json = getFromJson(loginForm);
  			
  			json.text = dom("text").innerHTML;
  			$.ajax({
  				type:"post",
  				url:"add",
  				data:{"data":JSON.stringify(json)},
  				success:function(data){
  					//附加数据到表格中
  					if(data=="success"){
  						//附加数据到表格中
  						var len = dom("tbody").children.length;
  						var html =" <tr>" +
  						"  <td>"+(len+1)+"</td> " +
  						"  <td>"+vjson.username.value+"</td> " +
  						"  <td>"+vjson.age.value+"</td> " +
  						"  <td>"+vjson.email.value+"</td> " +
  						"  <td>"+vjson.address.value+"</td> " +
  						"  </tr> " ;
  						vjson.username.ele.value = "";
  						vjson.age.ele.value= "";
  						vjson.email.ele.value= "";
  						vjson.address.ele.value= "";
  						vjson.username.ele.focus();
  						  //$("#tbody").append(html); //juqery写法
  							dom("tbody").innerHTML +=html; //js写法
  					}
  				}
  			}); 
  
  			
  			
  		};
  		
  		
  	//获取参数值
		function getFromValue(formDom){
			var formElements = formDom.elements;
			var json = {};
			for(var i=0,len=formElements.length;i<len;i++){
				var type = formElements[i].type.toLowerCase();
				if(type!="button" && type!="submit" && type!="reset"){
					if(type=="checkbox" && formElements[i].checked){
						var value = json[formElements[i].name]||formElements[i].value;
						if(formElements[i].name in json){
							value +=","+formElements[i].value;	
						}
						json[formElements[i].name] = {
							value:value,
							ele:formElements[i]
						};
					}else if(type=="radio" && formElements[i].checked){
						json[formElements[i].name] = {
							value:formElements[i].value,
							ele:formElements[i]
						};
					}

					if(type!="radio" && type!="checkbox"){
						json[formElements[i].name] = {
							value:formElements[i].value,
							ele:formElements[i]
						};
					}
				}
			}
			return json;
		};
		
		function getFromJson(formDom){
			var formElements = formDom.elements;
			var json = {};
			for(var i=0,len=formElements.length;i<len;i++){
				var type = formElements[i].type.toLowerCase();
				if(type!="button" && type!="submit" && type!="reset"){
					if(type=="checkbox" && formElements[i].checked){
						var value = json[formElements[i].name]||formElements[i].value;
						if(formElements[i].name in json){
							value +=","+formElements[i].value;	
						}
						json[formElements[i].name] = value;
					}else if(type=="radio" && formElements[i].checked){
						json[formElements[i].name] = formElements[i].value;
					}

					if(type!="radio" && type!="checkbox"){
						json[formElements[i].name] = formElements[i].value;
					}
				}
			}
			return json;
		};
  		
  	
  </script>
</html>
<!-- collapse
[英][kəˈlæps][美][kəˈlæps]
vi.
崩溃; 倒塌; 折叠; （尤指工作劳累后）坐下; 
vt.
使倒塌; 使坍塌; 使瓦解; 
n.
垮台; （身体的）衰弱; 
 -->