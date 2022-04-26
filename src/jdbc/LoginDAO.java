package jdbc;

import java.sql.*;
import javax.naming.*;
import util.ConnectionPool;

public class LoginDAO {

	// gymlist.jsp
	public UserDTO login() throws NamingException, SQLException {
      // 연결
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try {
         String sql = "SELECT user_no, user_pw, user_email, user_admin "
         		+ "FROM user "
         		+ "WHERE user_admin = '1'";
         
         conn = ConnectionPool.get();
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         rs.next();
         
         
         UserDTO boards = new UserDTO(
        	rs.getString("user_no"),
        	rs.getString("user_pw"),
        	rs.getString("user_email"),
        	rs.getString("user_admin")        	
        );
         return boards;
         
      }finally {
         if(rs != null) rs.close();
         if(pstmt != null) pstmt.close();
         if(conn != null) conn.close();
      }
	}
}