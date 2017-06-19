/**
 * tzdesk系统平台
 * keke_ajaxdemo
 * com.tz.login
 * LoginServlet.java
 * 创建人:xuchengfei 
 * 时间：2016年1月24日-下午10:36:21 
 * 2016潭州教育公司-版权所有
 */
package com.tz.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * LoginServlet
 * 创建人:xuchengfei 
 * 时间：2016年1月24日-下午10:36:21 
 * @version 1.0.0
 * 
 */
public class LoginServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");//处理参数乱码的问题
		resp.setCharacterEncoding("UTF-8");//输出给信息如果是中文的编码
		System.out.println(req.getRequestURL().toString());
		System.out.println(req.getMethod());
		String uname = req.getParameter("account");
		String age = req.getParameter("age");
		String password = req.getParameter("password");
		
		System.out.println("==============="+age);
		
		PrintWriter out =   resp.getWriter();
		if(uname.equals("keke") && password.equals("123456")){
			//resp.sendRedirect("success.jsp");
			out.print("success");
		}else{
			//resp.sendRedirect("fail.jsp");
			out.print("fail");
		}
	}
	
	
	

}
