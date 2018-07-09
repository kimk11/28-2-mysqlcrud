// 2018.06.26 송유빈
// TeacherAddrDAO.java 

package service;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class TeacherAddrDAO {
	

	//03  selectTeacherByPage
		public TeacherAddr selectAllTeacherAddr(int teacher) {
			System.out.println("03 selectAllTeacherAddr TeacherDAO.java");
			TeacherAddr teacherAddr = new TeacherAddr();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;

			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
				String dbUser = "mysqlcrud_2id";
				String dbPass = "mysqlcrud_2pw";
				String sql = "SELECT teacher_addr_content FROM teacher_addr WHERE teacher_no=?";
				connection = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1,teacher);
				resultSet = preparedStatement.executeQuery();
				
				
				
				
				if(resultSet.next()) {
					teacherAddr.setTeacherAddrContent(resultSet.getString(1));
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
			return teacherAddr;
		}
	
	
	
	
	//02  selectTeacherByPage
		public ArrayList<TeacherAddr> selectTeacherAddr(int teacher) {
			System.out.println("02 selectTeacherAll TeacherDAO.java");
			ArrayList<TeacherAddr> list2 = new ArrayList<>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;

			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
				String dbUser = "mysqlcrud_2id";
				String dbPass = "mysqlcrud_2pw";
				String sql = "SELECT teacher_addr_no,teacher_addr_content FROM teacher_addr WHERE teacher_no=?";
				connection = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1,teacher);
				resultSet = preparedStatement.executeQuery();
				
				
				
				
				while(resultSet.next()) {
					TeacherAddr teacherAddr = new TeacherAddr();
					teacherAddr.setTeacherAddrNo(resultSet.getInt(1));
					teacherAddr.setTeacherAddrContent(resultSet.getString(2));
					list2.add(teacherAddr);
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
			return list2;
		}
	
	
	public int insertTeacherAddr(TeacherAddr  teacherAddr) {
		System.out.println("01 insertTeacherAddr TeacherAddrDAO.java");
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int check =0;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrud_2id";
			String dbPass = "mysqlcrud_2pw";

			
			Connection conn = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
			System.out.println(conn + "<= conn");

		 
			preparedStatement = conn.prepareStatement("INSERT INTO teacher_addr(teacher_no,teacher_addr_content) VALUES(?,?)");
			
			preparedStatement.setInt(1, teacherAddr.getTeacherNo());
			preparedStatement.setString(2, teacherAddr.getTeacherAddrContent());
			check = preparedStatement.executeUpdate();

			// try ... catch 
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
		return check;
	}
}
