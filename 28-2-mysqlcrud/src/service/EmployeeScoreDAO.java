package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmployeeScoreDAO {
//  <score 테이블 데이터 추가 메서드 start>
	//한사람당 하나의 값만 들어가고 있다면 값을 수정할 수 있도록 확인
	//리턴값  - 0 : 없음, 1 : 있음
	public int selectCheck(int employeeNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		int check=0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="select employee_score_no from employee_score where employee_no=?";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, employeeNo);
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
	public int insertScore(int employeeNo, int score) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		int result=0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="insert into employee_score(employee_no,score) values(?, ?)";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, employeeNo);
			preparedStatement.setInt(2, score);
			result = preparedStatement.executeUpdate();
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
		
		return result;
	}
	//테이블에 데이터 수정
	//리턴값 - 0 : 실패, 1 : 성공
	public int updateScore(int employeeNo, int score) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		int result=0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="update employee_score set score=? where employee_no=?";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, score);
			preparedStatement.setInt(2, employeeNo);
			result = preparedStatement.executeUpdate();
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
		
		return result;
	}
//  <score 테이블 데이터 추가 메서드 end>
	
//	<employee와 score 테이블을 조인한 결과를 리턴해주는 메서드 start>
	
	public ArrayList<EmployeeAndScore> selectJoin(int employeeNo){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		ArrayList<EmployeeAndScore> arJoinList = new ArrayList<>();
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="SELECT e.employee_no, e.employee_name, e.employee_age, es.employee_score_no, es.score FROM employee_score es JOIN employee e on es.employee_no = e.employee_no where e.employee_no=?";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, employeeNo);
			resultset = preparedStatement.executeQuery();
			while(resultset.next()) {
				EmployeeAndScore employeeAndScore = new EmployeeAndScore();
				Employee employee = new Employee();
				EmployeeScore employeeScore = new EmployeeScore();
				employee.setEmployeeNo(resultset.getInt(1));
				employee.setEmployeeName(resultset.getString(2));
				employee.setEmployeeAge(resultset.getInt(3));
				employeeScore.setEmployeeScoreNo(resultset.getInt(4));
				employeeScore.setScore(resultset.getInt(5));
				employeeAndScore.setEmployee(employee);
				employeeAndScore.setEmployeeScore(employeeScore);
				arJoinList.add(employeeAndScore);
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
	
//	<employee와 score 테이블을 조인한 결과를 리턴해주는 메서드 end>
}
