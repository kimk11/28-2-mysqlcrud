<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentScoreDAO" %>
<%@ page import="service.StudentAndScore" %>
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
	<h2>���� ��� ����Ʈ</h2>
<%
	StudentScoreDAO studentScoreDAO = new StudentScoreDAO();
	int avg = studentScoreDAO.selectAvgScore();
%>
	<div>
		<p>��� : <%= avg %></p>
	</div>
<%
	ArrayList<StudentAndScore> arAvgList= studentScoreDAO.selectAvgJoin();
%>
	<div>
		<table>
			<thead>
				<tr>
					<th>��ȣ</th><th>�̸�</th><th>����</th>
				</tr>
			</thead>
<%
			for(int i=0 ; i<arAvgList.size() ; i++){
				StudentAndScore studentAndScore = arAvgList.get(i);
%>	
				<tbody>
					<tr>
						<td><%= studentAndScore.getStudent().getStudentNo() %></td>
						<td><%= studentAndScore.getStudent().getStudentName() %></td>
						<td><%= studentAndScore.getStudentScore().getScore() %></td>
					</tr>
				</tbody>
<%
			}
%>
		</table>
	</div>
</body>
</html>