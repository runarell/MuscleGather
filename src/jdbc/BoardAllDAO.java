package jdbc;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.NamingException;
import util.ConnectionPool;

public class BoardAllDAO {
	// 리스트 숫자 
	public int boardsCont(String tableName) throws NamingException, SQLException {
		// 연결
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT COUNT(*) cont "
					+"FROM ";
			sql += tableName;
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			
			int no =Integer.parseInt( rs.getString("cont") );
			return no;	
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
	
	//	공지사항
		
		public ArrayList<BoardsDTO> noticeList(String listNum, String stratNum) throws NamingException, SQLException {
			// 연결
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "SELECT * "
						+"FROM notice_board "
						+"order BY notice_no DESC "
						+"LIMIT "+stratNum+", "+listNum;
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				ArrayList<BoardsDTO> boards = new ArrayList<BoardsDTO>();
				
				while(rs.next()){
					boards.add( new BoardsDTO(
							rs.getString("notice_no"),
							rs.getString("notice_title"),
							rs.getString("notice_content"),
							rs.getString("regdate"),
							rs.getString("view_cnt"),
							rs.getString("notice_images") )
							); 
				}
				
				return boards;
				
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		public BoardsDTO notice(String no) throws NamingException, SQLException {
			// 연결
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "SELECT * "
						+"FROM notice_board "
						+"WHERE notice_no = ";
				sql+=no;

				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				
				BoardsDTO boards = new BoardsDTO(
						rs.getString("notice_no"),
						rs.getString("notice_title"),
						rs.getString("notice_content"),
						rs.getString("regdate"),
						rs.getString("view_cnt"),
						rs.getString("notice_images")
						);			
				return boards;
				
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		// 노티스보드 업로드
		public boolean notice_upload(BoardsDTO bo) throws NamingException, SQLException {
			int result = 0;
			// 연결
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "UPDATE musclegather.notice_board"
						+" SET" 
						+" notice_title		= ?,"
						+" notice_content	= ?,"
						+" notice_images	= ?"
						+" WHERE notice_no	= ?";

				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, bo.getBoards_title());
					pstmt.setString(2, bo.getBoards_content());
					pstmt.setString(3, bo.getBoards_images());
					pstmt.setString(4, bo.getBoards_no());
				result = pstmt.executeUpdate();
				
				if(result == 1) {					
					return true;
				}else {
					return false;					
				}
				
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		// 노티스보드 삭제
		public boolean notice_delet(String no) throws NamingException, SQLException {
			int result = 0;
			// 연결
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "DELETE FROM notice_board WHERE notice_no=?";
				
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, no);
				result = pstmt.executeUpdate();
				
				if(result == 1) {					
					return true;
				}else {
					return false;					
				}
				
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		
		
		public ArrayList<BoardsDTO> askList(String listNum, String stratNum) throws NamingException, SQLException {
			// 연결
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "SELECT ask_no, ask_title, ask_content "
						+"FROM ask_board "
						+"order BY ask_no DESC "
						+"LIMIT "+stratNum+", "+listNum;
				
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				ArrayList<BoardsDTO> boards = new ArrayList<BoardsDTO>();
				
				while(rs.next()){
					boards.add( new BoardsDTO(
							rs.getString("ask_no"),
							rs.getString("ask_title"),
							rs.getString("ask_content")
					)); 
				}
				
				return boards;
				
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
}
