<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.StudentDAO"%>
<%@page import="service.Student"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euckr");
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	
	StudentDAO studentDao = new StudentDAO();
	Student student =  studentDao.selectOneStudent(studentNo);
%>
	<div>
		<form action="<%= request.getContextPath() %>/student/updateStudentAction.jsp" method="post" name="formAction">
			<p>Student 입력</p>
			<div>
				<input type="hidden" name="studentNo" value="<%= student.getStudentNo() %>">
			</div>
			<div>
				<label>이름 : </label>
				<input type="text" id="studentName" name="studentName" value="<%= student.getStudentName() %>">
				<span id="studentNameValid" class="studentBlank"></span>
			</div>
			<div>
				<label>나이 : </label>
				<input type="text" id="studentAge" name="studentAge" value="<%= student.getStudentAge() %>">
				<span id="studentAgeValid" class="studentBlank"></span>
			</div>
			<div>
				<button type="submit" id="signStudent">입력</button>
			</div>
		</form>
	</div>
</body>
</html>