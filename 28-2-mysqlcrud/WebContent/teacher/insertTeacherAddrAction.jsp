<!-- 2018.06.26 价蜡后 -->
<!-- Teacher 林家 贸府 拳搁 -->

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
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));

	teacherAddr.setTeacherNo(Integer.parseInt(request.getParameter("teacherNo")));
	teacherAddr.setTeacherAddrContent(request.getParameter("teacherAddrContent"));

	System.out.print(teacherAddr.getTeacherNo());
	
	TeacherAddrDAO teacherAddrDao = new TeacherAddrDAO();
	int check = teacherAddrDao.teacherAddrInsert(teacherAddr);
	

	
	
	response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
%>
</body>
</html>