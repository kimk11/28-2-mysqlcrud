//28�� ������
//2018-06-26
//employee DAO �ۼ�
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmployeeDAO {
	//studentAddr insert�޼���
		public void employeeInsert(Employee employee){
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			
			String Driver="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String user = "mysqlcrud_2id";
			String password = "mysqlcrud_2pw";		//���� ���� 
			String sql="insert into employee(employee_name,employee_age) values(?,?);";
			
			try {	
				Class.forName(Driver);		//����̹� ����
					
				connection= DriverManager.getConnection(url, user, password);
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, employee.getEmployeeName());
				preparedStatement.setInt(2, employee.getEmployeeAge());
				
				preparedStatement.executeUpdate();
				
				preparedStatement.close();
				connection.close();
			} catch (Exception e) { //try�� �ȿ��� ���ܰ� �߻������� ����Ǵ� ����
				
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
		}
}
