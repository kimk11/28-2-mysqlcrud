<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAndScore" %>
<%@ page import="service.StudentScoreDAO" %>
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