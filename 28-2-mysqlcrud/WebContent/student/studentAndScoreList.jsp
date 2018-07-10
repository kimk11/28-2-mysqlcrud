<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAndScore" %>
<%@ page import="service.StudentScoreDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
	table, th, td{
		border: 1px solid #0000ff;
	}
</style>
</head>
<body>
<%
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));

	StudentScoreDAO studentScoreDAO = new StudentScoreDAO();
	ArrayList<StudentAndScore> arJoinList = studentScoreDAO.selectJoin(studentNo);
	System.out.print(arJoinList.get(0).getStudent().getStudentName());
%>
	<div>
		<table>
			<thead>
				<tr>
					<th>번호</th><th>이름</th><th>나이</th><th>점수번호</th><th>점수</th>
				</tr>
			</thead>
<%
				for(int i=0 ; i<arJoinList.size() ; i++){
					StudentAndScore studentAndScore = arJoinList.get(i);
%>
			<tbody>
				<tr>
					<td><%= studentAndScore.getStudent().getStudentNo() %></td>
					<td><%= studentAndScore.getStudent().getStudentName() %></td>
					<td><%= studentAndScore.getStudent().getStudentAge() %></td>
					<td><%= studentAndScore.getStudentScore().getStudentScoreNo() %></td>
					<td><%= studentAndScore.getStudentScore().getScore() %></td>
				</tr>
			</tbody>
<%
				}
%>
		</table>
	</div>
	<div>
		<button type="button" id="btn">뒤로가기</button>
	</div>
	
<script type="text/javascript">
	var btn = document.getElementById('btn');
	btn.addEventListener('click', function() {
		history.back();
	});
</script>
</body>
</html>