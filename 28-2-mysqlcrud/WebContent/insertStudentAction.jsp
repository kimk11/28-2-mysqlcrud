<!-- 28�� ������ -->
<!-- 2018-06-26 -->
<!-- student �Է� ó�� �ۼ� -->
<%@page import="service.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
	<jsp:useBean id="student" class="service.Student"/>
	<jsp:setProperty property="*" name="student"/>
<%
	StudentDAO studentDao = new StudentDAO();
	studentDao.studentInsert(student);
%>
</body>
</html>