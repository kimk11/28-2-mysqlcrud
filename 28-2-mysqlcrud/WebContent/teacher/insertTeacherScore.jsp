<!-- 2018.07.11 송유빈 -->
<!-- insertTeacherScore.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherScoreDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>점수 입력</title>
</head>
<body>
	
<%
	int score = Integer.parseInt(request.getParameter("teacherScore")); 
	int no = Integer.parseInt(request.getParameter("teacherNo"));
	TeacherScoreDAO teacherScoreDao = new TeacherScoreDAO();
	teacherScoreDao.insertTeacherScore(score, no);
	
	response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
%>
</body>
</html>