//28�� ������
//2018-06-26
//employee DAO �ۼ�
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmployeeDAO {
	//studentAddr insert�޼���, ���ϰ� 0 = ���� ���� ����, 1 = �������� ����
	public int employeeInsert(Employee employee){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//���� ���� 
		String sql="insert into employee(employee_name,employee_age) values(?,?);";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, employee.getEmployeeName());
			preparedStatement.setInt(2, employee.getEmployeeAge());
			
			result = preparedStatement.executeUpdate();
			
			preparedStatement.close();
			connection.close();
		} catch (Exception e) { //try�� �ȿ��� ���ܰ� �߻������� ����Ǵ� ����
			e.printStackTrace();
		} finally { //���ܿ� ������� �׻� ����Ǵ� ����
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
