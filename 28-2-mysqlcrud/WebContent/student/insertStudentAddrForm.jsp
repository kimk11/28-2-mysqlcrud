<!-- 28기 김진우 -->
<!-- 2018-06-26 -->
<!-- studentaddr 입력 폼 작성 -->
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
		<form action="<%= request.getContextPath() %>/student/insertStudentAddrAction.jsp" method="post" name="formAction">
			<p>StudentAddr 입력</p>
			<div>
				<input type="hidden" id="studentNo" name="studentNo" value="<%= request.getParameter("studentNo") %>" readonly="readonly">
			</div>
			<div>
				<label>주소 : </label>
				<input type="text" id="studentAddrContent" name="studentAddrContent">
				<span id="studentAddrContentValid"></span>
			</div>
			<div>
				<button type="button" id="signStudent">입력</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript" src="../script/insertstudentOrAddr.js" charset="utf-8"></script>

</body>
</html>