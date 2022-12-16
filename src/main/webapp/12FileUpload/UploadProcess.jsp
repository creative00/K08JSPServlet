<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파일업로드를 위한 디렉토리의 물리적 경로(절대경로)를 얻어온다.
//물리적 경로가 필요한 이유는 운영체제에 따라 경로를 표현하는 방식이
//다르기 때문이다. 
String saveDirectory = application.getRealPath("/Uploads");
//업로드할 파일의 최대용량제한(1mb로 지정함)
int maxPostSize = 1024 * 1000;
//인코딩 방식 지정
String encoding = "UTF-8";

try {
	/*
	앞에서 준비한 3개의 인수과 request내장객체까지를 이용해
	MultipartRequest객체를 생성한다. 해당 객체가 정상적으로 생성되면
	파일 업로드는 완료된다.
	*/
	MultipartRequest mr = new MultipartRequest(request, saveDirectory,
										maxPostSize, encoding);
	
	//mr객체를 통해 서버에 저장된 파일명을 가져온다.
	String fileName = mr.getFilesystemName("attachedFile"); 
	/* 파일명에서 확장자 앞의 .(닷)을 찾아 인덱스 확인 후 확장자를 잘라낸다. 
	확장자는 파일의 용도를 나타내는 부분이므로 중요하다*/
	//파일명에 .(닷)을 여러개 사용할 수 있으므로 끝에서부터 찾는다.
	String ext = fileName.substring(fileName.lastIndexOf("."));
	//현재날짜와 시간 및 밀리세컨즈까지 이용해 파일명으로 사용할 문자열을 만든다.
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	//확장자와 파일명을 합쳐 서버에 저장할 파일명을 만들어준다.
	String newFileName = now + ext;
	
	/*
	서버에 저장된 파일의 파일명을 새로운 파일명으로 변경해준다.
	여기서 사용된 seperator는 경로를 표시할 때 사용하는 구분 기호로
	윈도우의 경우 \(역슬러쉬), 리눅스의 경우 /(슬러쉬)를 자동으로
	부여해준다. File객체를 각각 생성 후 renameTo()메서드 통해 변경한다.
	*/
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);
	/*
	파일을 제외한 나머지 폼값을 받는다. 단 이때 request내장객체를 통해서가 
	아니라 mr객체를 통해 받아야 하므로 주의해야 한다.
	객체는 다르지만 폼값을 받기 위한 메서드명은 동일하다.
	*/
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	if (cateArray == null ) {
		cateBuf.append("선택 없음");
	}
	else {
		//체크한 항목의 갯수만큼 반복해 StringBuffer에 추가한다.
		for (String s : cateArray) {
			cateBuf.append(s + ", ");
		}
	}
	
	//DTO 생성 및 폼값 세팅
	MyfileDTO dto = new MyfileDTO();
	dto.setName(name);
	dto.setTitle(title);
	//입력 전 StringBuffer객체를 String으로 변환해야함 
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);
	
	//DAO 통해 데이터 베이스에 입력
	MyfileDAO dao = new MyfileDAO();
	dao.insertFile(dto);
	//자원반납(커넥션풀에 Connection객체를 반납한다)
	dao.close(); 
	//파일 업로드에 성공한 경우 파일목록으로 이동
	response.sendRedirect("FileList.jsp"); 
}
catch (Exception e) {
	/* 파일업로드에 실패한 경우에는 request영역에 에러메세지 저장 후
	업로드 폼으로 포워드한다. */
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일 업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp")
		.forward(request, response);
}
%>
