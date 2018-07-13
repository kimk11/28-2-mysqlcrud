//28기 현희문
//2018-06-26
//MemberDAO 작성

package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;

public class MemberDAO {
	
	//회원 입력 메서드 작성
	//insertMemberAction.jsp에서 사용
	//매개변수 Member member = insertMemberForm.jsp에서 받은 값이 세팅된 Member 클래스 객체의 객체참조변수
	//insertMemberForm.jsp에서 받은 값을 member 테이블의 member_name, member_age 컬럼에 데이터 입력
	//리턴 값 0 = 쿼리 실행 실패
	//리턴 값 1 = 쿼리 실행 성공
	public int memberInsert(Member member){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "INSERT INTO member(member_name, member_age) values(?, ?);";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, member.getMemberName());
			preparedStatement.setInt(2, member.getMemberAge());
			
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
	
//	public ArrayList<Member> selectMemberByPage(int begin, int rowPerPage){
//		ArrayList<Member> list = new ArrayList<>();
//		
//		Connection connection = null;
//		ResultSet result = null;
//		PreparedStatement preparedStatement = null;
//		
//		String Driver="com.mysql.jdbc.Driver";
//		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
//		String user = "mysqlcrud_2id";
//		String password = "mysqlcrud_2pw";		//연결 정보
//		String sql = "SELECT member_no, member_name, member_age FROM member ORDER BY member_no ASC LIMIT ?, ?";
//		
//		try {	
//			Class.forName(Driver);	
//				
//			connection= DriverManager.getConnection(url, user, password);
//			preparedStatement = connection.prepareStatement(sql);
//			preparedStatement.setInt(1, begin);
//			preparedStatement.setInt(2, rowPerPage);
//			
//			result = preparedStatement.executeQuery();
//			
//			while(result.next()) {
//				Member member = new Member();
//				member.setMemberNo(result.getInt("member_no"));
//				member.setMemberName(result.getString("member_name"));
//				member.setMemberAge(result.getInt("member_age"));
//				list.add(member);
//			}
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
	
	//회원 리스트 페이징, 검색 메서드 작성
	//memberList.jsp에서 사용
	//매개변수 int begin, int rowPerPage, String searchName = memberList.jsp에서의 페이지 시작번호와 페이지마다 띄우는 회원주소의 갯수, 검색단어
	//검색단어가 공백이면 member 테이블의 member_no, member_name, member_age 컬럼의 값을 매개변수로 LIMIT를 걸어 오름차순으로 조회
	//검색단어가 공백이 아니면 member 테이블의 member_name 컬럼의 값 중 검색단어를 가지고 있는 member_no, member_name, member_age 컬럼의 값을 매개변수로 LIMIT를 걸어 오름차순으로 조회
	//리턴 값 list = 쿼리 실행 결과들이 세팅 된 Member 클래스의 객체들을 담은 ArrayList 클래스 객체의 객체참조변수
	public ArrayList<Member> selectMemberByPage(int begin, int rowPerPage, String searchName){
		ArrayList<Member> list = new ArrayList<>();
		
		Connection connection = null;
		ResultSet result = null;
		PreparedStatement preparedStatement = null;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql1 = "SELECT member_no, member_name, member_age FROM member ORDER BY member_no ASC LIMIT ?, ?";
		String sql2 = "SELECT member_no, member_name, member_age FROM member WHERE member_name LIKE ? ORDER BY member_no ASC LIMIT ?, ?";		
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			
			if(searchName.equals("")) {
				preparedStatement = connection.prepareStatement(sql1);
				preparedStatement.setInt(1, begin);
				preparedStatement.setInt(2, rowPerPage);
			}else {
				preparedStatement = connection.prepareStatement(sql2);
				preparedStatement.setString(1, "%"+searchName+"%");
				preparedStatement.setInt(2, begin);
				preparedStatement.setInt(3, rowPerPage);
			}
			
			result = preparedStatement.executeQuery();
			
			while(result.next()) {
				Member member = new Member();
				member.setMemberNo(result.getInt("member_no"));
				member.setMemberName(result.getString("member_name"));
				member.setMemberAge(result.getInt("member_age"));
				list.add(member);
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		}finally{
			//6단계 사용한 Query statement 종료
			if (result != null) try { result.close(); } catch(SQLException ex) {}
			if (preparedStatement != null) try { preparedStatement.close(); } catch(SQLException ex) {}
			
			//7단계 db 연결 종료
			if (connection != null) try { connection.close(); } catch(SQLException ex) {}
		}
		return list;
	}
	
	//회원의 총 인원을 조회하는 메서드 작성
	//memberList.jsp에서 사용
	//매개변수 없음
	//리턴 값 0 = 쿼리 실행 실패
	//리턴 값 rowNumber > 0 = 회원의 총 인원
	public int currentPage() {
		Connection connection = null;
		ResultSet result = null;
		PreparedStatement preparedStatement = null;
		int count = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "SELECT count(member_no) AS count FROM member";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			
			result = preparedStatement.executeQuery();
			
			if(result.next()) {
				count = result.getInt("count");
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		}finally{
			//6단계 사용한 Query statement 종료
			if (result != null) try { result.close(); } catch(SQLException ex) {}
			if (preparedStatement != null) try { preparedStatement.close(); } catch(SQLException ex) {}
			
			//7단계 db 연결 종료
			if (connection != null) try { connection.close(); } catch(SQLException ex) {}
		}
		return count;
	}
	
	//회원 삭제 메서드 작성
	//deleteMemberAction.jsp에서 사용
	//매개변수 int memberNo = memberList.jsp에서 받아온 memberNo
	//리턴 값 0 = 쿼리 실행 실패
	//리턴 값 1 = 쿼리 실행 성공
	public int deleteMember(int memberNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "DELETE FROM member WHERE member_no = ?";
		
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
	
	//회원 수정을 위한 회원 조회 메서드 작성
	//updateMemberForm.jsp에서 사용
	//매개변수 int memberNo = memberList.jsp에서 받아온 memberNo
	//리턴 값 member = 쿼리 실행 결과들이 세팅된 Member 클래스 객체의 객체참조변수
	public Member selectOneMember(int memberNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet result = null;
		
		Member member = new Member();
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "SELECT member_no, member_name, member_age FROM member WHERE member_no = ?";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, memberNo);
			
			result = preparedStatement.executeQuery();
			
			if(result.next()) {
				member.setMemberNo(result.getInt("member_no"));
				member.setMemberName(result.getString("member_name"));
				member.setMemberAge(result.getInt("member_age"));
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
		return member;
	}
	
	//회원 수정 메서드 작성
	//updateMemberAction.jsp에서 사용
	//리턴 값 0 = 쿼리 실행 실패
	//리턴 값 1 = 쿼리 실행 성공
	public int updateMember(int memberNo, String memberName, int memberAge) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "UPDATE member SET member_name = ?, member_age = ? WHERE member_no = ?";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, memberName);
			preparedStatement.setInt(2, memberAge);
			preparedStatement.setInt(3, memberNo);
			
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
}