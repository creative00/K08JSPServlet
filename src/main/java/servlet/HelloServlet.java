package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/*
 서블릿 클래스를 만들기 위한 절차
 1.HttpServlet 클래스를 상속한다.
 2.클라이언트의 요청을 받아 처리하기 위한 doGet() 혹은 
 doPost()메서드를 오버라이딩한다.
 3.서블릿에 필수적인 패키지 임포트와 예외 처리는 자동완성된다. 
 4.request 내장 객체를 사용 시 매개 변수 req를 사용한다.
 response는 resp로 사용하면 된다.
 */
public class HelloServlet extends HttpServlet {
	//doget 메서드만 자동입력 시키면 아래 코딩 완성됨.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//리퀘스트 영역에 속성값ㅇ르 저장한다.
		req.setAttribute("message", "Hello Servlet..!!");
		//View에 해당하는 JSP페이지로 포워드한다.
		req.getRequestDispatcher("/13Servlet/HelloServlet.jsp")
			.forward(req, resp);
		/*
		 리퀘스트 영역은 포워드 된 페이지까지 공유되므로
		 서블릿에서 저장한 속성값은 JSP에서 사용할 수 있다. 
		 */
	}
}
