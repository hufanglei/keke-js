package com.tz.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;

public class addServlet extends HttpServlet {

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
		PrintWriter out = response.getWriter();
		//第一种方式
//		String username = request.getParameter("username");
//		String email = request.getParameter("email");
//		String age = request.getParameter("age");
//		String address = request.getParameter("address");
//		String text = request.getParameter("text");
//		System.out.println(username+"==="+email+"==="+age + "=="+ address+"==="+text);
		//第二种方式
		String data = request.getParameter("data");
		try {
			HashMap<String, Object> map =  (HashMap<String, Object>) JSONUtil.deserialize(data);
			System.out.println(map.get("username"));
			System.out.println(map.get("email"));
			System.out.println(map.get("age"));
			System.out.println(map.get("address"));
			System.out.println(map.get("text"));
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print("success");
		out.flush();
		out.close();
	}

}
