<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherDAO" %>
<%@ page import = "service.Teacher" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euckr");
	
	
	TeacherDAO teacherDao = new TeacherDAO();
	Teacher teacher = new Teacher();
	int no = Integer.parseInt(request.getParameter("no"));
	teacherDao.deleteTeacher(no);
	System.out.println(no + "<--no");
	response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
%>
</body>
</html>