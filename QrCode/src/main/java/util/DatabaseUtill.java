package util;

import java.sql.*;

public class DatabaseUtill {
		// �ٸ� Ŭ�������� ��� �� �� �ְ� static����
	public static Connection getConnection() {// ������ ��������
		try {
			// db URL�� ID PW�� �����ͼ� �α���
			String dbURL = "jdbc:mysql://localhost:3306/TUTORIAL";
			String dbID = "root";
			String dbPW = "root";
			Class.forName("com.mysql.jdbc.Driver"); //�̷� Ŭ������ ã�� ����
			
			return DriverManager.getConnection(dbURL, dbID, dbPW);
			
		} // ���� ĳġ
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
