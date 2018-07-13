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
	
	
	// 한 명의 점수 테이블 삭제 
		public void deleteTeacherAddr(int no) {
			System.out.println(" deleteAddr TeacherAddrDAO.java");
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			String className="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String user = "mysqlcrud_2id";
			String password = "mysqlcrud_2pw";		
			String sql="DELETE FROM teacher_addr WHERE teacher_no = ?";
			
			try {
				Class.forName(className);
				connection= DriverManager.getConnection(url, user, password);
				
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, no);
				preparedStatement.executeUpdate();
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

		}
		
	
	
	// 04 updateTeacherAddr
	// int no = teacher_no
	// teacher_no를 이용해서 주소를 수정할 수 있다.
	public void updateTeacherAddr(TeacherAddr teacherAddr,int no) {
		System.out.println("04 updateTeacherAddr TeacherAddrDAO.java");
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String Driveraddr = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrud_2id";
			String dbPass = "mysqlcrud_2pw";
			String sql = "UPDATE teacher_addr SET teacher_addr_content=? WHERE teacher_no = ?";
			connection = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,teacherAddr.getTeacherAddrContent());
			preparedStatement.setInt(1,no);
			preparedStatement.executeUpdate();
			
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
		
	
	// 03  selectAllTeacherAddr
	// 한 사람의 주소페이지를 보여주기 위한 조회 메서드 
		public TeacherAddr selectAllTeacherAddr(int teacher) {
			System.out.println("03 selectAllTeacherAddr TeacherAddDAO.java");
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
					teacherAddr.setTeacherAddrContent(resultSet.getString(1));	// resultSet에 값이 있을 때
				}																// 1번째 인덱스의 내용을 가져온다.
				
				
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
	
	
	
	
		// 02  selectTeacherByPage 주소테이블 select 
		// 주소테이블번호와 주소내용을 teacher_no로 조회
 		public ArrayList<TeacherAddr> selectTeacherAddr(int teacher) {
			System.out.println("02 selectTeacherAll TeacherAddDAO.java");
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
				
				
				
				
				while(resultSet.next()) {										// resultSet에 값이 있다면 다음 레코드로 	
					TeacherAddr teacherAddr = new TeacherAddr();				
					teacherAddr.setTeacherAddrNo(resultSet.getInt(1));			// 첫번째 인덱스 값을 teacherAddr DTO에 setting 한다.
					teacherAddr.setTeacherAddrContent(resultSet.getString(2));	
					list2.add(teacherAddr);										// ArrayList 안에 teacherAddr 객체를 더해준다.
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
	
	
 		// 주소를 입력을 처리하는  메서드
	public int teacherAddrInsert(TeacherAddr  teacherAddr) {
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
