
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
   		 <a href="javascript:void(0)" onclick="tzSave()">保存数据</a>
   		<form enctype=""></form>
  </body>
  <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
  <script type="text/javascript">
  		function dom(id){
  			return document.getElementById(id);
  		}
  		function tzAdd(){
  			var tbodyDom = dom("tbody");
  			var len = tbodyDom.children.length;
  			var trDom = document.createElement("tr");
  			trDom.className ="newItems";
  			trDom.innerHTML = "<tr>"+
  			"	<td>"+(len+1)+"</td> " +
			"	<td><input name='username'/></td> " +
			"	<td><input name='age'/></td> " +
			"	<td><input name='email'/></td> " +
			"	<td><input name='address'/></td> " +
  			"</tr>";
  			tbodyDom.appendChild(trDom);
  		}
  		function tzSave(){
  			var datas = JSON.stringify(getData());
  			var xhr = new XMLHttpRequest();
  			//XML--也是规范数据格式，同时方便语言通过相关xml技术去解析
  			//JSON--比xml又更为方便 key:value
  			xhr.onreadystatechange = function(){
  				if(this.readyState == 4 && this.status == 200){
  					//this.responseText 接收服务器返回的信息
  					var text = this.responseText.trim();
  					var jsonObj = JSON.parse(text);
  					alert(jsonObj[0].username+"====="+jsonObj[0].age);
  				}
  			}
  			xhr.open("post", "usersave");
  			//字符串转的方式进行传输的
  			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  			xhr.send("data="+datas+"&hello="+"hellow");
  		};
  		
  		function getData(){
  			var tbodyDom = dom("tbody");
  			//var trDoms = tbodyDom.children;
  			//var trDoms = tbodyDom.querySelectorAll(".newItems");
  			//for(var i=0,len=tbodyDom.length;i<len;i++){
  			//	if(tbodyDom[i].className.indexOf("newItems")!=-1){
  			//		组装数据
  				//}
  			//}
  			var trDoms = tbodyDom.getElementsByClassName("newItems");
  			len=trDoms.length;
  			if(len==0){
  				alert("请追加一行数据");
  				return;
  			}
  			var arr = [];
  			for(var i=0;i<len;i++){
  	  			var username = trDoms[i].children[1].children[0].value;
  	  			var age = trDoms[i].children[2].children[0].value;
  	 	 		var email = trDoms[i].children[3].children[0].value;
  	  			var address = trDoms[i].children[4].children[0].value;
  	  			//var data = encodeURIcomponent(username) + "#" + encodeURIcomponent(age) + "#" + encodeURIcomponent(email) + "#" + encodeURIcomponent(address));
		  		var json={username:username,age:age,email:email,address:address};
  	  			//arr.push(data);
		  		arr.push(json);
  	  		}
  			//json --- javascript对象--主要是为了解决数据格式的问题，同时解析也很方便
  			return arr;
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