<!-- 2018.07.11 ������ -->
<!-- teacherListAboveAvg.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.TeacherScoreDAO"%>
<%@ page import="service.TeacherAndScore"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� �̻� ����Ʈ</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table.css" />
<style>
table, th, td, tr {
	border-collapse: collapse;
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

		<div id="light">

			<%
				TeacherScoreDAO teacherScoreDao = new TeacherScoreDAO();
				ArrayList<TeacherAndScore> list = teacherScoreDao.selectAvgJoin();
				int avg = teacherScoreDao.scoreAvg(); //���ϵ� ������� �������� ���� �޼��带 ����Ѵ� 
				System.out.println(avg + "<--avg");
			%>
			<h2>��պ��� ���� ����Ʈ</h2>
			��� : <span><%=avg%></span>

			<table>
				<tr class="even">
					<th>��ȣ</th>
					<th>�̸�</th>
					<th>����</th>
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
						TeacherAndScore teacherAndScore = list.get(i);
				%>
				<tr class="even">
					<td><%=teacherAndScore.getTeacher().getTeacherNo()%></td>
					<td><%=teacherAndScore.getTeacher().getTeacherName()%></td>
					<td><%=teacherAndScore.getTeacherScore().getScore()%></td>
				</tr>
				<%
					}
				%>

			</table>

		</div>
		<div id="bottom">
			<p class="groupContent">
				���� : Member | ������ : Employee,Student | ������ : Teacher
			</p>
		</div>
	</div>

</body>
</html>