package membership;

import javax.servlet.ServletContext;

import common.JDBConnect;




public class WWWDAO extends JDBConnect {
	//생성자 메서드
	//매개변수가 4개인 부모의 생성자를 호출해 DB에 연결한다.
	public WWWDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	//application 내장객체만 매개변수로 전달 후 DB에 연결한다.
	public WWWDAO(ServletContext application) {
		super(application);
	}
/*
 사용자가 입력한 아이디,패스워드를 통해 회원테이블을 select후
 존재하는 정보인 경우 DTO객체에 그 정보를 담아 반환한다.
 */
	public WWWDTO getWWWDTO(String uid, String upass) {
		//로그인을 위한 쿼리문 실행 후 회원정보저장위해 생성
		WWWDTO dto = new WWWDTO();
		//로그인 위해 인파라미터가 있는 동적 쿼리문 작성
		String query = "SELECT * FROM registeration WHERE user_id=? AND user_pass=?";
		
		try {
			//쿼리문 실행 위한 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//select 쿼리문을 실행 후 ResultSet으로 반환
			rs = psmt.executeQuery();
			
			//반환된 ResultSet객체를 통해 회원정보가 있는지 확인
			if(rs.next()) {
				//정보가 있다면 DTO객체에 회원정보를 저장
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setName(rs.getString(3));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		//호출한 지점으로 DTO객체를 반환
		return dto;
	}
}
