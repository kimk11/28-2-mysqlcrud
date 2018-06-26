//28기 김진우
//2018-06-26
//employeeaddr DAO 작성
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmployeeAddrDAO {
	//studentAddr insert메서드
		public void employeeAddrInsert(EmployeeAddr employeeAddr){
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			
			String Driver="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String user = "mysqlcrud_2id";
			String password = "mysqlcrud_2pw";		//연결 정보 
			String sql="insert into employee_addr(employee_no,employee_addr_content) values(?,?);";
			
			try {	
				Class.forName(Driver);		//드라이버 연결
					
				connection= DriverManager.getConnection(url, user, password);
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, employeeAddr.getEmployeeNo());
				preparedStatement.setString(2, employeeAddr.getEmployeeAddrContent());
				
				preparedStatement.executeUpdate();
				
				preparedStatement.close();
				connection.close();
			} catch (Exception e) { //try문 안에서 예외가 발생했을시 실행되는 문장
				e.printStackTrace();
			} finally { //예외와 관계없이 항상 실행되는 문장
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
		}
}
