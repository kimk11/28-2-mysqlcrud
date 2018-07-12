<!-- 2018.07.11 송유빈 -->
<!-- TeacherAddrList.jsp -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.TeacherAddrDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.TeacherAddr"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주소리스트</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table.css" />
<style>
table, tr, td, th {
	border: solid 1px;
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
				request.setCharacterEncoding("euckr");
				int no = Integer.parseInt(request.getParameter("no"));
				TeacherAddrDAO teacherAddrDao = new TeacherAddrDAO();
				ArrayList<TeacherAddr> list2 = teacherAddrDao.selectTeacherAddr(no);
				System.out.print(no + "<--no");
			%>

			<table>
				<tr class = "even">
					<th>번호</th>
					<th>주소</th>
				</tr>
				<%
					for (int i = 0; i < list2.size(); i++) {
						TeacherAddr teacherAddr = list2.get(i);
				%>
				<tr class = "even">
					<td><%=teacherAddr.getTeacherAddrNo()%></td>
					<td><%=teacherAddr.getTeacherAddrContent()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div id="bottom"></div>
	</div>
</body>
</html>