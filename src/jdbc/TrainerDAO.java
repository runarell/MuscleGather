package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class TrainerDAO {
		//	트레이너 리스트
		public ArrayList<TrainerDTO> TrainerList(String no) throws NamingException, SQLException {
	      // 연결
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         String sql = "SELECT U.user_no, U.user_name, U.user_email, "
	         			+ "T.user_no, T.trainer_title "
	         			+ "from user U " 
	         			+ "INNER JOIN trainer T " 
	         			+ "ON U.user_no = T.user_no " 
	         			+ "order BY U.user_no DESC ";
	         if(!no.equals("0")) sql += "LIMIT "+no;
	         
	         conn = ConnectionPool.get();
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
	         ArrayList<TrainerDTO> data = new ArrayList<TrainerDTO>();
	         
	         while(rs.next()){
	        	 data.add( new TrainerDTO(
					 rs.getString("user_no"),
					 rs.getString("user_name"),
					 rs.getString("user_email"),
					 rs.getString("trainer_title") )
	        	); 
	         }
	         
	         return data;
	         
	      }finally {
	         if(rs != null) rs.close();
	         if(pstmt != null) pstmt.close();
	         if(conn != null) conn.close();
	      }
		}
		
		//=====================================================================
}
