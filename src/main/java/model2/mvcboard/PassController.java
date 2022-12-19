package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 mvcboard/pass.do?mode=delete&idx=118
		 요청명은 이와 같으므로 파라미터를 받아오는 작업을 해야한다.
		 서블릿에서는 2가지 방법으로 받을 수 있는데
		 방법1: request내장객체를 이용한다.=> req.getParameter(파라미터명)
		 방법2: view(JSP파일)에서 EL의 param내장객체를 사용한다.
		  	=> ${param.파라미터명}
		 */
		//파라미터를 받은 후 request영역에 저장하고 View로 포워드한다.
		
		req.setAttribute("mode", req.getParameter("mode"));
		req.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(req, resp);
	}
	
	
	//비밀번호 검증 페이지에서 전송한 경우 수정, 삭제처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//입력한 비밀번호와 hidden박스에서 전송된 파라미터 받기
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		//DAO객체 생성 및 패스워드 검증
		MVCBoardDAO dao = new MVCBoardDAO();
		boolean confirmed = dao.confirmPassword(pass, idx);
		dao.close();
		
		//패스워드 검증에 성공한 경우에는 ...
		if (confirmed) {
			if (mode.equals("edit")) {
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass);
				resp.sendRedirect("../mvcboard/edit.do?idx=" + idx);			
			}
			else if (mode.equals("delete")){
				//게시물을 삭제하고 첨부파일이 있는 겨우 같이 삭제한다.
				dao = new MVCBoardDAO();
				//기존 게시물의 내용을 읽어온다.
				MVCBoardDTO dto = dao.selectView(idx);
				//게시물을 삭제한다.
				int result = dao.deletePost(idx);
				dao.close();
				//게시물 삭제에 성공했다면..
				if (result == 1) {
					//파일도 삭제한다.
					String saveFileName = dto.getSfile();
					FileUtil.deleteFile(req, "/Uploads", saveFileName);
				}
				//삭제가 완료되면 리스트로 이동한다.
				JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvcboard/list.do");
			}	
		}
		else {
			//검증에 실패한 경우 뒤로 돌아간다.
			JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
		}
	}
}
