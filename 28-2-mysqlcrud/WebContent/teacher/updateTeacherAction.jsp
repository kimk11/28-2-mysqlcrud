<!-- 2018.07.11 송유빈 -->
<!-- updateTeacherAction.jsp -->

<%@ page import="service.TeacherAddrDAO"%>
<%@ page import="service.TeacherDAO"%>
<%@ page import = "service.TeacherAddr" %>
<%@ page import = "service.Teacher" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수정 처리 화면</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euckr");
	
	int no = Integer.parseInt(request.getParameter("no"));
	System.out.println(no +"<--no");
	
	Teacher teacher = new Teacher(); 
	teacher.setTeacherNo(Integer.parseInt(request.getParameter("teacherNo")));
	teacher.setTeacherName(request.getParameter("teacherName"));
	teacher.setTeacherAge(Integer.parseInt(request.getParameter("teacherAge")));
	
	
	TeacherAddr teacherAddr = new TeacherAddr();
	teacherAddr.setTeacherAddrContent(request.getParameter("teacherAddrContent"));
	
	TeacherDAO teacherDao = new TeacherDAO();
	teacherDao.updateTeacher(teacher, no);
	
	TeacherAddrDAO teacherAddrDao = new TeacherAddrDAO();
	teacherAddrDao.updateTeacherAddr(teacherAddr, no);
	
	
/* 	response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp"); */
	%>
</body>
</html>