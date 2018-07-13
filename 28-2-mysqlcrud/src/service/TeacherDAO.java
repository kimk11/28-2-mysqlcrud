// 2018.06.26 송유빈
// TeacherDAO.java 

package service;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class TeacherDAO {

	/*
	 * CREATE TABLE `teacher` ( `teacher_no` INT(10) NOT NULL AUTO_INCREMENT,
	 * `teacher_name` VARCHAR(50) NOT NULL, `teacher_age` INT(10) NOT NULL, PRIMARY
	 * KEY (`teacher_no`) ) COLLATE='euckr_korean_ci' ENGINE=InnoDB
	 * AUTO_INCREMENT=3;
	 */

	
	
	// 06 selectTeacher
	// int getTeacherNo = teacher_no
	// Teacher 리턴 타입으로 teacher클래스에서 리턴을 받는다
	public Teacher selectOneTeacher(int getTeacherNo) {
		System.out.println("05 updateTeacher TeacherDAO.java ");
		Teacher teacher = new Teacher();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrud_2id";
			String dbPass = "mysqlcrud_2pw";
			connection = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
			String sql = "SELECT teacher_no,teacher_name,teacher_age FROM teacher WHERE teacher_no = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,getTeacherNo);
			resultSet = preparedStatement.executeQuery();		//	  쿼리의 결과를 resultSet으로 리턴
																//	 resultSet에 결과값이 있다면 다음 레코드로 
			
			if(resultSet.next()) {								
				teacher.setTeacherNo(resultSet.getInt(1));		//	   첫 번째 결과값을 int 형으로 1인덱스에 넣는다
				teacher.setTeacherName(resultSet.getString(2));
				teacher.setTeacherAge(resultSet.getInt(3));
				
		
				preparedStatement.close();
				connection.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (preparedStatement != null)
				try {
					preparedStatement.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}
		return teacher;
	}

	// 05 updateTeacher
	// teacher 테이블에서 한 명의 이름과 나이를 수정할 수 있다.
	// int getTeacherNo = teacher_no  
	public void updateTeacher(Teacher teacher, int getTeacherNo) {
		System.out.println("05 updateTeacher TeacherDAO.java ");
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrud_2id";
			String dbPass = "mysqlcrud_2pw";
			connection = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
			String sql = "UPDATE teacher SET teacher_name=?,teacher_age=? WHERE teacher_no = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, teacher.getTeacherName());
			preparedStatement.setInt(2, teacher.getTeacherAge());
			preparedStatement.setInt(3, teacher.getTeacherNo());
			preparedStatement.executeUpdate();
			System.out.println("getTeacherNo :" + getTeacherNo);
			System.out.println("Name :" + teacher.getTeacherName());

			preparedStatement.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (preparedStatement != null)
				try {
					preparedStatement.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}

		}
	}

	// 04 deleteTeacherAction.jsp deleteTeacher
	// teacher 테이블에서 한 행을 삭제 
	public void deleteTeacher(int teacher) {
		System.out.println("04 deleteTeacher TeacherDAO.java");
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrud_2id";
			String dbPass = "mysqlcrud_2pw";
			String sql = "DELETE FROM teacher WHERE teacher_no = ?";
			connection = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, teacher);
			preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (preparedStatement != null)
				try {
					preparedStatement.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}

		}

	}

	// 02 selectTeacherByPage 페이징 작업 및 검색
	// 리턴값 list = 번호 이름 나이 DB 
	public ArrayList<Teacher> selectTeacherByPage(int startRow, int pagePerRow, String searchWord) {
		System.out.println("02 selectTeacherAll TeacherDAO.java");
		ArrayList<Teacher> list = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrud_2id";
			String dbPass = "mysqlcrud_2pw";
			connection = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
			
			// 검색창이 null 값이면 페이징 작업으로
			if (searchWord.equals("")) {
				String sql = "SELECT teacher_no,teacher_name,teacher_age  FROM Teacher ORDER BY teacher_no LIMIT ?, ?;";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, startRow);
				preparedStatement.setInt(2, pagePerRow);
				System.out.print("searchWord 공백");
			// 검색창이 null이 아니라면 검색된 내용과 일치하는 내용 표시
			} else if(!searchWord.equals("")) {
				String sql = "SELECT teacher_no,teacher_name,teacher_age  FROM Teacher WHERE teacher_name LIKE ? ORDER BY teacher_no ASC LIMIT ?, ?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, "%"+searchWord+"%");
				preparedStatement.setInt(2, startRow);
				preparedStatement.setInt(3, pagePerRow);
				System.out.print("searchWord : " + searchWord);
			}

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Teacher teacher = new Teacher();
				int teacherNo = resultSet.getInt("teacher_no");
				String teacherName = resultSet.getString("teacher_name");
				int teacherAge = resultSet.getInt("teacher_age");

				teacher.setTeacherNo(teacherNo);
				teacher.setTeacherName(teacherName);
				teacher.setTeacherAge(teacherAge);
				list.add(teacher);
			}

			preparedStatement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (preparedStatement != null)
				try {
					preparedStatement.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}

		}
		return list;
		
		
		// JDBC API SELECT ResultSet -> ArrayList<Member> : 멤버타입의 배열을 만듬

		// 배열의 사용을 편하게-> List, Set, Map
		/*
		 * List : 개수가 동적, list.size()(현재 들어가있는 개수),remove(4), 배열 : 개수가 정적, 배열.length(배열의
		 * 개수), 배열[4],
		 */

	}

	// 03 count DB row 개수
	public int currentPage(String searchWord) {
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		int totalRow = 0;	// 초기값 0에서 리턴을 받게 되면 총 레코드 수만큼 증가하게 된다.

		String Driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";
		String sql = "SELECT count(teacher_no) FROM teacher"; 						     // teacher 테이블에 있는 총 레코드 수 
		String sql2 = "SELECT count(teacher_no) FROM teacher WHERE teacher_name LIKE ?"; // 검색해서 나오는 데이터의 총 레코드 수  
		try {
			Class.forName(Driver);

			connection = DriverManager.getConnection(url, user, password);
			if(searchWord == null || searchWord.equals("")) {
				preparedStatement = connection.prepareStatement(sql);
			}else if(searchWord != null || !searchWord.equals("")) {
				preparedStatement = connection.prepareStatement(sql2);
				preparedStatement.setString(1, "%"+searchWord+"%");
			}
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				totalRow = resultSet.getInt("count(teacher_no)");	// 여기서 나오는 수를 int 형으로 totalRow에 할당한다.
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (resultSet != null)
				try {
					resultSet.close();
				} catch (SQLException ex) {
				}
			if (preparedStatement != null)
				try {
					preparedStatement.close();
				} catch (SQLException ex) {
				}

			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ex) {
				}
		}
		return totalRow;	// 할당받은 수를 리턴한다.
	}

	// 01 insertTeacher
	public int insertTeacher(Teacher teacher) {
		System.out.println("insertTeacher TeacherDAO.java");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			// 드라이버로딩
			Class.forName("com.mysql.jdbc.Driver");
			String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrud_2id";
			String dbPass = "mysqlcrud_2pw";

			conn = DriverManager.getConnection(Driveraddr, dbUser, dbPass);

			// teacher 테이블에서 한 명의 데이터를 이름과 나이로 등록한다.
			pstmt = conn.prepareStatement("INSERT INTO teacher(teacher_name,teacher_age) VALUES(?,?)");
			pstmt.setString(1, teacher.getTeacherName());
			pstmt.setInt(2, teacher.getTeacherAge());
			pstmt.executeUpdate();

			pstmt.close();
			conn.close();
			// try ... catch
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}

		}
		return result;
	}
}
