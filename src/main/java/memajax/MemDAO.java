package memajax;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemDAO() {
		try {
			String dbURL = "";
			String dbID = "ILL";
			String dbPassward = "ILL";
			Class.forName("com.mysql.jdbc.Driver");
			conn =  DriverManager.getConnection(dbURL, dbID, dbPassward);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String msID, String msPassword) {
		String SQL = "SELECT MS_PASSWORD FROM MS_MAININFO WHERE MS_ID = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, msID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(msPassword))
					return 1; //로그인 성공 
				else 
					return 0; //비번 틀림
			}
			return -1;//아이디 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	public int register(Mem msID) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "";
		try {
			pstmt = conn.prepareStatement(SQL);
			
		} catch{
			
		}
		
	}
}	
