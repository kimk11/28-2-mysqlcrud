<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherDAO" %>
<%@ page import = "service.Teacher" %>
<%@ page import = "service.TeacherAddrDAO" %>
<%@ page import = "service.TeacherScoreDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euckr");
	
	TeacherScoreDAO teacherScoreDao = new TeacherScoreDAO();
	TeacherAddrDAO teacherAddrDao = new TeacherAddrDAO();
	TeacherDAO teacherDao = new TeacherDAO();
	Teacher teacher = new Teacher();
	int no = Integer.parseInt(request.getParameter("no"));
	teacherScoreDao.deleteScore(no);
	teacherAddrDao.deleteAddr(no);
	teacherDao.deleteTeacher(no);
	System.out.println(no + "<--no");
	
	
	response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
%>
</body>
</html>