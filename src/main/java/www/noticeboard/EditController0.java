package www.noticeboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/WWW/01Login/www.noticeboard/edit.do")
public class EditController0 extends HttpServlet {

	//수정페이지로 진입해 기존 내용을 수정폼에 설정한다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//수정페이지로 전달된 일련번호를 통해 게시물을 인출한다.
		String idx = req.getParameter("idx");
		NoticeBoardDAO dao = new NoticeBoardDAO();
		NoticeBoardDTO dto = dao.selectView(idx);
		//인출된 내용은 request영역에 저장한 후 View로 포워드한다.
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/WWW/01Login/NoticeEdit.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		
		ServletContext application = this.getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		//파일업로드 처리. 객체 생성과 동시에 업로드는 완료된다.
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		
		//파일을 제외한 나머지 폼값을 얻어온다.
		
		if (mr == null) {
			JSFunction.alertBack(resp, "첨부 파일이 제한 용량을 초과합니다.");
			return;
		}
		//히든반스에 저장된 내용(게시물 수정 및 파일 수정이 필요함)
		String idx = mr.getParameter("idx");
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		//사용자가 직접 입력한 값
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		/*
		패스워드의 경우 인증 완료 시 session영역에 저장해 둔 것을 얻어온다.
		update쿼리 실행 시 where에 조건으루 추가됨.
		즉, 검증이 완료된 사용자만 게시물을 수정할 수 있음. 
		 */
		HttpSession session = req.getSession();
		String pass = (String)session.getAttribute("pass");
		
		//DTO에 데이터 저장
		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPass(pass);
		
		//수정페이지에서 첨부한 파일이 있는 경우 파일명을 변경한다.
		String fileName = mr.getFilesystemName("ofile");
		if (fileName != null) {
			//날짜와 시간으로 파일명을 생성 후 확장자와 합쳐서 서버에 저장될 파일명을 만듬
			//저장될 파일명을 만듬
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;
			
			//파일객체 생성후 파일명을 변경
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			//업로드된 파일명을 DTO에 저장
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
			//새 파일이 등록되었으므로 기존 파일은 삭제
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		}
		else {
			//새로운 파일을 등록하지 않은 경우 기존 파일명을DTO에 저장
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		//DB 연결 및 업데이트 처리
		NoticeBoardDAO dao = new NoticeBoardDAO();
		int result = dao.updatePost(dto);
		dao.close();
		
	
		if ( result == 1) {
			//수정이 완료되면 session영역에 저장된 패스워드는 삭제한다.
			session.removeAttribute("pass");
			//내용보기 화면으로 이동해 수정된 내용을 확인한다.
			resp.sendRedirect("../www.noticeboard/view.do?idx=" + idx);
		}
		else {
			JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.",
					"../www.noticeboard/view.do?idx=" + idx);
		}
	}	
}
