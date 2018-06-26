// 2018.06.26 송유빈
// TeacherAddrDAO.java 

package service;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TeacherAddrDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public void insertTeacherAddr(TeacherAddr teacherAddr) {
		System.out.println("insertTeacherAddr TeacherAddrDAO.java");

		try {
			//드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrud_2id";
			String dbPass = "mysqlcrud_2pw";

			// 주소와 아이디, 비밀번호를 conn 객체참조변수에 넣어준다.
			Connection conn = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
			System.out.println(conn + "<= conn");

			// 
			pstmt = conn.prepareStatement("INSERT INTO teacher(teacher_no,teacher_addr_content) VALUES(?,?)");
			// teacherAddr 객체의 주소에 있는 TeacherNo, TeacherAddrContent를 가져온다.
			pstmt.setInt(1, teacherAddr.getTeacherNo());
			pstmt.setString(2, teacherAddr.getTeacherAddrContent());
			pstmt.executeUpdate();

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
	}
}
