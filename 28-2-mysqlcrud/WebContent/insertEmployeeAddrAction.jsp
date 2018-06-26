<!-- 28기 김진우 -->
<!-- 2018-06-26 -->
<!-- employee 입력 처리 작성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.EmployeeAddrDAO"%>
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
	<jsp:useBean id="employeeAddr" class="service.EmployeeAddr"/>
	<jsp:setProperty property="*" name="employeeAddr"/>
<%
	EmployeeAddrDAO employeeAddrDao = new EmployeeAddrDAO();
	employeeAddrDao.employeeAddrInsert(employeeAddr);
%>
</body>
</html>