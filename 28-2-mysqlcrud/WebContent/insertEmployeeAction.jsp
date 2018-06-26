<!-- 28기 김진우 -->
<!-- 2018-06-26 -->
<!-- employee 입력 처리 작성 -->
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

	Employee employee = new Employee();
	
	employee.setEmployeeName(request.getParameter("employeeName"));
	employee.setEmployeeAge(Integer.parseInt(request.getParameter("employeeAge")));
	
	EmployeeDAO employeeDao = new EmployeeDAO();
	employeeDao.employeeInsert(employee);
%>

</body>
</html>