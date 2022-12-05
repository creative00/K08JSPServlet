package utils;

import javax.servlet.jsp.JspWriter;
//메서드 생성 시 static통해 정적메서드로 정의되었으므로
//객체 생성 없이 클래스명으로 즉시 메서드를 호출할 수 있다.
public class JSFunction {
	public static void alertLocation(String msg, String url, JspWriter out) {
//자바클래스에서는 JSP의 내장객체를 사용할 수 없으므로
		//반드시 매개변수로 전달받아 사용해야한다.
		//여기서는 화면에 문자열을 출력하기 위해 OUT내장객체를
		//JSP WRITER타입으로 받은 후 사용하고 있다.
	
		try {
			//Javascript를 하나의 문자열로 정의한다.
			String script = ""
						+ "<script>"
						+ "  alert('" + msg + "');"
						+ "  location.href='" + url + "';"
						+ "</script>";
			//해당 문자열을 웹브라우저에 출력한다.
			out.println(script);
		}
		catch (Exception e) {}
	}
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script =""
						+ "<script>"
						+ "  alert('" + msg + "');"
						+ "  history.back();"
						+ "</script>";
			out.println(script);
		}
		catch (Exception e) {}
	}
}
