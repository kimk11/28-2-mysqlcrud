<!-- 28�� ������ -->
<!-- 2018-06-26 -->
<!-- employee �Է� �� �ۼ� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/insertAddr.css">

</head>

<body>
	<div>
		<form action="<%= request.getContextPath() %>/Employee/insertEmployeeAddrAction.jsp" method="post" name="formAction">
			<p>employee �Է�</p>
			<div>
				<input type="hidden" id="employeeNo" name="employeeNo" value="<%= request.getParameter("employeeNo") %>">
			</div>
			<div>
				<label>�ּ� : </label>
				<input type="text" id="employeeAddrContent" name="employeeAddrContent">
				<span id="employeeAddrContentValid"></span>
			</div>
			<div>
				<button type="button" id="signEmployee">�Է�</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript" src="../script/insertemployeeOrAddr.js" charset="utf-8"></script>
	
</body>
</html>