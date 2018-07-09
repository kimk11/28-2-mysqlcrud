<!-- 28기 현희문 -->
<!-- 2018-07-09 -->
<!-- memberScore 입력 처리 작성 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberScoreDAO" %>
<%@ page import = "service.MemberScore" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertMemberScore</title>
	</head>
	<body>
	<%
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int memberScore = Integer.parseInt(request.getParameter("memberScore"));	
		
		MemberScoreDAO memberScoreDao = new MemberScoreDAO();
		
		int check = memberScoreDao.selectMemberScore(memberNo);
		
		if(check == 0){
			memberScoreDao.insertMemberScore(memberNo, memberScore);
		}else{
			memberScoreDao.updateMemberScore(memberNo, memberScore);
		}
		
		response.sendRedirect(request.getContextPath() + "/member/memberList.jsp");
	%>
	</body>
</html>