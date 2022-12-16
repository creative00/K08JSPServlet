package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import common.DBConnPool;

public class MVCBoardDAO extends DBConnPool {
	public MVCBoardDAO() {
		super();
	}
	
	//게시물의 갯수를 카운트
	public int selectCount(Map<String,Object> map) {
	
		int totalCount = 0; 
		//만약 검색어가 있다면 조건에 맞는 게시물 카운트해야하므로
		//조건부(where)로 쿼리문을 추가한다.
		String query = "SELECT COUNT(*) FROM mvcboard";
		if(map.get("searchWord")!= null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
			System.out.println("카운트="+ totalCount);
		}
		catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//조건에 맞는 게시물을 목록에 출력하기 위한 쿼리문을 실행한다.
	public List<MVCBoardDTO> selectListPage(Map<String,Object> map) {
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
	
		String query = " "
					 + " SELECT * FROM( "
					 + "	SELECT Tb.*, ROWNUM rNum FROM ( "
					 + "		SELECT * FROM mvcboard ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")  
					+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		
		query += "			ORDER BY idx DESC "
				+ " 	) tb "
				+ " ) "
				+ " WHERE rNum BETWEEN ? AND ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				//하나의 레코드를 저장할 수 있는 DTO객체를 생성
				MVCBoardDTO dto = new MVCBoardDTO();
				
				//setter()를 이용해 각 컬럼의 값을 저장
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				
				System.out.println("idx="+ rs.getString(1));
				
			
				board.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	
	//글쓰기 처리 시 첨부 파일까지 함께 입력한다.
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;
		try {
			/*
			 ofile : 원본파일명
			 sfile : 서버에 저장된 파일명
			 pass :  비회원제 게시판이므로 수정, 삭제 위한
			 		인증에 사용되는 비밀번호
			 */
			String query = "INSERT INTO mvcboard ( "
						+ " idx, name, title, content, ofile, sfile, pass) "
						+ " VALUES ( "
						+ " seq_board_num.NEXTVAL,?,?,?,?,?,?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;		
	}
	//예제 14-16] /model2/mvcboard/MVCBoardDAO.java 메서드 추가
	//금요일 수업끝난 후 예습용으로 입력
	public MVCBoardDTO selectView(String idx) {
		MVCBoardDTO dto = new MVCBoardDTO();
		String query = "SELECT * FROM mvcboard WHERE idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateVisitCount(String idx) {
		String query = "UPDATE mvcboard SET "
					+ " visitcount=visitcount+1 "
					+ " WHERE idx=?";
				
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		}
		catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	
}
