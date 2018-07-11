<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.TeacherScoreDAO"%>
<%@ page import="service.TeacherAndScore"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
table, th, td, tr {
	border: solid 1px #000000;
	border-collapse: collapse;		
}
</style>
</head>
<body>
	<%
		TeacherScoreDAO teacherScoreDao = new TeacherScoreDAO();
		ArrayList<TeacherAndScore> list = teacherScoreDao.selectAvg();
		int avg = teacherScoreDao.scoreAvg(); //���ϵ� ������� �������� ���� �޼��带 ����Ѵ� 
		System.out.println(avg + "<--avg");
	%>
	<h2>��պ��� ���� ����Ʈ</h2>
	��� :
	<span><%=avg%></span>

	<table>
		<tr>
			<th>��ȣ</th>
			<th>�̸�</th>
			<th>����</th>
		</tr>
		<%
			for (int i = 0; i < list.size(); i++) {
				TeacherAndScore teacherAndScore = list.get(i);
		%>
		<tr>
			<td><%=teacherAndScore.getTeacher().getTeacherNo()%></td>
			<td><%=teacherAndScore.getTeacher().getTeacherName()%></td>
			<td><%=teacherAndScore.getTeacherScore().getScore()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>