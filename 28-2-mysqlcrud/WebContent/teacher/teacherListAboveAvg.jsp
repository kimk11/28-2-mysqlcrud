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
		int avg = teacherScoreDao.scoreAvg(); //리턴된 결과값을 가져오기 위해 메서드를 사용한다 
		System.out.println(avg + "<--avg");
	%>
	<h2>평균보다 높은 리스트</h2>
	평균 :
	<span><%=avg%></span>

	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>점수</th>
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