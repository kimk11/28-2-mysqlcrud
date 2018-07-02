<!-- 28기 현희문 -->
<!-- 2018-06-26 -->
<!-- memberAddr 입력 처리 작성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.MemberAddrDAO"%>
<%@page import="service.MemberAddr"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertMemberAddrAction</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("euckr");
	
		MemberAddr memberAddr = new MemberAddr();
		
		memberAddr.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		memberAddr.setMemberAddrContent(request.getParameter("memberAddrContent"));
	
		MemberAddrDAO memberAddrDao = new MemberAddrDAO();
		memberAddrDao.memberAddrInsert(memberAddr);
	%>
	</body>
</html>