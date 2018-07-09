<!-- 28기 현희문 -->
<!-- 2018-06-26 -->
<!-- member 입력 처리 작성 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.MemberDAO"%>
<%@page import="service.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insertMemberAction</title>
</head>

<body>
<%
	request.setCharacterEncoding("euckr");

	Member member = new Member();
	
	member.setMemberName(request.getParameter("memberName"));
	member.setMemberAge(Integer.parseInt(request.getParameter("memberAge")));
	
	MemberDAO memberDao = new MemberDAO();
	memberDao.memberInsert(member);
%>

</body>
</html>