<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.EmployeeDAO"%>
<%@page import="service.EmployeeAddrDAO"%>
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
	
	EmployeeAddrDAO employeeAddrDao = new EmployeeAddrDAO();
	employeeAddrDao.deleteEmployeeAddr(employeeNo);
	
	EmployeeDAO employeeDao = new EmployeeDAO();
	employeeDao.deleteEmployee(employeeNo);
	
	response.sendRedirect(request.getContextPath()+"/Employee/employeeList.jsp");
%>

</body>
</html>