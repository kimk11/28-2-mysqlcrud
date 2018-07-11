<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeScoreDAO" %>
<%@ page import="service.EmployeeAndScore" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />

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
<div id="wrapper clearfix">
	<div id="header">
			<h1>&lt;/&gt; 28 - 2 mysqlcrud</h1>
	</div>
	
	<div id="left">
		<div>
			<ul class="menuOne">
				<li>
					Insert
					<ul class="menuTwo">
						<li><a href="<%= request.getContextPath() %>/Employee/insertEmployeeForm.jsp">Employee</a></li>
						<li><a href="<%= request.getContextPath() %>/member/insertMemberForm.jsp">Member</a></li>
						<li><a href="<%= request.getContextPath() %>/student/insertStudentForm.jsp">Student</a></li>
						<li><a href="<%= request.getContextPath() %>/teacher/insertTeacherForm.jsp">Teacher</a></li>
					</ul>
				</li>
				<li>
					List
					<ul class="menuTwo">
						<li><a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">Employee</a></li>
						<li><a href="<%= request.getContextPath() %>/member/memberList.jsp">Member</a></li>
						<li><a href="<%= request.getContextPath() %>/student/studentList.jsp">Student</a></li>
						<li><a href="<%= request.getContextPath() %>/teacher/teacherList.jsp">Teacher</a></li>
					</ul>
				</li>
				<li>
					ScoreAVG
					<ul class="menuTwo">
						<li><a href="<%= request.getContextPath() %>/Employee/eployeeListAboveAvg.jsp">Employee</a></li>
						<li><a href="<%= request.getContextPath() %>/member/memberListAboveAvg.jsp">Member</a></li>
						<li><a href="<%= request.getContextPath() %>/student/studentListAboveAvg.jsp">Student</a></li>
						<li><a href="<%= request.getContextPath() %>/teacher/teacherListAboveAvg.jsp">Teacher</a></li>
					</ul>
				</li>
			</ul>
		</div>
		
	</div>
	
	<div id="light">
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
	</div>
	
	<div id="bottom">
	
	</div>
</div>
</body>
</html>