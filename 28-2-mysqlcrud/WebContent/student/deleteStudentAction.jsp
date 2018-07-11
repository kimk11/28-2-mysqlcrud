<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.StudentDAO"%>
<%@page import="service.StudentAddrDAO"%>
<%@page import="service.StudentScoreDAO"%>
<%@page import="service.Student"%>
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
	
	StudentAddrDAO studentAddrDao = new StudentAddrDAO();
	studentAddrDao.deleteStudentAddr(studentNo);
	
	StudentScoreDAO studentScoreDAO = new StudentScoreDAO();
	studentScoreDAO.deleteScore(studentNo);
	
	StudentDAO studentDao = new StudentDAO();
	studentDao.deleteStudent(studentNo);
	
	response.sendRedirect(request.getContextPath()+"/student/studentList.jsp");
%>
</body>
</html>