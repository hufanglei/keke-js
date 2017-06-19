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
public class XiaoBinServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("xiaobin我进来么啊？");
		
	}
	
	
	

}
