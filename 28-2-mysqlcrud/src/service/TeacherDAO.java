// 2018.06.26 송유빈 
// TeacherDAO.java 

package service;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
