package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultset = null;
	
	//student insert�޼���
	public void studentInsert(Student student) throws ClassNotFoundException, SQLException {
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/jjdev?useUnicode=true&characterEncoding=euckr";
		String user = "root";
		String password = "java0000";		//���� ���� 
		String sql="insert into student(student_name,student_age) values(?,?);";
		
		Class.forName(Driver);		//����̹� ����
			
		connection= DriverManager.getConnection(url, user, password);
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, student.getStudentName());
		preparedStatement.setInt(2, student.getStudentAge());
		
		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		connection.close();
	}
}
