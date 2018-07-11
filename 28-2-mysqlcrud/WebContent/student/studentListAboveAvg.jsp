<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentScoreDAO" %>
<%@ page import="service.StudentAndScore" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/table.css" />

<style type="text/css">
.centered { display: table; margin-left: auto; margin-right: auto; }
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
		<div class="centered">
			<h2>점수 평균 리스트</h2>
		<%
			StudentScoreDAO studentScoreDAO = new StudentScoreDAO();
			int avg = studentScoreDAO.selectAvgScore();
		%>
			<div>
				<p>평균 : <%= avg %></p>
			</div>
		<%
			ArrayList<StudentAndScore> arAvgList= studentScoreDAO.selectAvgJoin();
		%>
			<div>
				<table>
					<thead>
						<tr class="even">
							<th>번호</th><th>이름</th><th>점수</th>
						</tr>
					</thead>
		<%
					for(int i=0 ; i<arAvgList.size() ; i++){
						StudentAndScore studentAndScore = arAvgList.get(i);
		%>	
						<tbody>
							<tr class="even">
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
		</div>
	</div>
	
	<div id="bottom">
	
	</div>
</div>
</body>
</html>