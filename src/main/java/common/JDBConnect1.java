package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;


//DB연결 위한 클래스 생성
public class JDBConnect1 {
	//멤버변수 : 연결, 쿼리문 실행 및 전송, 결과셋 반환
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	
	//기본생성자 : 매개변수가 없는 생성자
	public JDBConnect1() {
		try {
			//오라클 드라이버 로드
			Class.forName("org.mariadb.jdbc.Driver");
			//커넥션URL, 계정 아이디와 패스워드 기술
			String url = "jdbc:mariadb://localhost:3306/www_db";
			String id = "www";
			String pwd = "1234";
			//mysql DB 연결
			con = DriverManager.getConnection(url, id, pwd);
			//연결 성공 시 콘솔에서 로그 확인
			System.out.println("DB 연결 성공(기본 생성자)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		new JDBConnect1();
	}
	
	//인수생성자1 : DB 연결에 필요한 모든 정보를 매개변수로 받음
	public JDBConnect1(String driver, String url, String id, String pwd) {
		try {
			//오라클 드라이버 로드
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			//연결 성공 시 콘솔에서 로그 확인
			System.out.println("DB 연결 성공(인수 생성자 1)");		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	//인수생성자2 : application내장객체 사용 위한 매개변수 선언
	public JDBConnect1(ServletContext application) {
		/*
		JSP의 내장객체는 메서드에서는 즉시 사용할 수 없고
		반드시 매개변수로 참조값을 받은 후 사용해야 한다.
		*/
		try {
			//web.xml에 정의된 컨텍스트 초기화 파라미터를 직접 얻어와
			//드라이버로드 및 연결을 진행한다.
			String driver = application.getInitParameter("MySQLDriver1");
			Class.forName(driver);
			
			String url = application.getInitParameter("MySQLURL");
			String id = application.getInitParameter("MySQLId");
			String pwd = application.getInitParameter("MySQLPwd");
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수생성자 2)");	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	//자원 해제를 위한 메서드
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
