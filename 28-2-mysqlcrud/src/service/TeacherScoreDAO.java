package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class TeacherScoreDAO {
	
	public ArrayList<TeacherAndScore> selectTeacherAndScore() {
		System.out.println("03 selectTeacherAndScore TeacherScoreDao.java");
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		ArrayList<TeacherScore> list = new ArrayList<>();
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";	
		String sql = "SELECT ts.teacher_score_no, ts.teacher_no, t.teacher_name, t.teacher_age, ts.score FROM teacher_score ts INNER JOIN teacher t ON ts.teacher_no =t.teacher_no";
	
	try {	
		Class.forName(Driver);	
		connection= DriverManager.getConnection(url, user, password);
		preparedStatement = connection.prepareStatement(sql);
		resultSet = preparedStatement.executeQuery();
		
	while(resultSet.next()) {
		Teacher teacher = new Teacher();
		TeacherScore teacherScore = new TeacherScore();
		TeacherAndScore teacherAndScore = new TeacherAndScore();
		teacherAndScore.setTeacher(teacher);
		teacher.setTeacherNo(resultSet.getInt(1));
		teacher.setTeacherName(resultSet.getString(2));
		teacher.setTeacherAge(resultSet.getInt(3));
		teacherAndScore.setTeacherScore(teacherScore);
		list.add(teacherAndScore);
		
		preparedStatement.close();
		connection.close();
		
	}
	} catch (Exception e) { 
		e.printStackTrace();
	} finally{
		
		if (resultSet != null) try { resultSet.close(); } catch(SQLException ex) {}
		if (preparedStatement != null) try { preparedStatement.close(); } catch(SQLException ex) {}
		if (connection != null) try { connection.close(); } catch(SQLException ex) {}
	}
	return list;
}
	
	
	
	
	
	
	
	
	public int selectTeacherScore(int teacherNo) {
		System.out.println("02 selectTeacherScore TeacherScoreDao.java");
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";	
		String sql ="SELECT ts.teacher_score_no, ts.teacher_no, t.teacher_name, t.teacher_age, ts.score FROM teacher_score ts INNER JOIN teacher t ON ts.teacher_no =t.teacher_no WHERE teacher_score_no =?";
		
		try {	
			Class.forName(Driver);	
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, teacherNo);
			preparedStatement.executeUpdate();
			
			preparedStatement.close();
			connection.close();
			
		} catch (Exception e) { 
			e.printStackTrace();
		} finally{
			
			if (resultSet != null) try { resultSet.close(); } catch(SQLException ex) {}
			if (preparedStatement != null) try { preparedStatement.close(); } catch(SQLException ex) {}
			if (connection != null) try { connection.close(); } catch(SQLException ex) {}
		}
	}
	
	
	
	
	
	public int insertTeacherScore(int score, int teacherNo) {
	System.out.println("01 insertTeacherScore TeacherScoreDao.java");
	Connection connection = null;
	ResultSet resultSet = null;
	PreparedStatement preparedStatement = null;
	int result = 0;
	String Driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
	String user = "mysqlcrud_2id";
	String password = "mysqlcrud_2pw";	
	String sql ="INSERT INTO teacher_score(teacher_no,score) VALUES(?,?);";
	
	try {	
		Class.forName(Driver);	
		connection= DriverManager.getConnection(url, user, password);
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, score);
		preparedStatement.setInt(2, teacherNo);
		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		connection.close();
		
	} catch (Exception e) { 
		e.printStackTrace();
	} finally{
		
		if (resultSet != null) try { resultSet.close(); } catch(SQLException ex) {}
		if (preparedStatement != null) try { preparedStatement.close(); } catch(SQLException ex) {}
		if (connection != null) try { connection.close(); } catch(SQLException ex) {}
	}
	return result;
	
	}
	
}


