//28기 김진우
//2018-06-26
//employeeaddr DAO 작성
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmployeeAddrDAO {
// <employeeAddr테이블 데이터 추가 메서드 start>
	//employeeAddr insert작성, 리턴값 0 = 쿼리실행 실패, 1 = 쿼리 실행 성공
	public int employeeAddrInsert(EmployeeAddr employeeAddr){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//연결 정보
		String sql="INSERT INTO employee_addr(employee_no,employee_addr_content) VALUES(?,?);";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, employeeAddr.getEmployeeNo());
			preparedStatement.setString(2, employeeAddr.getEmployeeAddrContent());
			
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
// <employeeAddr테이블 데이터 추가 메서드 end>

// <employeeAddr테이블 데이터 조회 메서드 start>
	//employeeAddr테이블 리스트로 보기 메서드 _page작업
		public ArrayList<EmployeeAddr> selectEmployeeAddrByPage(int page, int pagePerRow){
			ArrayList<EmployeeAddr> empployeeAddrList = new ArrayList<>();
			
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultset = null;
			
			String className="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String user = "mysqlcrud_2id";
			String password = "mysqlcrud_2pw";		
			String sql="SELECT employee_addr_content FROM employee_addr LIMIT ?,?";
			
			try {
				Class.forName(className);
				connection= DriverManager.getConnection(url, user, password);
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, (page-1)*pagePerRow);
				preparedStatement.setInt(2, pagePerRow);
				resultset = preparedStatement.executeQuery();
				while(resultset.next()) {
					EmployeeAddr employeeAddr = new EmployeeAddr();
					employeeAddr.setEmployeeAddrContent(resultset.getString(1));
					empployeeAddrList.add(employeeAddr);
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
			
			return empployeeAddrList;
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
			String sql="SELECT count(employee_addr_no) as count FROM employee_addr";
			
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
// <employeeAddr테이블 데이터 조회 메서드 end>

// <employeeAddr테이블 데이터 수정 메서드 start>
// <employeeAddr테이블 데이터 수정 메서드 end>

// <employeeAddr테이블 데이터 삭제 메서드 start>
// <employeeAddr테이블 데이터 삭제 메서드 end>
}
