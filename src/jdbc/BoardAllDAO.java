package jdbc;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.NamingException;
import util.ConnectionPool;

public class BoardAllDAO {
	//	공지사항
		public ArrayList<BoardsDTO> notice_board(int no) throws NamingException, SQLException {
	      // 연결
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         String sql = "SELECT notice_no, notice_title, notice_content, regdate, view_cnt "
	        		 +"FROM notice_board "
	        		 +"order BY notice_no DESC ";
	         if(no != 0) {
	        	 sql +="LIMIT 10";
	         }
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
								 rs.getString("view_cnt")
							 )
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
				System.out.println(sql);

				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				
				BoardsDTO boards = new BoardsDTO(
						rs.getString("notice_no"),
						rs.getString("notice_title"),
						rs.getString("notice_content"),
						rs.getString("regdate"),
						rs.getString("view_cnt")
						);			
				return boards;
				
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		public ArrayList<BoardsDTO> ask_board() throws NamingException, SQLException {
			// 연결
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "SELECT ask_no, ask_title, ask_content "
						+"FROM ask_board "
						+"order BY ask_no DESC "
						+"LIMIT 10";
				
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				ArrayList<BoardsDTO> boards = new ArrayList<BoardsDTO>();
				
				while(rs.next()){
					boards.add( new BoardsDTO(
							rs.getString("ask_no"),
							rs.getString("ask_title"),
							rs.getString("ask_content")
							)
							); 
				}
				
				return boards;
				
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
}
