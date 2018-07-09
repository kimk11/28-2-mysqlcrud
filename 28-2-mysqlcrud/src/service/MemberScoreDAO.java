package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberScoreDAO {
	public int selectMemberScore(int memberNo) {
		Connection connection = null;
		ResultSet result = null;
		PreparedStatement preparedStatement = null;
		
		int check = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "SELECT member_score_no, member_no, score FROM member_score WHERE member_no = ?";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, memberNo);
			
			result = preparedStatement.executeQuery();
			
			if(result.next()) {
				check = 1;
			}
			
		} catch (Exception e) { //try문에서 예외가 발생할 때 실해
			e.printStackTrace();
		} finally{
			//6단계 사용한 Query statement 종료
			if (result != null) try { result.close(); } catch(SQLException ex) {}
			if (preparedStatement != null) try { preparedStatement.close(); } catch(SQLException ex) {}
			
			//7단계 db 연결 종료
			if (connection != null) try { connection.close(); } catch(SQLException ex) {}
		}
		return check;
		
	}
	
	public int insertMemberScore(int memberNo, int memberScore) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "INSERT INTO member_score(member_no, score) VALUES(?, ?)";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, memberNo);
			preparedStatement.setInt(2, memberScore);
			
			result = preparedStatement.executeUpdate();
			
		} catch (Exception e) { //try문에서 예외가 발생할 때 실해
			e.printStackTrace();
		} finally { //예외 방생 여부 없이 무조건 실행
			if(preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	public int updateMemberScore(int memberNo, int memberScore) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "UPDATE member_score SET score = ? WHERE member_no = ?";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, memberScore);
			preparedStatement.setInt(2, memberNo);
			
			result = preparedStatement.executeUpdate();
			
		} catch (Exception e) { //try문에서 예외가 발생할 때 실해
			e.printStackTrace();
		} finally { //예외 방생 여부 없이 무조건 실행
			if(preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	
//	public ArrayList<Member> selectMemberByPage(int begin, int rowPerPage, String word){
//		//word :
//		//""->쿼리
//		//"검색단어" -> 쿼리
//		//분기문 필요
//		//요구사항 -> 동적쿼리
//		
//		ArrayList<Member> list = new ArrayList<>();
//		Connection connection = null;
//		ResultSet result = null;
//		PreparedStatement preparedStatement = null;
//		
//		String Driver="com.mysql.jdbc.Driver";
//		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
//		String user = "mysqlcrud_2id";
//		String password = "mysqlcrud_2pw";		//연결 정보
//		String sql1 = "SELECT * FROM member ORDER BY no LIMIT ?, ?";
//		String sql2 = "SELECT * FROM member WHERE member_name like ? ORDER BY no LIMIT ?, ?";
//		
//		try {	
//			Class.forName(Driver);	
//				
//			connection= DriverManager.getConnection(url, user, password);
//			
//			if(word.equals("")) {
//				preparedStatement = connection.prepareStatement(sql1);
//				preparedStatement.setInt(1, begin);
//				preparedStatement.setInt(2, rowPerPage);
//			}else {
//				preparedStatement = connection.prepareStatement(sql2);
//				preparedStatement.setString(1, "%"+word+"%");
//				preparedStatement.setInt(2, begin);
//				preparedStatement.setInt(3, rowPerPage);
//			}
//			
//			
//			result = preparedStatement.executeQuery();
//
//		
//		} catch(Exception e) {
//			e.printStackTrace();
//		}finally{
//			//6단계 사용한 Query statement 종료
//			if (result != null) try { result.close(); } catch(SQLException ex) {}
//			if (preparedStatement != null) try { preparedStatement.close(); } catch(SQLException ex) {}
//			
//			//7단계 db 연결 종료
//			if (connection != null) try { connection.close(); } catch(SQLException ex) {}
//		}
//		
//		return list;
//	}
	
	
//	public ArrayList<MemberAndScore> selectMemberAndScored(){
//		ArrayList<MemberAndScore> list = new ArrayList<MemberAndScore>();
//		String sql = "";
//		while(rs.next()) {
//			Member member = new Member();
//			//rs.get
//			MemberScore memberScore = new MemberScore();
//			//rs.get
//			MemberAndScore memberAndScore = new MemberAndScore();
//			memberAndScore.setMember(member);
//			memberAndScore.setMemberScore(memberScore);
//			list.add(memberAndScore);
//		}
//	}
}
