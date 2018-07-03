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

	
		/*CREATE TABLE `teacher` (
			`teacher_no` INT(10) NOT NULL AUTO_INCREMENT,
			`teacher_name` VARCHAR(50) NOT NULL,
			`teacher_age` INT(10) NOT NULL,
			PRIMARY KEY (`teacher_no`)
		)
		COLLATE='euckr_korean_ci'
		ENGINE=InnoDB
		AUTO_INCREMENT=3;
		 */

	//02 selectTeacherAll
	public ArrayList<Teacher> selectTeacherByPage(int startRow, int pagePerRow) {
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
			String sql = "SELECT teacher_no,teacher_name,teacher_age  FROM Teacher ORDER BY teacher_no LIMIT ?, ?;";
			connection = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, startRow);
			preparedStatement.setInt(2, pagePerRow);
			resultSet = preparedStatement.executeQuery();
			
			
			
			
			while(resultSet.next()) {
				Teacher teacher = new Teacher();
				int teacherNo = resultSet.getInt("teacher_no");
				String teacherName = resultSet.getString("teacher_name");
				int teacherAge= resultSet.getInt("teacher_age");
				
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
		
		
		//배열의 사용을 편하게-> List, Set, Map
		/*List : 개수가 동적, list.size()(현재 들어가있는 개수),remove(4), 
	배열 : 개수가 정적, 배열.length(배열의 개수), 배열[4],
	*/
	
	}
	
	public int count() {
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		int totalRow = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";
		String sql = "SELECT count(*) FROM teacher;";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				totalRow = resultSet.getInt("count(*)");
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		}finally{
			//6단계 사용한 Query statement 종료
			if (resultSet != null) try { resultSet.close(); } catch(SQLException ex) {}
			if (preparedStatement != null) try { preparedStatement.close(); } catch(SQLException ex) {}
			
			//7단계 db 연결 종료
			if (connection != null) try { connection.close(); } catch(SQLException ex) {}
		}
		return totalRow;
	}
	
	// 01 insertTeacher
	public int insertTeacher(Teacher teacher) {
		System.out.println("insertTeacher TeacherDAO.java");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			// 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrud_2id";
			String dbPass = "mysqlcrud_2pw";

			
			// 
			conn = DriverManager.getConnection(Driveraddr, dbUser, dbPass);

			
			//  한 명의insert 쿼리에 teacher 객체참조변수 주소값에 있는  TeacherName, TeacherAge의 입력자료를 ?에 순차적으로 대입
			pstmt = conn.prepareStatement("INSERT INTO teacher(teacher_name,teacher_age) VALUES(?,?)");
			pstmt.setString(1, teacher.getTeacherName());
			pstmt.setInt(2, teacher.getTeacherAge());
			pstmt.executeUpdate();

			pstmt.close();
			conn.close();
			// try ... catch 예외처리 후 PreparedStatement와 Connection 종료
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
