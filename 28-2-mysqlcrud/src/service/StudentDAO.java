//28기 김진우
//2018-06-26
//student DAO 작성
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentDAO {
	
	//student insert작성, 리턴값 0 = 쿼리실행 실패, 1 = 쿼리 실행 성공
	public int studentInsert(Student student){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql="insert into student(student_name,student_age) values(?,?);";
		
		try {	
			Class.forName(Driver);
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, student.getStudentName());
			preparedStatement.setInt(2, student.getStudentAge());
			
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
