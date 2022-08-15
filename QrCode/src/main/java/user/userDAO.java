package user;

//import java.sql.Connection; 
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.*;

import util.DatabaseUtill;



// DAO 실질적으로 데이터베이스와 연동되서 DB에 값을 기록하거나 가져오는 것
// 데이터베이스 엑세스 오브젝트
public class userDAO {
	
	//입력한 정보를 DB값에 저장(회원가입)
	public int join(userDTO user) {
		String SQL = "INSERT INTO COSTOM VALUES(?, ?, ?, ?, ?, ?, ?, false, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL문을 불러온다.
			pstmt.setString(1, user.getName());	// userID를 SQL문에 넣음
			pstmt.setString(2, user.getUserID());
			pstmt.setString(3, user.getPw());
			pstmt.setString(4, user.getPh1());
			pstmt.setString(5, user.getPh2());
			pstmt.setString(6, user.getPh3());
			pstmt.setInt(7, user.getChecknum());
			pstmt.setString(8, user.getAddr());
			pstmt.setInt(9, user.getUc());
			
			return pstmt.executeUpdate(); // delete나 insert는 update로 처리 회원가입 성공시 1반환
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // 변수 자원 해제 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}

		return -5; // 회원가입 실패
	}
	
	// 아이디와 패스워드가 맞으면 로그인
	public int login(String userID, String pw) { 
		String SQL = "SELECT pw FROM COSTOM WHERE userID= ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL문을 불러온다.
			pstmt.setString(1, userID);	// userID를 SQL문에 넣음
			rs = pstmt.executeQuery(); // 쿼리 문 rs에 저장
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {
					return 1; // 로그인 성공
				}
				else {
					return 0; // 비밀번호 틀림
				}
			}
			return -1; // 아이디 없음
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // 변수 자원 해제 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return -2; // 데이터 베이스 오류
	}
	
	// id를 통해 유저의 문자인증 번호를 찾기
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
	        	  } finally { // 변수 자원 해제 
	      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
	    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
	    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
	    		}
	      return null;
	      }
	
	// id를 이용해 name를 찾기
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
	        	  } finally { // 변수 자원 해제 
		      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    		}
	      return null;
	      }	
	
	// id를 이용해 userID를 찾기
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
		        	  } finally { // 변수 자원 해제 
			      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    		}
		      return null;
		      }	
	
	// id를 이용해 pw를 찾기
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
	        	  } finally { // 변수 자원 해제 
		      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    		}
	      return null;
	      }	
	
	// id를 이용해 addr를 찾기
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
		        	  } finally { // 변수 자원 해제 
			      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			    		}
		      return null;
		      }	
	
	// id를 이용해 ph를 찾기
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
	        	  } finally { // 변수 자원 해제 
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
	        	  } finally { // 변수 자원 해제 
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
	        	  } finally { // 변수 자원 해제 
		      			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		    		}
	      return null;
	      }
	
	// 회원 수정
		public int update(String userID, String pw, String addr, String ph1, String ph2, String ph3) { 
			String SQL = "UPDATE COSTOM SET pw=?, addr=?, ph1=?, ph2=?, ph3=? where userID=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DatabaseUtill.getConnection();
				pstmt = conn.prepareStatement(SQL); // SQL문을 불러온다.
				pstmt.setString(1, pw);
				pstmt.setString(2, addr);
				pstmt.setString(3, ph1);
				pstmt.setString(4, ph2);
				pstmt.setString(5, ph3);
				pstmt.setString(6, userID);
				
				return pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally { // 변수 자원 해제 
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
	
	
	
	// 문자인증 확인
	public String getchecknum(String userID) { 
		String SQL = "SELECT checknum FROM COSTOM WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL문을y 불러온다.
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // 변수 자원 해제 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return null; // 아이디로 이메일 찾을 수 없음
	}
	
	// 문자 인증 시스템 수행
	public boolean setchecked(String userID) { 
		String SQL = "UPDATE COSTOM SET checked = true Where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL문을 불러온다.
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true;	// 인증 되도 또한번 인증 가능
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // 변수 자원 해제 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return false; // 이메일 검증 안됨
	}


	// 문자 인증이 완료되었는지 확인 
	public boolean getchecked(String id) { 
		String SQL = "SELECT checked FROM COSTOM WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL문을 불러온다.
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getBoolean(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // 변수 자원 해제 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return false; // 이메일 검증 안됨
	}	
	

		
	
/*	
	// 아이디로 이메일 찾기
	public String getUserEmail(String id) { 
		String SQL = "SELECT addr FROM user WHERE id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL문을y 불러온다.
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // 변수 자원 해제 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return null; // 아이디로 이메일 찾을 수 없음
	}
	
	
	// 이메일 인증이 완료되었는지 확인
	public boolean getUserEmailChecked(String id) { 
		String SQL = "SELECT userEmailChecked FROM user WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL문을 불러온다.
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getBoolean(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // 변수 자원 해제 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return false; // 이메일 검증 안됨
	}
	
	// 이메일 인증 시스템 수행
	public boolean setUserEmailCheck(String id) { 
		String SQL = "UPDATE user SET userEmailChecked = true Where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtill.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL문을 불러온다.
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			return true;	// 인증 되도 또한번 인증 가능
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // 변수 자원 해제 
			try{if(conn != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
			try{if(rs != null) conn.close();}  catch (Exception e) {e.printStackTrace();}
		}
		return false; // 이메일 검증 안됨
	}
*/
}
	
