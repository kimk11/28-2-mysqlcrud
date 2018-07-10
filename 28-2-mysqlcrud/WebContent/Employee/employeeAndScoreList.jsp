<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeAndScore" %>
<%@ page import="service.EmployeeScoreDAO" %>
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
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));

	EmployeeScoreDAO employeeScoreDAO = new EmployeeScoreDAO();
	ArrayList<EmployeeAndScore> arJoinList = employeeScoreDAO.selectJoin(employeeNo);
	System.out.print(arJoinList.get(0).getEmployee().getEmployeeNo());
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
					EmployeeAndScore employeeAndScore = arJoinList.get(i);
%>
			<tbody>
				<tr>
					<td><%= employeeAndScore.getEmployee().getEmployeeNo() %></td>
					<td><%= employeeAndScore.getEmployee().getEmployeeName() %></td>
					<td><%= employeeAndScore.getEmployee().getEmployeeAge() %></td>
					<td><%= employeeAndScore.getEmployeeScore().getEmployeeScoreNo() %></td>
					<td><%= employeeAndScore.getEmployeeScore().getScore() %></td>
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