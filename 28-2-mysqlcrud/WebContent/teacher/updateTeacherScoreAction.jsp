<!-- 2018.07.12 ������ -->
<!-- updateTeacherScoreAction.jsp -->
<%@ page import="service.TeacherScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� ó�� ȭ��</title>
</head>
<body>
<%
	int score = Integer.parseInt(request.getParameter("score"));
	int no = Integer.parseInt(request.getParameter("teacherNo"));
	System.out.print("score :"+score);
	System.out.print("no :"+no);
	TeacherScoreDAO teacherScoreDao = new TeacherScoreDAO();
	teacherScoreDao.updateScore(no, score);
	
 	response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp"); 
%>
</body>
</html>