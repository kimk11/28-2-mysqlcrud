<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.EmployeeScoreDAO"%>
<%@page import="service.EmployeeAndScore"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/form.css" />

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
		request.setCharacterEncoding("euckr");
		int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
		
		ArrayList<EmployeeAndScore> arJoinList = new EmployeeScoreDAO().selectJoin(employeeNo);
		EmployeeAndScore employeeAndScore = arJoinList.get(0);
	%>
	
		<div>
			<form action="<%= request.getContextPath() %>/Employee/updateEmployeeScoreAction.jsp" method="post" name="formAction">
				<p>employeeAddr 입력</p>
				<div>
					<input type="hidden" name="employeeNo" value="<%= employeeAndScore.getEmployee().getEmployeeNo() %>">
				</div>
				<div class="group">
					<input type="text" id="employeeName" name="employeeName" value="<%= employeeAndScore.getEmployee().getEmployeeName() %>" readonly="readonly">
					<span class="bar"></span>
					<span id="employeeNameValid"></span>
				</div>
				<div class="group">
					<input type="text" id="employeScore" name="employeScore" value="<%= employeeAndScore.getEmployeeScore().getScore() %>">
					<span class="bar"></span>
					<span id="employeeAgeValid"></span>
				</div>
				<div>
					<button type="submit" id="signEmployee"  class="button buttonBlue">입력</button>
				</div>
			</form>
		</div>
	</div>
	
	<div id="bottom">
		<p class="groupContent">
				현희문 : Member | 김진우 : Employee,Student | 송유빈 : Teacher
		</p>
	</div>
</div>
</body>
</html>