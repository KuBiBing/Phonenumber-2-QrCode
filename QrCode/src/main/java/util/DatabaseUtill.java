package util;

import java.sql.*;

public class DatabaseUtill {
		// 다른 클래스에도 사용 할 수 있게 static정의
	public static Connection getConnection() {// 연결을 가져오기
		try {
			// db URL과 ID PW를 가져와서 로그인
			String dbURL = "jdbc:mysql://localhost:3306/TUTORIAL";
			String dbID = "root";
			String dbPW = "root";
			Class.forName("com.mysql.jdbc.Driver"); //이런 클래스를 찾아 정의
			
			return DriverManager.getConnection(dbURL, dbID, dbPW);
			
		} // 오류 캐치
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
