<!-- 28�� ������ -->
<!-- 2018-06-26 -->
<!-- employee �Է� �� �ۼ� -->
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
			<p>employeeAddr �Է�</p>
			<div>
				<label>�̸� : </label>
				<input type="text" id="employeeName" name="employeeName">
				<span id="employeeNameValid"></span>
			</div>
			<div>
				<label>���� : </label>
				<input type="text" id="employeeAge" name="employeeAge">
				<span id="employeeAgeValid"></span>
			</div>
			<div>
				<button type="button" id="signEmployee">�Է�</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript" src="script/insertemployeeOrAddr.js" charset="utf-8"></script>
	
</body>
</html>