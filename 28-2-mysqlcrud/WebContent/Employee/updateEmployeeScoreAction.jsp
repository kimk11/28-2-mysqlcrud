<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.EmployeeScoreDAO"%>
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
	int employeScore = Integer.parseInt(request.getParameter("employeScore"));
	new EmployeeScoreDAO().updateScore(employeeNo, employeScore);
	
	response.sendRedirect(request.getContextPath()+"/Employee/employeeList.jsp");
%>
</body>
</html>