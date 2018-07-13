<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.StudentScoreDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euckr");
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	int studentScore = Integer.parseInt(request.getParameter("studentScore"));
	new StudentScoreDAO().updateScore(studentNo, studentScore);
	
	response.sendRedirect(request.getContextPath()+"/student/studentList.jsp");
%>
</body>
</html>