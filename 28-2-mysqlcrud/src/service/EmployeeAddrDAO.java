//28�� ������
//2018-06-26
//employeeaddr DAO �ۼ�
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmployeeAddrDAO {
	//studentAddr insert�޼���
		public void employeeAddrInsert(EmployeeAddr employeeAddr){
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			
			String Driver="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
			String user = "mysqlcrud_2id";
			String password = "mysqlcrud_2pw";		//���� ���� 
			String sql="insert into employee_addr(employee_no,employee_addr_content) values(?,?);";
			
			try {	
				Class.forName(Driver);		//����̹� ����
					
				connection= DriverManager.getConnection(url, user, password);
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, employeeAddr.getEmployeeNo());
				preparedStatement.setString(2, employeeAddr.getEmployeeAddrContent());
				
				preparedStatement.executeUpdate();
				
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
		}
}
