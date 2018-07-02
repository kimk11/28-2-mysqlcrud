<!-- 28기 현희문 -->
<!-- 2018-06-26 -->
<!-- member 입력 폼 작성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insertMemberForm</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/insert.css">

</head>

<body>
	<div>
		<form action="<%= request.getContextPath() %>/member/insertMemberAction.jsp" method="post" name="formAction">
			<p>Member 입력</p>
			<div>
				<label>이름 : </label>
				<input type="text" id="memberName" name="memberName">
				<span id="memberNameValid" class="memberBlank"></span>
			</div>
			<div>
				<label>나이 : </label>
				<input type="text" id="memberAge" name="memberAge">
				<span id="memberAgeValid" class="memberBlank"></span>
			</div>
			<div>
				<button type="button" id="signMember">입력</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript" src="../script/insertmemberOrAddr.js" charset="utf-8"></script>
	
</body>
</html>