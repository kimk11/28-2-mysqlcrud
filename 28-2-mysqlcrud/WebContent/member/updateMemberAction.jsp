<!-- 28기 현희문 -->
<!-- 2018-07-03 -->
<!-- member 업데이트 처리 작성 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateMemberAction</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("euckr");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String memberName = request.getParameter("memberName");
		int memberAge = Integer.parseInt(request.getParameter("memberAge"));
		
		MemberDAO memberDao = new MemberDAO();
		memberDao.updateMember(memberNo, memberName, memberAge);
		
		response.sendRedirect(request.getContextPath() + "/member/memberList.jsp");
	%>
	</body>
</html>