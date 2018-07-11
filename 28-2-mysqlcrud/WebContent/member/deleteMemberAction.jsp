<!-- 28기 현희문 -->
<!-- 2018-07-03 -->
<!-- member 삭제 처리 작성 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDAO"%>
<%@ page import = "service.MemberAddrDAO"%>
<%@ page import = "service.MemberScoreDAO"%>


<!DOCTYPE html>

<%	
	request.setCharacterEncoding("euckr");

	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	System.out.println(memberNo + "<-- memberNo");
	
	MemberScoreDAO memberScoreDao = new MemberScoreDAO();
	memberScoreDao.deleteMemberScore(memberNo);
	
	MemberAddrDAO memberAddrDao = new MemberAddrDAO();
	memberAddrDao.memberAddrDelete(memberNo);
	
	MemberDAO memberDao = new MemberDAO();
	memberDao.memberDelete(memberNo);

	
	
	response.sendRedirect(request.getContextPath() + "/member/memberList.jsp");
%>