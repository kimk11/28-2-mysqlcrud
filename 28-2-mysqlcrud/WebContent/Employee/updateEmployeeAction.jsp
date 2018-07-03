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
	
	employee.setEmployeeNo(Integer.parseInt(request.getParameter("employeeNo")));
	employee.setEmployeeName(request.getParameter("employeeName"));
	employee.setEmployeeAge(Integer.parseInt(request.getParameter("employeeAge")));
	
	EmployeeDAO employeeDao = new EmployeeDAO();
	employeeDao.updateEmployee(employee);
	
	response.sendRedirect(request.getContextPath()+"/Employee/employeeList.jsp");
%>
</body>
</html>