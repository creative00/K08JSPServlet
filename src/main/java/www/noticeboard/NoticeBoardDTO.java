package www.noticeboard;

public class NoticeBoardDTO {
	private String idx; //비회원제이므로 작성자의 아이디 대신 이름 입력
	private String name;
	private String title;
	private String content;
	private java.sql.Date postdate;
	private String ofile; //원본파일명:클라이언트가 업로드한 원본파일명
	private String sfile; //저장된파일명:파일명 변경 후 서버에 저장될 파일명
	private int downcount; //자료실이므로 파일 다운로드한 횟수를 카운트함
	private String pass; //비회원제 게시판이라 회원인증 대신 비번 통한 인증 진행
	private int visitcount; 
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public int getDowncount() {
		return downcount;
	}
	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}	

}
