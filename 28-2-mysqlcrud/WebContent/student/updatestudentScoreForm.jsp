<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.StudentScoreDAO"%>
<%@page import="service.StudentAndScore"%>
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
		int studentNo = Integer.parseInt(request.getParameter("studentNo"));
		
		ArrayList<StudentAndScore> arJoinList = new StudentScoreDAO().selectJoin(studentNo);
		StudentAndScore studentAndScore = arJoinList.get(0);
	%>
		<div>
			<form action="<%= request.getContextPath() %>/student/updateStudentScoreAction.jsp" method="post" name="formAction">
				<p>Student �Է�</p>
				<div class="group">
					<input type="hidden" name="studentNo" value="<%= studentAndScore.getStudent().getStudentNo() %>">
				</div>
				<div>
					<input type="text" id="studentName" name="studentName" value="<%= studentAndScore.getStudent().getStudentName() %>"  placeholder="Name" readonly="readonly">
					<span class="bar"></span>
					<span id="studentNameValid" class="studentBlank"></span>
				</div>
				<div class="group">
					<input type="text" id="studentScore" name="studentScore" value="<%= studentAndScore.getStudentScore().getScore() %>"  placeholder="score">
					<span class="bar"></span>
					<span id="studentAgeValid" class="studentBlank"></span>
				</div>
				<div>
					<button type="submit" id="signStudent"  class="button buttonBlue">�Է�</button>
				</div>
			</form>
		</div>
	</div>
	
	<div id="bottom">
	
	</div>
</div>
</body>
</html>