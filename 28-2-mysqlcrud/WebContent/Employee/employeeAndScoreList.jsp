<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeAndScore" %>
<%@ page import="service.EmployeeScoreDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/table.css" />

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
	<%
		int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	
		EmployeeScoreDAO employeeScoreDAO = new EmployeeScoreDAO();
		ArrayList<EmployeeAndScore> arJoinList = employeeScoreDAO.selectJoin(employeeNo);
		System.out.print(arJoinList.get(0).getEmployee().getEmployeeNo());
	%>
		<div>
			<table>
				<thead>
					<tr class="even">
						<th>번호</th><th>이름</th><th>나이</th><th>점수번호</th><th>점수</th>
					</tr>
				</thead>
	<%
					for(int i=0 ; i<arJoinList.size() ; i++){
						EmployeeAndScore employeeAndScore = arJoinList.get(i);
	%>
				<tbody>
					<tr class="even">
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
	</div>
	
	<div id="bottom">
	
	</div>
</div>
<script type="text/javascript">
	var btn = document.getElementById('btn');
	btn.addEventListener('click', function() {
		history.back();
	});
</script>
</body>
</html>