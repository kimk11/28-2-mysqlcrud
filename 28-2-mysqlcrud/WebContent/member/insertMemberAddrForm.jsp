<!-- 28기 현희문 -->
<!-- 2018-06-26 -->
<!-- memberAddr 입력 폼 작성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertMemberAddrForm</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/insertAddr.css">
	</head>
	<body>
		<div>
			<form action="<%= request.getContextPath() %>/member/insertMemberAddrAction.jsp" method="post" name="formAction">
				<p>MemberAddr 입력</p>
				<div>
					<input type="hidden" id="memberNo" name="memberNo" value="<%= request.getParameter("memberNo") %>">
				</div>
				<div>
					<label>주소 : </label>
					<input type="text" id="memberAddrContent" name="memberAddrContent">
					<span id="memberAddrContentValid"></span>
				</div>
				<div>
					<button type="button" id="signMember">입력</button>
				</div>
			</form>
		</div>
		<script type="text/javascript" src="../script/insertmemberOrAddr.js" charset="utf-8"></script>	
	</body>
</html>