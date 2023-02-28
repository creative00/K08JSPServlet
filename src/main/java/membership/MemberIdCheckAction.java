package membership;

import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ActionForward;
import common.action;
import www.join.WwwjoinBoardDAO;

public class MemberIdCheckAction implements action {
	
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
	
	String id = Request.getParameter("id");
	WwwjoinBoardDAO dao = WwwjoinBoardDAO.getInstance();
	
	boolean result = dao.duplicateIdCheck(id);
	
	response.setContentType("text/html;charset=euc-kr");
	PrintWriter out = response.getWriter();
	
	if(result) out.println("0");//아이디중복
	else	out.println("1");
	
	out.close();
	return null;
	}
}


