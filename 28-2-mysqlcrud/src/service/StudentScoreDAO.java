package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentScoreDAO {
//  <score 테이블 데이터 추가 메서드 start>
	//한사람당 하나의 값만 들어가고 있다면 값을 수정할 수 있도록 확인
	//리턴값  - 0 : 없음, 1 : 있음
	public int selectCheck(int studentNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		int check=0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="select student_score_no from student_score where student_no=?";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, studentNo);
			resultset = preparedStatement.executeQuery();
			if(resultset.next()) {
				check=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(resultset != null) {
				try {
					resultset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
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
		return check;
	}
	//테이블에 데이터 추가
	//리턴값 - 0 : 실패, 1 : 성공
	public int insertScore(int studentNo, int score) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		int result=0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="insert into student_score(student_no,score) values(?, ?)";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, studentNo);
			preparedStatement.setInt(2, score);
			result = preparedStatement.executeUpdate();
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
		
		return result;
	}
	//테이블에 데이터 수정
	//리턴값 - 0 : 실패, 1 : 성공
	public int updateScore(int studentNo, int score) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		int result=0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="update student_score set score=? where student_no=?";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, score);
			preparedStatement.setInt(2, studentNo);
			result = preparedStatement.executeUpdate();
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
		
		return result;
	}
//  <score 테이블 데이터 추가 메서드 end>
	
//	<Student와 score 테이블을 조인한 결과를 리턴해주는 메서드 start>
	
	public ArrayList<StudentAndScore> selectJoin(int studentNo){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		ArrayList<StudentAndScore> arJoinList = new ArrayList<>();
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="select s.student_no, s.student_name, s.student_age, ss.student_score_no, ss.score from student s join student_score ss on s.student_no = ss.student_no where s.student_no=?";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, studentNo);
			resultset = preparedStatement.executeQuery();
			while(resultset.next()) {
				StudentAndScore studentAndScore = new StudentAndScore();
				Student student = new Student();
				StudentScore studentScore = new StudentScore();
				student.setStudentNo(resultset.getInt(1));
				student.setStudentName(resultset.getString(2));
				student.setStudentAge(resultset.getInt(3));
				studentScore.setStudentScoreNo(resultset.getInt(4));
				studentScore.setScore(resultset.getInt(5));
				studentAndScore.setStudent(student);
				studentAndScore.setStudentScore(studentScore);
				arJoinList.add(studentAndScore);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(resultset != null) {
				try {
					resultset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
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
		
		return arJoinList;
	}
	
	
//	<Student와 score 테이블을 조인한 결과를 리턴해주는 메서드 end>

//	<Student와 score 테이블을 조인하여 score컴럼의 평균보다 높은 사람만 조회하는 메서드 start>
	public int selectAvgScore() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		int avg = 0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="select avg(score) from student_score";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			resultset = preparedStatement.executeQuery();
			if(resultset.next()) {
				avg = resultset.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(resultset != null) {
				try {
					resultset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
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
		
		return avg;
	}
	//score의 평균보다 높은 사람만 조회하는 메서드
	public ArrayList<StudentAndScore> selectAvgJoin(){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		ArrayList<StudentAndScore> arJoinList = new ArrayList<>();
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="select s.student_no, s.student_name, ss.score from student s join student_score ss on s.student_no = ss.student_no where ss.score>=(select avg(score) from student_score)";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			resultset = preparedStatement.executeQuery();
			while(resultset.next()) {
				StudentAndScore studentAndScore = new StudentAndScore();
				Student student = new Student();
				StudentScore studentScore = new StudentScore();
				student.setStudentNo(resultset.getInt(1));
				student.setStudentName(resultset.getString(2));
				studentScore.setScore(resultset.getInt(3));
				studentAndScore.setStudent(student);
				studentAndScore.setStudentScore(studentScore);
				arJoinList.add(studentAndScore);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(resultset != null) {
				try {
					resultset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
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
		
		return arJoinList;
	}
//	<Student와 score 테이블을 조인하여 score컴럼의 평균보다 높은 사람만 조회하는 메서드 end>
}
