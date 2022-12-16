package servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import membership.MemberDAO;

public class MemberAuth extends HttpServlet {
	MemberDAO dao;
	
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
	
		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleURL");
		String oId = application.getInitParameter("OracleId");
		String oPass = application.getInitParameter("OraclePwd");
	
		dao = new MemberDAO(driver, connectUrl, oId, oPass);
	}
}
