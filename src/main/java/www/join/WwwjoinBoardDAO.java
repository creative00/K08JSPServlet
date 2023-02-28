package www.join;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import common.DBConnPool;
import common.DBConnPool1;
import common.JDBConnect1;

public class WwwjoinBoardDAO extends DBConnPool1 {
	public WwwjoinBoardDAO() {
		super();

}

	public int join(String email_id, String email_domain, String user_id, String user_pass, String pass2, String name, String gender, String mobile1, String mobile2, String mobile3) {
		String query = "INSERT INTO REGISTERATION VALUES (?,?,?,?,?,?,?,?,?,?)";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			PreparedStatement pstmt = con.prepareStatement(query);

			// 쿼리문의 ?안에 각각의 데이터를 넣어준다.
			
			pstmt.setString(1, email_id);
			pstmt.setString(2, email_domain);
					
			pstmt.setString(3, user_id);
			pstmt.setString(4, user_pass);
			pstmt.setString(5, pass2);
			pstmt.setString(6, name);
			pstmt.setString(7, gender);
			pstmt.setString(8, mobile1);
			pstmt.setString(9, mobile2);
			pstmt.setString(10, mobile3);

			// 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	/**
	 * 아이디 중복체크를 한다.
	 * @param id 아이디
	 * @return x : 아이디 중복여부 확인값
	 */
//	public boolean duplicateIdCheck(String user_id)
//	{
//		Connection conn = null;
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		boolean x= false;
//		
//		try {
//			// 쿼리
//			StringBuffer query = new StringBuffer();
//			query.append("Select user_id from registeration where user_id;");
//						
//			conn = DBConnPool1.getConnection();
//			pstm = conn.prepareStatement(query.toString());
//			pstm.setString(1, user_id);
//			rs = pstm.executeQuery();
//			
//			if(rs.next()) x= true; //해당 아이디 존재
//			
//			return x;
//			
//		} catch (Exception sqle) {
//			throw new RuntimeException(sqle.getMessage());
//		} finally {
//			try{
//				if ( pstm != null ){ pstm.close(); pstm=null; }
//				if ( conn != null ){ conn.close(); conn=null;	}
//			}catch(Exception e){
//				throw new RuntimeException(e.getMessage());
//			}
//		}
//	} // end duplicateIdCheck()
	
//내가 만든 쿼리문	
	public boolean duplicateIdCheck(String user_id) {
		boolean x = true;
		try {
			String sql = "Select user_id from registeration where user_id;";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			rs.next();
			if (rs.getInt(1) == 0) {
				x = false;
			}
		}
		catch (Exception e) {
			x = false;
			e.printStackTrace();
		}
		return x;
	}
}
