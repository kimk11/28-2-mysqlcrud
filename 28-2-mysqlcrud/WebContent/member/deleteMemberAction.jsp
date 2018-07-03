<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDAO" %>
<%@ page import = "service.MemberAddrDAO" %>


<!DOCTYPE html>



<%	
	request.setCharacterEncoding("euckr");

	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	System.out.println(memberNo + "<-- memberNo");
	
	MemberDAO memberDao = new MemberDAO();
	memberDao.memberDelete(memberNo);
	
	MemberAddrDAO memberAddrDao = new MemberAddrDAO();
	memberAddrDao.memberAddrDelete(memberNo);
	
	
	response.sendRedirect(request.getContextPath() + "/member/memberList.jsp");
%>