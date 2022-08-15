package user;

//import java.sql.Connection; 
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.*;

import util.DatabaseUtill;



// DAO ���������� �����ͺ��̽��� �����Ǽ� DB�� ���� ����ϰų� �������� ��
// �����ͺ��̽� ������ ������Ʈ
public class userDAO {
	
	//�Է��� ������ DB���� ����(ȸ������)
	public int join(userDTO user) {
		String SQL = "INSERT INTO COSTOM VALUES(?, ?, ?, ?, ?, ?, ?, false, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL���� �ҷ��´�.
			pstmt.setString(1, user.getName());	// userID�� SQL���� ����
			pstmt.setString(2, user.getUserID());
			pstmt.setString(3, user.getPw());
			pstmt.setString(4, user.getPh1());
			pstmt.setString(5, user.getPh2());
			pstmt.setString(6, user.getPh3());
			pstmt.setInt(7, user.getChecknum());
			pstmt.setString(8, user.getAddr());
			pstmt.setInt(9, user.getUc());
			
			return pstmt.executeUpdate(); // delete�� insert�� update�� ó�� ȸ������ ������ 1��ȯ
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // ���� �ڿ� ���� 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}

		return -5; // ȸ������ ����
	}
	
	// ���̵�� �н����尡 ������ �α���
	public int login(String userID, String pw) { 
		String SQL = "SELECT pw FROM COSTOM WHERE userID= ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL���� �ҷ��´�.
			pstmt.setString(1, userID);	// userID�� SQL���� ����
			rs = pstmt.executeQuery(); // ���� �� rs�� ����
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {
					return 1; // �α��� ����
				}
				else {
					return 0; // ��й�ȣ Ʋ��
				}
			}
			return -1; // ���̵� ����
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // ���� �ڿ� ���� 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return -2; // ������ ���̽� ����
	}
	
	// id�� ���� ������ �������� ��ȣ�� ã��
	public String SMScheck(String userID) {
	      String SQL="SELECT checknum from COSTOM WHERE userID=?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = DatabaseUtill.getConnection();
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, userID);
	         rs = pstmt.executeQuery();
	          if(rs.next()) {
	                  return rs.getString(1);  
	            }
	          }catch(Exception e) {
	        	  e.printStackTrace();
	        	  } finally { // ���� �ڿ� ���� 
	      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
	    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
	    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
	    		}
	      return null;
	      }
	
	// id�� �̿��� name�� ã��
	public String name(String userID) {
	      String SQL="SELECT name from COSTOM WHERE userID=?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = DatabaseUtill.getConnection();
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, userID);
	         rs = pstmt.executeQuery();
	          if(rs.next()) {
	                  return rs.getString(1);  
	            }
	          }catch(Exception e) {
	        	  e.printStackTrace();
	        	  } finally { // ���� �ڿ� ���� 
		      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    		}
	      return null;
	      }	
	
	// id�� �̿��� userID�� ã��
		public String userID(String userID) {
		      String SQL="SELECT userID from COSTOM WHERE userID=?";
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      try {
		         conn = DatabaseUtill.getConnection();
		         pstmt = conn.prepareStatement(SQL);
		         pstmt.setString(1, userID);
		         rs = pstmt.executeQuery();
		          if(rs.next()) {
		                  return rs.getString(1);  
		            }
		          }catch(Exception e) {
		        	  e.printStackTrace();
		        	  } finally { // ���� �ڿ� ���� 
			      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    		}
		      return null;
		      }	
	
	// id�� �̿��� pw�� ã��
	public String pw(String userID) {
	      String SQL="SELECT pw from COSTOM WHERE userID=?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = DatabaseUtill.getConnection();
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, userID);
	         rs = pstmt.executeQuery();
	          if(rs.next()) {
	                  return rs.getString(1);  
	            }
	          }catch(Exception e) {
	        	  e.printStackTrace();
	        	  } finally { // ���� �ڿ� ���� 
		      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    		}
	      return null;
	      }	
	
	// id�� �̿��� addr�� ã��
		public String addr(String userID) {
		      String SQL="SELECT addr from COSTOM WHERE userID=?";
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      try {
		         conn = DatabaseUtill.getConnection();
		         pstmt = conn.prepareStatement(SQL);
		         pstmt.setString(1, userID);
		         rs = pstmt.executeQuery();
		          if(rs.next()) {
		                  return rs.getString(1);  
		            }
		          }catch(Exception e) {
		        	  e.printStackTrace();
		        	  } finally { // ���� �ڿ� ���� 
			      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    		}
		      return null;
		      }	
	
	// id�� �̿��� ph�� ã��
	public String search1(String userID) {
	      String SQL="SELECT ph1 from COSTOM WHERE userID=?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = DatabaseUtill.getConnection();
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, userID);
	         rs = pstmt.executeQuery();
	          if(rs.next()) {
	                  return rs.getString(1);  
	            }
	          }catch(Exception e) {
	        	  e.printStackTrace();
	        	  } finally { // ���� �ڿ� ���� 
		      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    		}
	      return null;
	      }
	
	public String search2(String userID) {
	      String SQL="SELECT ph2 from COSTOM WHERE userID=?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = DatabaseUtill.getConnection();
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, userID);
	         rs = pstmt.executeQuery();
	          if(rs.next()) {
	                  return rs.getString(1);  
	            }
	          }catch(Exception e) {
	        	  e.printStackTrace();
	        	  } finally { // ���� �ڿ� ���� 
		      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    		}
	      return null;
	      }
	
	public String search3(String userID) {
	      String SQL="SELECT ph3 from COSTOM WHERE userID=?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = DatabaseUtill.getConnection();
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, userID);
	         rs = pstmt.executeQuery();
	          if(rs.next()) {
	                  return rs.getString(1);  
	            }
	          }catch(Exception e) {
	        	  e.printStackTrace();
	        	  } finally { // ���� �ڿ� ���� 
		      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    		}
	      return null;
	      }
	
	// ȸ�� ����
		public int update(String userID, String pw, String addr, String ph1, String ph2, String ph3) { 
			String SQL = "UPDATE COSTOM SET pw=?, addr=?, ph1=?, ph2=?, ph3=? where userID=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DatabaseUtill.getConnection();
				pstmt = conn.prepareStatement(SQL); // SQL���� �ҷ��´�.
				pstmt.setString(1, pw);
				pstmt.setString(2, addr);
				pstmt.setString(3, ph1);
				pstmt.setString(4, ph2);
				pstmt.setString(5, ph3);
				pstmt.setString(6, userID);
				
				return pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally { // ���� �ڿ� ���� 
				try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
				try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
				try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			}
			return -1;
		}
		
		public boolean deleteUser(String userID) {

			boolean flag = false;

			String sql = "DELETE from costom where userID=?";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DatabaseUtill.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userID);

				int i = pstmt.executeUpdate();

				if(i == 1) {
					flag = true;
				} else {
					flag = false;
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
				try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
				try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			}
			return flag;
		}
	
	
	
	// �������� Ȯ��
	public String getchecknum(String userID) { 
		String SQL = "SELECT checknum FROM COSTOM WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL����y �ҷ��´�.
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // ���� �ڿ� ���� 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return null; // ���̵�� �̸��� ã�� �� ����
	}
	
	// ���� ���� �ý��� ����
	public boolean setchecked(String userID) { 
		String SQL = "UPDATE COSTOM SET checked = true Where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL���� �ҷ��´�.
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true;	// ���� �ǵ� ���ѹ� ���� ����
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // ���� �ڿ� ���� 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return false; // �̸��� ���� �ȵ�
	}


	// ���� ������ �Ϸ�Ǿ����� Ȯ�� 
	public boolean getchecked(String id) { 
		String SQL = "SELECT checked FROM COSTOM WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL���� �ҷ��´�.
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getBoolean(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // ���� �ڿ� ���� 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return false; // �̸��� ���� �ȵ�
	}	
	

		
	
/*	
	// ���̵�� �̸��� ã��
	public String getUserEmail(String id) { 
		String SQL = "SELECT addr FROM user WHERE id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL����y �ҷ��´�.
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // ���� �ڿ� ���� 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return null; // ���̵�� �̸��� ã�� �� ����
	}
	
	
	// �̸��� ������ �Ϸ�Ǿ����� Ȯ��
	public boolean getUserEmailChecked(String id) { 
		String SQL = "SELECT userEmailChecked FROM user WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL���� �ҷ��´�.
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getBoolean(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // ���� �ڿ� ���� 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return false; // �̸��� ���� �ȵ�
	}
	
	// �̸��� ���� �ý��� ����
	public boolean setUserEmailCheck(String id) { 
		String SQL = "UPDATE user SET userEmailChecked = true Where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL���� �ҷ��´�.
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			return true;	// ���� �ǵ� ���ѹ� ���� ����
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // ���� �ڿ� ���� 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return false; // �̸��� ���� �ȵ�
	}
*/
}
	
