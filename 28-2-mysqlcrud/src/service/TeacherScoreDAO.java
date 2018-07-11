package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeacherScoreDAO {
	// 한 사람의 DB에 score 값이 있는지 없는지
	// 있으면 1 , 없으면 0
	public int selectCheck(int no) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		int check=0;	// 기본값 0으로 초기화
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="SELECT score FROM teacher_score WHERE teacher_no=?";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, no);
			resultset = preparedStatement.executeQuery();	// 쿼리의 결과를 resultSet으로 리턴
			// resultSet에 결과값이 있다면 다음 레코드로 
			if(resultset.next()) {
				check=1;		// 즉, 있다면  check 값은 1이 될 것이다.
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
	
	
	// 점수 입력 시 update(수정)처리
	public int updateScore(int no, int score) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		int result=0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="update teacher_score set score=? where teacher_no=?";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, score);
			preparedStatement.setInt(2, no);
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
	
		
		
	// 평균 구하기
	public int scoreAvg() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		int avg = 0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="select avg(score) from teacher_score";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			resultset = preparedStatement.executeQuery();
			if(resultset.next()) {	
				avg = resultset.getInt(1);		// resultSet에 결과 값이 있다면 
			}									// 첫 번째 결과값을 int 형으로 1인덱스에 넣는다
			
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
		
		return avg;		// int avg =0;에 결과값 리턴 
	}
	
	
	
	//평균보다 높은 teacher 리스트
	public ArrayList<TeacherAndScore> selectAvg() {
		System.out.println("04 selectAvg TeacherScoreDao.java");
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		ArrayList<TeacherAndScore> list = new ArrayList<>();
		String Driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";
		String sql = "SELECT t.teacher_no,t.teacher_name,ts.score FROM teacher t JOIN teacher_score ts ON t.teacher_no = ts.teacher_no WHERE ts.score >=(SELECT avg(score) FROM teacher_score)";

		try {
			Class.forName(Driver);
			connection = DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				TeacherAndScore teacherAndScore = new TeacherAndScore();
				Teacher teacher = new Teacher();
				TeacherScore teacherScore = new TeacherScore();
				teacher.setTeacherNo(resultSet.getInt(1));
				teacher.setTeacherName(resultSet.getString(2));
				teacherScore.setScore(resultSet.getInt(3));
				teacherAndScore.setTeacher(teacher);
				teacherAndScore.setTeacherScore(teacherScore);
				list.add(teacherAndScore);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (resultSet != null)
				try {
					resultSet.close();
				} catch (SQLException ex) {
				}
			if (preparedStatement != null)
				try {
					preparedStatement.close();
				} catch (SQLException ex) {
				}
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ex) {
				}
		}
		return list;
	}


	/* teacherAndScoreList.jsp의 점수보기 */
	public ArrayList<TeacherAndScore> selectTeacherAndScore(int teacherNo) {
		System.out.println("03 selectTeacherAndScore TeacherScoreDao.java");
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		ArrayList<TeacherAndScore> list = new ArrayList<>();
		String Driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";
		String sql = "SELECT ts.teacher_score_no, ts.teacher_no, t.teacher_name, t.teacher_age, ts.score FROM teacher_score ts INNER JOIN teacher t ON ts.teacher_no =t.teacher_no WHERE t.teacher_no = ?";

		try {
			Class.forName(Driver);
			connection = DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, teacherNo);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				TeacherAndScore teacherAndScore = new TeacherAndScore();
				Teacher teacher = new Teacher();
				TeacherScore teacherScore = new TeacherScore();
				
				// resultSet에 결과 값이 있다면 
				// 첫 번째 결과값을 int 형으로 인덱스 x 번째에 넣는다
				teacherScore.setTeacherScoreNo(resultSet.getInt(1));
				teacher.setTeacherNo(resultSet.getInt(2));
				teacher.setTeacherName(resultSet.getString(3));
				teacher.setTeacherAge(resultSet.getInt(4));
				teacherScore.setScore(resultSet.getInt(5));
				teacherAndScore.setTeacher(teacher);
				teacherAndScore.setTeacherScore(teacherScore);
				list.add(teacherAndScore);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (resultSet != null)
				try {
					resultSet.close();
				} catch (SQLException ex) {
				}
			if (preparedStatement != null)
				try {
					preparedStatement.close();
				} catch (SQLException ex) {
				}
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ex) {
				}
		}
		return list;
	}

	/*
	 * public void selectTeacherScore(int teacherNo) {
	 * System.out.println("02 selectTeacherScore TeacherScoreDao.java"); Connection
	 * connection = null; ResultSet resultSet = null; PreparedStatement
	 * preparedStatement = null; String Driver="com.mysql.jdbc.Driver"; String url=
	 * "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
	 * String user = "mysqlcrud_2id"; String password = "mysqlcrud_2pw"; String sql
	 * ="SELECT ts.teacher_score_no, ts.teacher_no, t.teacher_name, t.teacher_age, ts.score FROM teacher_score ts INNER JOIN teacher t ON ts.teacher_no =t.teacher_no WHERE teacher_score_no =?"
	 * ;
	 * 
	 * try { Class.forName(Driver); connection= DriverManager.getConnection(url,
	 * user, password); preparedStatement = connection.prepareStatement(sql);
	 * preparedStatement.setInt(1, teacherNo); preparedStatement.executeUpdate();
	 * 
	 * preparedStatement.close(); connection.close();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally{
	 * 
	 * if (resultSet != null) try { resultSet.close(); } catch(SQLException ex) {}
	 * if (preparedStatement != null) try { preparedStatement.close(); }
	 * catch(SQLException ex) {} if (connection != null) try { connection.close(); }
	 * catch(SQLException ex) {} } }
	 */

	public int insertTeacherScore(int score, int teacherNo) {
		System.out.println("01 insertTeacherScore TeacherScoreDao.java");
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		String Driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";
		String sql = "INSERT INTO teacher_score(teacher_no,score) VALUES(?,?);";

		try {
			Class.forName(Driver);
			connection = DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, score);
			preparedStatement.setInt(2, teacherNo);
			preparedStatement.executeUpdate();

			preparedStatement.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (resultSet != null)
				try {
					resultSet.close();
				} catch (SQLException ex) {
				}
			if (preparedStatement != null)
				try {
					preparedStatement.close();
				} catch (SQLException ex) {
				}
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException ex) {
				}
		}
		return result;

	}

}
