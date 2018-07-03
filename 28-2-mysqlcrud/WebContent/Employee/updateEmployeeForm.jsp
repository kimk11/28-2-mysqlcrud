<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.EmployeeDAO"%>
<%@page import="service.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euckr");
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	
	EmployeeDAO employeeDao = new EmployeeDAO();
	Employee employee =  employeeDao.selectOneEmployee(employeeNo);
%>

	<div>
		<form action="<%= request.getContextPath() %>/Employee/updateEmployeeAction.jsp" method="post" name="formAction">
			<p>employeeAddr 입력</p>
			<div>
				<input type="hidden" name="employeeNo" value="<%= employee.getEmployeeNo() %>">
			</div>
			<div>
				<label>이름 : </label>
				<input type="text" id="employeeName" name="employeeName" value="<%= employee.getEmployeeName() %>">
				<span id="employeeNameValid"></span>
			</div>
			<div>
				<label>나이 : </label>
				<input type="text" id="employeeAge" name="employeeAge" value="<%= employee.getEmployeeAge() %>">
				<span id="employeeAgeValid"></span>
			</div>
			<div>
				<button type="submit" id="signEmployee">입력</button>
			</div>
		</form>
	</div>
</body>
</html>