<!-- 28기 김진우 -->
<!-- 2018-06-26 -->
<!-- student 입력 폼 작성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/insert.css">

</head>

<body>
	<div>
		<form action="<%= request.getContextPath() %>/student/insertStudentAction.jsp" method="post" name="formAction">
			<p>Student 입력</p>
			<div>
				<label>이름 : </label>
				<input type="text" id="studentName" name="studentName">
				<span id="studentNameValid" class="studentBlank"></span>
			</div>
			<div>
				<label>나이 : </label>
				<input type="text" id="studentAge" name="studentAge">
				<span id="studentAgeValid" class="studentBlank"></span>
			</div>
			<div>
				<button type="submit" id="signStudent">입력</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript" src="script/insertstudentOrAddr.js" charset="utf-8"></script>
		
</body>
</html>