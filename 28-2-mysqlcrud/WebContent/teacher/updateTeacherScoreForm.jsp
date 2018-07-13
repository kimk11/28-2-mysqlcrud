<!-- 2018.07.12 송유빈 -->
<!-- updateTeacherScore.jsp -->
<%@page import="service.TeacherScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="service.TeacherAndScore" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>점수 수정화면</title>
<style>
table, th, td, tr {
	border-collapse: collapse;
}
</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css" />
</head>
<body>
	<div id="wrapper clearfix">
		<div id="header">
			<h1>&lt;/&gt; 28 - 2 mysqlcrud</h1>
		</div>
		<!-- left 왼쪽메뉴 -->
		<div id="left">
			<div>
				<ul class="menuOne">
					<li>Insert
						<ul class="menuTwo">
							<li><a href="<%= request.getContextPath() %>/Employee/insertEmployeeForm.jsp">Employee</a></li>
							<li><a href="<%= request.getContextPath() %>/member/insertMemberForm.jsp">Member</a></li>
							<li><a href="<%= request.getContextPath() %>/student/insertStudentForm.jsp">Student</a></li>
							<li><a href="<%= request.getContextPath() %>/teacher/insertTeacherForm.jsp">Teacher</a></li>
						</ul>
					</li>
					<li>List
						<ul class="menuTwo">
							<li><a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">Employee</a></li>
							<li><a href="<%= request.getContextPath() %>/member/memberList.jsp">Member</a></li>
							<li><a href="<%= request.getContextPath() %>/student/studentList.jsp">Student</a></li>
							<li><a href="<%= request.getContextPath() %>/teacher/teacherList.jsp">Teacher</a></li>
						</ul>
					</li>
					<li>ScoreAVG
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
		<!-- light 중앙메뉴 -->
		<div id="light">
	<%
		int no = Integer.parseInt(request.getParameter("teacherNo"));
		TeacherAndScore teacherAndScore =new TeacherAndScore();
		TeacherScoreDAO teacherScoreDao = new TeacherScoreDAO();
		ArrayList<TeacherAndScore> list = teacherScoreDao.selectJoin(no);
		teacherAndScore = list.get(0);
	
	%>	 
	<form action="<%=request.getContextPath()%>/teacher/updateTeacherScoreAction.jsp?teacherNo=<%=no %>" method="post">
		<table border=1>
			<tr class="even">
				<th>번호</th>
				<td><input type="hidden" name="teacherNo"><%=teacherAndScore.getTeacher().getTeacherNo()%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%= teacherAndScore.getTeacher().getTeacherName()%></td>
			</tr>
			<tr class="even">
				<th>점수</th>
				<td><input type="text" name="score" value="<%= teacherAndScore.getTeacherScore().getScore()%>" size ="7">
					<button type="submit">수정</button></td>
			</tr>
		</table>
	</form>
	</div>
		<!--bottom 하단 메뉴  -->
		<div id="bottom">
			<p class="groupContent">
				현희문 : Member | 김진우 : Employee,Student | 송유빈 : Teacher
			</p>
		</div>
	</div>
</body>
</html>