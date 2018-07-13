//28기 현희문
//2018-06-26
//MemberAddrDAO 작성

package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberAddrDAO {
	
	//회원주소 입력 메서드 작성
	//insertMemberAddrAction.jsp에서 사용
	//매개변수 MemberAddr memberAddr = memberList.jsp에서 받은 값이 세팅된 MemberAddr 클래스 객체의 객체참조변수
	//memberList.jsp에서 받은 값을 member_addr 테이블 member_no, member_addr_content 컬럼에 데이터 입력
	//리턴 값 0 = 쿼리 실행 실패
	//리턴 값 1 = 쿼리 실행 성공
	public int memberAddrInsert(MemberAddr memberAddr){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql="Insert INTO member_addr(member_no, member_addr_content) values(?, ?);";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, memberAddr.getMemberNo());
			preparedStatement.setString(2, memberAddr.getMemberAddrContent());
			
			result = preparedStatement.executeUpdate();
			
			preparedStatement.close();
			connection.close();
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
	
	//회원주소 리스트 페이징 메서드 작성
	//memberAddrList.jsp에서 사용
	//매개변수 int begin, int rowPerPage = memberAddrList.jsp에서의 페이지 시작번호와 페이지마다 띄우는 회원주소의 갯수
	//member_addr 테이블의 member_addr_no, member_no, member_addr_content 컬럼의 값을 매개변수로 LIMIT를 걸어 오름차순으로 조회
	//리턴 값 list = 쿼리 실행 결과들이 세팅 된 MemberAddr 클래스의 객체들을 담은 ArrayList 클래스 객체의 객체참조변수
	public ArrayList<MemberAddr> selectMemberAddrByPage(int begin, int rowPerPage){
		ArrayList<MemberAddr> list = new ArrayList<>();
		
		Connection connection = null;
		ResultSet result = null;
		PreparedStatement preparedStatement = null;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "SELECT member_addr_no, member_no, member_addr_content FROM member_addr ORDER BY member_addr_no ASC LIMIT ?, ?";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, begin);
			preparedStatement.setInt(2, rowPerPage);
			
			result = preparedStatement.executeQuery();
			
			while(result.next()) {
				MemberAddr memberAddr = new MemberAddr();
				memberAddr.setMemberAddrNo(result.getInt("member_addr_no"));
				memberAddr.setMemberNo(result.getInt("member_no"));
				memberAddr.setMemberAddrContent(result.getString("member_addr_content"));
				list.add(memberAddr);
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
	
	//회원주소의 총 갯수를 조회하는 메서드 작성
	//memberAddrList.jsp에서 사용
	//매개변수 없음
	//memberList.jsp의 lastPage를 구하기 위해 member_addr 테이블의 member_addr_no의 갯수를 조회
	//리턴 값 0 = 쿼리 실행 실패
	//리턴 값 rowNumber > 0 = 회원주소의 총 갯수
	public int currentPage() {
		Connection connection = null;
		ResultSet result = null;
		PreparedStatement preparedStatement = null;
		
		int count = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql = "SELECT count(member_addr_no) AS count FROM member_addr";
		
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
	
	//회원주소 삭제 메서드 작성
	//deleteMemberAction.jsp에서 사용
	//매개변수 int memberNo = memberList.jsp에서 받아온 memberNo
	//member_addr 테이블 안에 member_no 컬럼 값이 memberNo인 행의 데이터를 삭제
	//리턴 값 0 = 쿼리 실행 실패
	//리턴 값 1 = 쿼리 실행 성공
	public int deleteMemberAddr(int memberNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql="DELETE FROM member_addr WHERE member_no = ?";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, memberNo);
			
			result = preparedStatement.executeUpdate();
			
			preparedStatement.close();
			connection.close();
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
