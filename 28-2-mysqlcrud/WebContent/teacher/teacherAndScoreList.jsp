<!-- 2018.07.11  ������ -->
<!-- teacherAndScoreList.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="service.TeacherScoreDAO" %>
<%@ page import ="service.TeacherAndScore" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>
<style>
	table, tr, td {
		border : solid 1px #000000;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	System.out.print(no +"<--no");
	TeacherScoreDAO teacherScoreDao = new TeacherScoreDAO();
	ArrayList<TeacherAndScore> list = teacherScoreDao.selectTeacherAndScore(no);
	

%>

<table>
	<tr>
		<th>����</th>
		<th>��ȣ</th>
		<th>�̸�</th>
		<th>����</th>
		<th>����</th>
	</tr>	
<%
	for(int i=0 ; i<list.size() ; i++){
		TeacherAndScore teacherAndScore = list.get(i);
%>
	<tr>
		<td><%= teacherAndScore.getTeacherScore().getTeacherScoreNo()%></td>
		<td><%= teacherAndScore.getTeacher().getTeacherNo()%></td>
		<td><%= teacherAndScore.getTeacher().getTeacherName()%></td>
		<td><%= teacherAndScore.getTeacher().getTeacherAge()%></td>
		<td><%= teacherAndScore.getTeacherScore().getScore()%></td>
	</tr>
<%
	}
%>
</table>
</body>
</html>