<!-- 28기 현희문 -->
<!-- 2018-06-26 -->
<!-- member 입력 폼 작성 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertMemberForm</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/form.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/table.css">
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
								<li><a href="<%=request.getContextPath()%>/Employee/insertEmployeeForm.jsp">Employee</a></li>
								<li><a href="<%=request.getContextPath()%>/member/insertMemberForm.jsp">Member</a></li>
								<li><a href="<%=request.getContextPath()%>/student/insertStudentForm.jsp">Student</a></li>
								<li><a href="<%=request.getContextPath()%>/teacher/insertTeacherForm.jsp">Teacher</a></li>
							</ul>
						</li>
						<li>
							List
							<ul class="menuTwo">
								<li><a href="<%=request.getContextPath()%>/Employee/employeeList.jsp">Employee</a></li>
								<li><a href="<%=request.getContextPath()%>/member/memberList.jsp">Member</a></li>
								<li><a href="<%=request.getContextPath()%>/student/studentList.jsp">Student</a></li>
								<li><a href="<%=request.getContextPath()%>/teacher/teacherList.jsp">Teacher</a></li>
							</ul>
						</li>
						<li>
							ScoreAVG
							<ul class="menuTwo">
								<li><a href="<%=request.getContextPath()%>/Employee/eployeeListAboveAvg.jsp">Employee</a></li>
								<li><a href="<%=request.getContextPath()%>/member/memberListAboveAvg.jsp">Member</a></li>
								<li><a href="<%=request.getContextPath()%>/student/studentListAboveAvg.jsp">Student</a></li>
								<li><a href="<%=request.getContextPath()%>/teacher/teacherListAboveAvg.jsp">Teacher</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			
			<div id="light">
				<form action="<%= request.getContextPath() %>/member/insertMemberAction.jsp" method="post" name="formAction">
					<h2>회원 입력</h2>
					<div class="group">
						<input type="text" id="memberName" name="memberName" placeholder="Name">
						<span class="bar"></span>
						<span id="memberNameValid" class="memberBlank"></span>
					</div>
					<div class="group">
						<input type="text" id="memberAge" name="memberAge" placeholder="Age">
						<span class="bar"></span>
						<span id="memberAgeValid" class="memberBlank"></span>
					</div>
					<div>
						<button type="button" id="signMember" class="button buttonBlue">입력</button>
					</div>
				</form>
			</div>
			
			<div id="bottom">
			
			</div>
			
		</div>
		
		
		<script type="text/javascript" src="../script/insertmemberOrAddr.js" charset="utf-8"></script>
	</body>
</html>