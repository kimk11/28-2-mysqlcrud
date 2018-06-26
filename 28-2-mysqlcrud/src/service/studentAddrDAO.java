//28�� ������
//2018-06-26
//studentaddr DAO �ۼ�
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class studentAddrDAO {
	
	//studentAddr insert�޼���, ���ϰ� 0 = ���� ���� ����, 1 = �������� ����
	public int studentAddrInsert(StudentAddr studentAddr){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;
		
		String Driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mysqlcrud_2?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrud_2id";
		String password = "mysqlcrud_2pw";		//���� ���� 
		String sql="insert into student_addr(student_no,student_addr_content) values(?,?);";
		
		try {	
			Class.forName(Driver);	
				
			connection= DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, studentAddr.getStudentNo());
			preparedStatement.setString(2, studentAddr.getStudentAddrContent());
			
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
