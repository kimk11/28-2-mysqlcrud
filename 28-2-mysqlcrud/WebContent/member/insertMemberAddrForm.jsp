<!-- 28�� ���� -->
<!-- 2018-06-26 -->
<!-- memberAddr �Է� �� �ۼ� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertMemberAddrForm</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/insertAddr.css">
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
				<form action="<%= request.getContextPath() %>/member/insertMemberAddrAction.jsp" method="post" name="formAction">
					<h2>ȸ�� �ּ� �Է�</h2>
					<div>
						<input type="hidden" id="memberNo" name="memberNo" value="<%= request.getParameter("memberNo") %>">
					</div>
					<div>
						<label>�ּ� : </label>
						<input type="text" id="memberAddrContent" name="memberAddrContent">
						<span id="memberAddrContentValid"></span>
					</div>
					<div>
						<button type="button" id="signMember">�Է�</button>
					</div>
				</form>
			</div>
			
			<div id="bottom">
				<p class="groupContent">
						���� : Member | ������ : Employee,Student | ������ : Teacher
				</p>
			</div>
			
		</div>
		
		
		<script type="text/javascript" src="../script/insertmemberOrAddr.js" charset="utf-8"></script>
	</body>
</html>