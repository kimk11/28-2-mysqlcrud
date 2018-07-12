<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberScoreDAO"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateMemberScoreAction</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("euckr");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int memberScore = Integer.parseInt(request.getParameter("memberScore"));
		
		MemberScoreDAO memberScoreDao = new MemberScoreDAO();
		memberScoreDao.updateMemberScore(memberNo, memberScore);
		
		response.sendRedirect(request.getContextPath() + "/member/memberList.jsp");
	%>
	</body>
</html>