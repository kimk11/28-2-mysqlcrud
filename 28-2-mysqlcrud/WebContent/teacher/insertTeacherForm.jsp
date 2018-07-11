<!-- 2018.06.26 송유빈 -->
<!-- Teacher 입력 화면  -->
<!-- insertTeacherForm.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>입력 화면</title>
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
			<form
				action="<%=request.getContextPath()%>/teacher/insertTeacherAction.jsp" method="post" name="f">
				<h2>Teacher 정보 입력</h2>
				<div class="group">
					<input type="text" id="teacherName" name="teacherName" size="10px" placeholder="Name"> 
					<span class="bar"></span>
					<span id="teacherNameHelper"></span><br>
				</div>
				<div class="group">
					<input type="text" id="teacherAge" name="teacherAge" size="10px" placeholder="Age">
					<span class="bar"></span>
					<span id="teacherAgeHelper"></span><br>
				</div>
				<div>
					<button type="button" id="teacherBtn" class="button buttonBlue">입력</button>
				</div>
			</form>
			
			<script type="text/javascript" src="../script/inserteacherOrAddr.js"
				charset="utf-8">
			</script>

		</div>

		<div id="bottom"></div>
	</div>
</body>
</html>