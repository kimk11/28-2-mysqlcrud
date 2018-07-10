<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeScoreDAO" %>
<%@ page import="service.EmployeeAndScore" %>
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
	<h2>점수 평균 리스트</h2>
<%
	EmployeeScoreDAO employeeScoreDAO = new EmployeeScoreDAO();
	int avg = employeeScoreDAO.selectAvgScore();
%>
	<div>
		<p>평균 : <%= avg %></p>
	</div>
<%
	ArrayList<EmployeeAndScore> arAvgList= employeeScoreDAO.selectAvgJoin();
%>
	<div>
		<table>
			<thead>
				<tr>
					<th>번호</th><th>이름</th><th>점수</th>
				</tr>
			</thead>
<%
			for(int i=0 ; i<arAvgList.size() ; i++){
				EmployeeAndScore employeeAndScore = arAvgList.get(i);
%>	
				<tbody>
					<tr>
						<td><%= employeeAndScore.getEmployee().getEmployeeNo() %></td>
						<td><%= employeeAndScore.getEmployee().getEmployeeName() %></td>
						<td><%= employeeAndScore.getEmployeeScore().getScore() %></td>
					</tr>
				</tbody>
<%
			}
%>
		</table>
	</div>

</body>
</html>