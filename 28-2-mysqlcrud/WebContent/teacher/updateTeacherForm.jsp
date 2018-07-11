<!-- 2018.07.09 송유빈 -->
<!-- updateTeacherForm.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.TeacherDAO"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherAddr"%>
<%@ page import="service.TeacherAddrDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수정화면</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/index.css" />
<style>
table, td, th, tr {
	border: solid 1px #cccccc;
	border-collapse: collapse;
	padding: 5px 10px;
}

#no {
	width: 50px;
}

#name {
	width: 150px;
}

#age {
	width: 80px;
}

#addr {
	width: 200px;
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
				int no = Integer.parseInt(request.getParameter("no"));
				TeacherAddrDAO teacherAddrDao = new TeacherAddrDAO();
				TeacherDAO teacherDao = new TeacherDAO();
				Teacher teacher = teacherDao.selectTeacher(no);
				TeacherAddr teacherAddr = teacherAddrDao.selectAllTeacherAddr(no);
			%>
			<h2>내 정보 수정</h2>
			<form action="./updateTeacherAction.jsp" method="post">
				<table>
					<tr>
						<th id="no">No</th>
						<th id="name">이름</th>
						<th id="age">나이</th>
						<th id="addr">주소</th>

					</tr>
					<tr>
						<td><input type = "hidden" name="teacherNo" value="<%=no%>"><%= no %></td>
						<td><input type="text" name="teacherName" value="<%= teacher.getTeacherName()%>"></td>
						<td><input type="text" name="teacherAge" value="<%= teacher.getTeacherAge()%>"></td>
						<td><input type="text" name="teacherAddrContent" value="<%= teacherAddr.getTeacherAddrContent()%>"></td>
						<td><input type="submit" value = "수정완료"></td>
					</tr>
				</table>
			</form>
		</div>

		<div id="bottom"></div>
	</div>
</body>
</html>