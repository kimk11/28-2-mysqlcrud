<!-- 28기 김진우 -->
<!-- 2018-06-26 -->
<!-- employee 입력 폼 작성 -->
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
		<form action="<%= request.getContextPath() %>/insertStudentAction.jsp" method="post" name="formAction">
			<p>employeeAddr 입력</p>
			<div>
				<label>이름 : </label>
				<input type="text" id="employeeName" name="employeeName">
				<span id="employeeNameValid"></span>
			</div>
			<div>
				<label>나이 : </label>
				<input type="text" id="employeeAge" name="employeeAge">
				<span id="employeeAgeValid"></span>
			</div>
			<div>
				<button type="button" id="signEmployee">입력</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript" src="script/insertemployeeOrAddr.js" charset="utf-8"></script>
	
</body>
</html>