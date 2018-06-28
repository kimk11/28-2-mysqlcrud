<!-- 2018.06.26 송유빈 -->
<!-- Teacher 주소 처리 화면 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherAddrDAO" %>
<%@ page import = "service.TeacherAddr" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insert Teacher Addr Action</title>
</head>
<body>
<% 	request.setCharacterEncoding("euc-kr");
	
	TeacherAddr teacherAddr = new TeacherAddr();
	teacherAddr.setTeacherNo(Integer.parseInt(request.getParameter("teacherNo")));
	teacherAddr.setTeacherAddrContent(request.getParameter("teacherAddrContent"));

	TeacherAddrDAO dao = new TeacherAddrDAO();
	dao.insertTeacherAddr(teacherAddr);
%>
</body>
</html>