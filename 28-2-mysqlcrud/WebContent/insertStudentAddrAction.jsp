<!-- 28�� ������ -->
<!-- 2018-06-26 -->
<!-- studentaddr �Է� ó�� �ۼ� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.studentAddrDAO"%>
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
	<jsp:useBean id="studentAddr" class="service.StudentAddr"/>
	<jsp:setProperty property="*" name="studentAddr"/>
<%
	studentAddrDAO studentDao = new studentAddrDAO();
	studentDao.studentAddrInsert(studentAddr);
%>
</body>
</html>