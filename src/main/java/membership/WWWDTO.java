package membership;
/*
DTO(Data Transfer Object)
: JSP와 Java파일 간에 데이터를 전달하기 위한 객체로
자바빈(JavaBean) 규약에 의해 제작한다.교재 p.114 참조
 */
public class WWWDTO {
	//멤버변수 : www_db 테이블의 컬럼과 동일하게 설정
		private String user_id;
		private String user_pass;
		private String name;
		
		
		//생성자의 경우 꼭 필요한 경우 아니면 생성할 필요 X
		//생성자를 코딩하지 않는 경우, 컴파일러에 의해
		//디폴트생성자(기본생성자)가 자동으로 추가되기 때문

		//정보은닉된 멤버변수에 접근을 위해 public으로 정의된
		//getter, setter를 정의한다.
		
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}