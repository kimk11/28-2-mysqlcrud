// 2018.06.26 ������ 
// TeacherAddrDAO.java 

package service;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TeacherAddrDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public void insertTeacherAddr(TeacherAddr teacherAddr) throws ClassNotFoundException, SQLException {
		System.out.println("insertTeacherAddr TeacherAddrDAO.java");

		try {
			// ����̹� �ε�
			Class.forName("com.mysql.jdbc.Driver");
			String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrud_2id";
			String dbPass = "mysqlcrud_2pw";

			// �ּ� ���̵� ��й�ȣ�� Ŀ�ؼ� ��ü�� �ּҿ� �־��ش�.
			Connection conn = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
			System.out.println(conn + "<= conn");

			// �� ���� insert ������ ��ȣ�� �ּ� �Է��ڷḦ ?�� ���������� ����
			pstmt = conn.prepareStatement("INSERT INTO teacher(teacher_no,teacher_addr_content) VALUES(?,?)");
			// teacherAddr ��ü�������� �ּҿ� �ִ� TeacherNo, TeacherAddrContent�� ���� �޾� �����´�.
			pstmt.setInt(1, teacherAddr.getTeacherNo());
			pstmt.setString(2, teacherAddr.getTeacherAddrContent());
			pstmt.executeUpdate();

			// try ... catch ����ó�� �� PreparedStatement�� Connection ����
		} catch (SQLException ex) {
			ex.printStackTrace();
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
