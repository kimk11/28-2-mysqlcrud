<!-- 28�� ������ -->
<!-- 2018-06-26 -->
<!-- employee �Է� ó�� �ۼ� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.EmployeeDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
<%
	request.setCharacterEncoding("euckr");
%>
	<jsp:useBean id="employee" class="service.Employee"/>
	<jsp:setProperty property="*" name="employee"/>
<%
	EmployeeDAO employeeDao = new EmployeeDAO();
	employeeDao.employeeInsert(employee);
%>
</body>
</html>