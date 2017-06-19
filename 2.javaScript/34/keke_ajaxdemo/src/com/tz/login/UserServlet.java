package com.tz.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyleContext.SmallAttributeSet;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;

public class UserServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;utf-8");
		PrintWriter out = response.getWriter();
		String dataArr = request.getParameter("data");
		List<HashMap<String,Object>> maps = null;
		try {
			 maps = (List<HashMap<String, Object>>) JSONUtil.deserialize(dataArr);
			for (HashMap<String, Object> map : maps) {
				System.out.println(map.get("username"));
				System.out.println(map.get("age"));
				System.out.println(map.get("email"));
				System.out.println(map.get("address"));
				System.out.println("================");
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String smapString  = "";
		try {
			smapString = JSONUtil.serialize(maps);
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(smapString);
		out.flush();
		out.close();
		//String he = request.getParameter("hello");
		//System.out.println("前台传过来的参数是:"+data);
		//java中 同样有jsonString转化成java对象 百度java json解析
	}
	
	

}
