<!-- 28�� ������ -->
<!-- 2018-07-02 -->
<!-- employee ����Ʈ ���� �ۼ� -->
<!-- ������ �۾� �߰� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeDAO"%>
<%@ page import="service.Employee"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
	table, th, td{
		border: 1px solid #0000ff;
	}
</style>

</head>
<body>
<%
	request.setCharacterEncoding("euckr");

	String word="";
	if(request.getParameter("word")!=null){
		word = request.getParameter("word");
	}
	System.out.print(word+"<<<<word");
%>
	<form action="<%= request.getContextPath() %>/Employee/employeeList.jsp" method="post">
		�̸��˻� : <input type="text" name="word">
		<button type="submit">�˻�</button>
	</form>
<%
	int currentPage = 1;
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPage = 2;
	EmployeeDAO employeeDao = new EmployeeDAO();
	ArrayList<Employee> employeeList =  employeeDao.selectEmployeeByPage(currentPage, rowPage, word);
	
%>
	<table>
		<tr>
			<th>employeeNo</th><th>employeeName</th><th>employeeAge</th><th>�ּ��Է�</th><th>����</th><th>����</th><th>�����Է�</th><th>��������</th>
																															<!-- ���ι� ���� -->
		</tr>
		<% 
			for(int i=0 ; i<employeeList.size() ; i++){
				Employee employee = employeeList.get(i);
				%>
				<tr>
					<td><%= employee.getEmployeeNo() %></td>
					<td><a href="<%= request.getContextPath() %>/Employee/employeeAddrList.jsp?employeeNo=<%= employee.getEmployeeNo() %>"><%= employee.getEmployeeName() %></a></td>
					<td><%= employee.getEmployeeAge() %></td>
					<td>
						<div>
							<form action="<%= request.getContextPath() %>/Employee/insertEmployeeAddrAction.jsp" method="post" name="formAction">
								<div>
									<input type="hidden" id="employeeNo" name="employeeNo" value="<%= employee.getEmployeeNo() %>">
								</div>
								<div>
									<label>�ּ� : </label>
									<input type="text"name="employeeAddrContent">
								</div>
								<div>
									<button type="submit" id="signEmployee">�Է�</button>
								</div>
							</form>
						</div>
					</td>
					<td><a href="<%= request.getContextPath() %>/Employee/deleteEmployeeAction.jsp?employeeNo=<%= employee.getEmployeeNo() %>">����</a></td>
					<td><a href="<%= request.getContextPath() %>/Employee/updateEmployeeForm.jsp?employeeNo=<%= employee.getEmployeeNo() %>">����</a></td>
					<td>
						<div>
							<form action="<%= request.getContextPath() %>/Employee/insertEmployScore.jsp" method="post" name="formAction">
								<div>
									<input type="hidden" id="employeeNo" name="employeeNo" value="<%= employee.getEmployeeNo() %>">
								</div>
								<div>
									<label>���� : </label>
									<input type="text" name="score">
								</div>
								<div>
									<button type="submit" id="signEmployee">�Է�</button>
								</div>
							</form>
						</div>
					</td>
					<td><a href="<%= request.getContextPath() %>/Employee/employeeAndScoreList.jsp?employeeNo=<%= employee.getEmployeeNo() %>">��������</a></td>
				</tr>
				<%
			}
		%>
	</table>
	
<!-- 	�˻�â -->
	<form>
		<div>
			�̸�:
			<input type="text" name="">
			<button type="submit">�˻�</button>
		</div>
	</form>
	
<%
	int count = employeeDao.currentPage();
	int startPage = 1;
	int lastPage = count/rowPage;
	if((count%rowPage)!=0){
		lastPage++;
	}
	
	if(currentPage>startPage){
		%>
			<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage-1 %>">����</a>
		<%
	}
	if(currentPage<lastPage){
		%>
			<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage+1 %>">����</a>
		<%
	}
%>
</body>
</html>