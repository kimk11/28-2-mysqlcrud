//28기 김진우
//2018-06-26
//employee DAO 작성
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmployeeDAO {
// <employee테이블 데이터 추가 메서드 start>
	//employee insert작성, 리턴값 0 = 쿼리실행 실패, 1 = 쿼리 실행 성공
	public int employeeInsert(Employee employee){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="INSERT INTO employee(employee_name,employee_age) VALUES(?,?)";
		
		try {	
			Class.forName(className);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, employee.getEmployeeName());
			preparedStatement.setInt(2, employee.getEmployeeAge());
			
			result = preparedStatement.executeUpdate();
			
			preparedStatement.close();
			connection.close();
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
// <employee테이블 데이터 추가 메서드 end>

// <employee테이블 데이터 조회 메서드 start>
	//employee테이블 리스트로 보기 - 메서드 _page작업, 검색작업
	// word의 값 : "" -> 쿼리 1 - 공백일 경우
	// word의 값 : "검색단어" -> 쿼리 2 - 검색어가 있을 경우
	
	public ArrayList<Employee> selectEmployeeByPage(int page, int pagePerRow, String word){
		ArrayList<Employee> empployeeList = new ArrayList<>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="SELECT employee_no,employee_name,employee_age FROM employee LIMIT ?,?";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			
			if(word.equals("")) {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, (page-1)*pagePerRow);
				preparedStatement.setInt(2, pagePerRow);
			}else {
				sql="SELECT employee_no,employee_name,employee_age FROM employee where employee_name like ? LIMIT ?,? ";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, "%"+word+"%");
				preparedStatement.setInt(2, (page-1)*pagePerRow);
				preparedStatement.setInt(3, pagePerRow);
			}
			
			resultset = preparedStatement.executeQuery();
			while(resultset.next()) {
				Employee employee = new Employee();
				employee.setEmployeeNo(resultset.getInt(1));
				employee.setEmployeeName(resultset.getString(2));
				employee.setEmployeeAge(resultset.getInt(3));
				empployeeList.add(employee);
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
		
		return empployeeList;
	}
	
	// db에 저장된 데이터의 갯수를 구하는 메서드
	public int currentPage() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		int count = 0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="SELECT count(employee_no) as count FROM employee";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			resultset = preparedStatement.executeQuery();
			if(resultset.next()) {
				count=resultset.getInt(1);
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
		return count;
	}
// <employee테이블 데이터 조회 메서드 end>

// <employee테이블 데이터 수정 메서드 start>
	//수정 폼에 가져올 데이터 조회
	public Employee selectOneEmployee(int employeeNo) {
		Employee employee = new Employee();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="SELECT employee_no,employee_name,employee_age FROM employee where employee_no = ? ";
		
		try {
			Class.forName(className);
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, employeeNo);
			resultset = preparedStatement.executeQuery();
			if(resultset.next()) {
				employee.setEmployeeNo(resultset.getInt(1));
				employee.setEmployeeName(resultset.getString(2));
				employee.setEmployeeAge(resultset.getInt(3));
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
		return employee;
	}
	
	// 수정폼에서 가져온 값으로 db데이터 변경
	public int updateEmployee(Employee employee) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="update employee set employee_name = ?,employee_age = ? where employee_no = ?";
		
		try {	
			Class.forName(className);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, employee.getEmployeeName());
			preparedStatement.setInt(2, employee.getEmployeeAge());
			preparedStatement.setInt(3, employee.getEmployeeNo());
			
			result = preparedStatement.executeUpdate();
			
			preparedStatement.close();
			connection.close();
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
// <employee테이블 데이터 수정 메서드 end>

// <employee테이블 데이터 삭제 메서드 start>
	public int deleteEmployee(int employeeNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String className="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		
		String sql="DELETE FROM employee WHERE employee_no=?";
		
		try {	
			Class.forName(className);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, employeeNo);
			
			result = preparedStatement.executeUpdate();
			
			preparedStatement.close();
			connection.close();
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
// <employee테이블 데이터 삭제 메서드 end>
}
