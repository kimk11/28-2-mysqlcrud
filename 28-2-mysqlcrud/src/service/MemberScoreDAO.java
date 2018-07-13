//28기 현희문
//2018-07-09
//MemberScoreDAO 작성

package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberScoreDAO {
	
	//회원점수 조회하는 메서드 작성
	//memberList.jsp에서 사용
	//리턴 값 0 = 쿼리 실행 실패
	//리턴 값 1 = 쿼리 실행 성공
	public int selectCheck(int memberNo) {
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
	
	//회원점수 입력 메서드 작성
	//insertMemberScoreAction.jsp에서 사용
	//리턴 값 0 = 쿼리 실행 실패
	//리턴 값 1 = 쿼리 실행 성공
	public int insertScore(int memberNo, int memberScore) {
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
	
	//회원점수 수정 메서드 작성
	//updateMemberScoreAction.jsp에서 사용
	//리턴 값 0 = 쿼리 실행 실패
	//리턴 값 1 = 쿼리 실행 성공
	public int updateScore(int memberNo, int memberScore) {
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
	
	//member 테이블과 member_score 테이블을 INNER JOIN하여 조회하는 메서드 작성
	//memberAndScoreList.jsp에서 사용
	//리턴 값 list = 쿼리 실행 결과들이 세팅 된 MemberAndScore 클래스의 객체들을 담은 ArrayList 클래스 객체의 객체참조변수
	public ArrayList<MemberAndScore> selectJoin(int memberNo){
		Connection connection = null;
		ResultSet result = null;
		PreparedStatement preparedStatement = null;
		
		ArrayList<MemberAndScore> list = new ArrayList<>();
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "SELECT ms.member_score_no, ms.member_no, m.member_name, m.member_age, ms.score FROM member_score ms INNER JOIN member m ON ms.member_no = m.member_no WHERE m.member_no = ?";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, memberNo);
			
			result = preparedStatement.executeQuery();
			
			while(result.next()) {
				Member member = new Member();
				member.setMemberNo(result.getInt("member_no"));
				member.setMemberName(result.getString("member_name"));
				member.setMemberAge(result.getInt("member_age"));
				
				MemberScore memberScore = new MemberScore();
				memberScore.setMemberScoreNo(result.getInt("member_score_no"));
				memberScore.setMemberNo(result.getInt("member_no"));
				memberScore.setScore(result.getInt("score"));
				
				MemberAndScore memberAndScore = new MemberAndScore();
				memberAndScore.setMember(member);
				memberAndScore.setMemberScore(memberScore);
				
				list.add(memberAndScore);
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
		return list;
	}
	
	//member_score 테이블의 score 컬럼의 평균을 조회하는 메서드 작성
	//memberListAboveAvg.jsp에서 사용
	//리턴 값 average = member_score 테이블의 score 컬럼의 평균
	public int selectAvgScore() {
		Connection connection = null;
		ResultSet result = null;
		PreparedStatement preparedStatement = null;
		int average = 0;
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "SELECT AVG(score) AS average FROM member_score";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			
			result = preparedStatement.executeQuery();
			
			if(result.next()) {
				average = result.getInt("average");
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
		return average;
	}
	
	//member 테이블과 member_score 테이블을 INNER JOIN 하여 member_score 테이블의 score 컬럼의 평균보다 높은 회원을 조회하는 메서드 작성
	//memberListAboveAvg.jsp에서 사용
	//리턴 값 list = 쿼리 실행 결과들이 세팅 된 MemberAndScore 클래스의 객체들을 담은 ArrayList 클래스 객체의 객체참조변수
	public ArrayList<MemberAndScore> selectAvgJoin(){
		ArrayList<MemberAndScore> list = new ArrayList<>();
		
		Connection connection = null;
		ResultSet result = null;
		PreparedStatement preparedStatement = null;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "SELECT  ms.member_no, m.member_name, ms.score FROM member_score ms INNER JOIN member m ON ms.member_no = m.member_no WHERE ms.score >=(SELECT AVG(score) FROM member_score) ORDER BY ms.score DESC";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			
			result = preparedStatement.executeQuery();
			
			while(result.next()) {
				Member member = new Member();
				member.setMemberName(result.getString("member_name"));
				
				MemberScore memberScore = new MemberScore();
				memberScore.setMemberNo(result.getInt("member_no"));
				memberScore.setScore(result.getInt("score"));
				
				MemberAndScore memberAndScore = new MemberAndScore();
				memberAndScore.setMember(member);
				memberAndScore.setMemberScore(memberScore);
				
				list.add(memberAndScore);
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
		
		return list;
	}
	
	//회원점수 삭제 메서드 작성
	//deleteMemberAction.jsp에서 사용
	//리턴 값 0 = 쿼리 실행 실패
	//리턴 값 1 = 쿼리 실행 성공
	public int deleteScore(int memberNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "DELETE FROM member_score WHERE member_no = ?";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, memberNo);
			
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
	
	//회원점수 수정을 위한 회원점수 조회 메서드 작성
	//updateMemberScoreForm.jsp에서 사용
	//리턴 값 memberScore = 쿼리 실행 결과가 세팅된 MemberScore 클래스 객체의 객체참조변수
	public MemberScore selectMemberScoreForUpdateMemberScore(int memberNo) {
		Connection connection = null;
		ResultSet result = null;
		PreparedStatement preparedStatement = null;
		
		MemberScore memberScore = new MemberScore();
		
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
			
			while(result.next()) {
				memberScore.setMemberScoreNo(result.getInt("member_score_no"));
				memberScore.setMemberNo(result.getInt("member_no"));
				memberScore.setScore(result.getInt("score"));
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
		
		return memberScore;
	}
}
