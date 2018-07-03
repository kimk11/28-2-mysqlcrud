<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.StudentDAO"%>
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

	Student student = new Student();
	
	student.setStudentNo(Integer.parseInt(request.getParameter("studentNo")));
	student.setStudentName(request.getParameter("studentName"));
	student.setStudentAge(Integer.parseInt(request.getParameter("studentAge")));
	
	StudentDAO studentDao = new StudentDAO();
	studentDao.updatestudent(student);
	
	response.sendRedirect(request.getContextPath()+"/student/studentList.jsp");
%>
</body>
</html>