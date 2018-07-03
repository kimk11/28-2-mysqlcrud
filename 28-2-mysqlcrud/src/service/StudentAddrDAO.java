//28기 김진우
//2018-06-26
//studentaddr DAO 작성
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentAddrDAO {
// <studentAddr테이블 데이터 추가 메서드 start>
	//studentAddr insert작성, 리턴값 0 = 쿼리실행 실패, 1 = 쿼리 실행 성공
	public int studentAddrInsert(StudentAddr studentAddr){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql="INSERT INTO student_addr(student_no,student_addr_content) VALUES(?,?);";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, studentAddr.getStudentNo());
			preparedStatement.setString(2, studentAddr.getStudentAddrContent());
			
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
// <studentAddr테이블 데이터 추가 메서드 end>

// <studentAddr테이블 데이터 조회 메서드 start>
	//student테이블 리스트로 보기 메서드 _page작업
	public ArrayList<StudentAddr> selectStudentAddrByPage(int page, int pagePerRow , int studentNo){
		ArrayList<StudentAddr> studentAddrList = new ArrayList<>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="SELECT student_addr_no, student_no, student_addr_content FROM student_addr where student_no = ? LIMIT ?,?";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, studentNo);
			preparedStatement.setInt(2, (page-1)*pagePerRow);
			preparedStatement.setInt(3, pagePerRow);
			resultset = preparedStatement.executeQuery();
			while(resultset.next()) {
				StudentAddr studentAddr = new StudentAddr();
				studentAddr.setStudentAddrNo(resultset.getInt(1));
				studentAddr.setStudentNo(resultset.getInt(2));
				studentAddr.setStudentAddrContent(resultset.getString(3));
				studentAddrList.add(studentAddr);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(resultset != null) {
				try {
					resultset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return studentAddrList;
	}
	
	// db에 저장된 데이터의 갯수를 구하는 메서드
	public int currentPage() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		int count = 0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="SELECT count(student_addr_no) as count FROM student_addr";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			resultset = preparedStatement.executeQuery();
			if(resultset.next()) {
				count=resultset.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(resultset != null) {
				try {
					resultset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return count;
	}
// <studentAddr테이블 데이터 조회 메서드 end>

// <studentAddr테이블 데이터 수정 메서드 start>
	//수정 폼에 가져올 데이터 조회
	public StudentAddr selectOneStudentAddr(int studentAddrNo) {
		StudentAddr studentAddr = new StudentAddr();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="SELECT student_addr_no,student_no,student_addr_content FROM student_addr where student_addr_no = ? ";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, studentAddrNo);
			resultset = preparedStatement.executeQuery();
			if(resultset.next()) {
				studentAddr.setStudentAddrNo(resultset.getInt(1));
				studentAddr.setStudentNo(resultset.getInt(2));
				studentAddr.setStudentAddrContent(resultset.getString(3));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(resultset != null) {
				try {
					resultset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return studentAddr;
	}
	
	// 수정폼에서 가져온 값으로 db데이터 변경
	public int updateStudentAddr(StudentAddr studentAddr) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="update student_addr set student_addr_content = ? where student_addr_no = ?";
		
		try {	
			Class.forName(className);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, studentAddr.getStudentAddrContent());
			preparedStatement.setInt(2, studentAddr.getStudentAddrNo());
			
			result = preparedStatement.executeUpdate();
			
			preparedStatement.close();
			connection.close();
		} catch (Exception e) { 
			e.printStackTrace();
		} finally { 
			if(preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
// <studentAddr테이블 데이터 수정 메서드 end>

// <studentAddr테이블 데이터 삭제 메서드 start>
	public int deleteStudentAddr(int studentNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="DELETE FROM student_addr WHERE student_no=?";
		
		try {	
			Class.forName(className);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, studentNo);
			
			result = preparedStatement.executeUpdate();
			
			preparedStatement.close();
			connection.close();
		} catch (Exception e) { 
			e.printStackTrace();
		} finally { 
			if(preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
// <studentAddr테이블 데이터 삭제 메서드 end>
}
