<!-- 28기 김진우 -->
<!-- 2018-06-26 -->
<!-- student 입력 처리 작성 -->
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
	
	student.setStudentName(request.getParameter("StudentName"));
	student.setStudentAge(Integer.parseInt(request.getParameter("StudentAge")));

	StudentDAO studentDao = new StudentDAO();
	studentDao.studentInsert(student);
%>
</body>
</html>