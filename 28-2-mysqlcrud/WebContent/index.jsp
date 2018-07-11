<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />

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
							<li><a href="./Employee/insertEmployeeForm.jsp">Employee</a></li>
							<li><a href="./member/insertMemberForm.jsp">Member</a></li>
							<li><a href="./student/insertStudentForm.jsp">Student</a></li>
							<li><a href="./teacher/insertTeacherForm.jsp">Teacher</a></li>
						</ul>
					</li>
					<li>
						List
						<ul class="menuTwo">
							<li><a href="./Employee/employeeList.jsp">Employee</a></li>
							<li><a href="./member/memberList.jsp">Member</a></li>
							<li><a href="./student/studentList.jsp">Student</a></li>
							<li><a href="./teacher/teacherList.jsp">Teacher</a></li>
						</ul>
					</li>
					<li>
						ScoreAVG
						<ul class="menuTwo">
							<li><a href="./Employee/eployeeListAboveAvg.jsp">Employee</a></li>
							<li><a href="./member/memberListAboveAvg.jsp">Member</a></li>
							<li><a href="./student/studentListAboveAvg.jsp">Student</a></li>
							<li><a href="./teacher/teacherListAboveAvg.jsp">Teacher</a></li>
						</ul>
					</li>
				</ul>
			</div>
			
		</div>
		
		<div id="light">
		
		</div>
		
		<div id="bottom">
		
		</div>
	</div>
</body>
</html>