<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.StudentDAO"%>
<%@page import="service.Student"%>
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
		
		StudentDAO studentDao = new StudentDAO();
		Student student =  studentDao.selectOneStudent(studentNo);
	%>
		<div>
			<form action="<%= request.getContextPath() %>/student/updateStudentAction.jsp" method="post" name="formAction">
				<p>Student 입력</p>
				<div class="group">
					<input type="hidden" name="studentNo" value="<%= student.getStudentNo() %>">
				</div>
				<div>
					<input type="text" id="studentName" name="studentName" value="<%= student.getStudentName() %>"  placeholder="Name">
					<span id="studentNameValid" class="studentBlank"></span>
				</div>
				<div class="group">
					<input type="text" id="studentAge" name="studentAge" value="<%= student.getStudentAge() %>"  placeholder="Name">
					<span id="studentAgeValid" class="studentBlank"></span>
				</div>
				<div>
					<button type="submit" id="signStudent"  class="button buttonBlue">입력</button>
				</div>
			</form>
		</div>
	</div>
	
	<div id="bottom">
	
	</div>
</div>
</body>
</html>