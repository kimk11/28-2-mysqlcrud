<!-- 2018.07.09 송유빈 -->
<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.GETSTATIC"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="service.TeacherDAO" %>
<%@ page import ="service.Teacher" %>
<%@ page import ="service.TeacherAddr" %>
<%@ page import ="service.TeacherAddrDAO" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
table, td, th, tr{
	border: solid 1px #cccccc;
	border-collapse: collapse;
	padding : 5px 10px;
}
#no {
width :50px;
}
#name {
width :150px;
}
#age {
width :80px;
}
#addr {
width :200px;
}
</style>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	TeacherAddrDAO teacherAddrDao = new TeacherAddrDAO(); 
	TeacherDAO teacherDao = new TeacherDAO();
	Teacher teacher = teacherDao.selectTeacher(no);
	teacherDao.updateTeacher(teacher, no);
	TeacherAddr teacherAddr = teacherAddrDao.selectAllTeacherAddr(no);
	
%>
<h2>내 정보 수정</h2>
<form action ="./updateTeacherForm.jsp" method="post">
<table>
	<tr>
		<th id="no">No</th>
		<th id="name">이름</th>
		<th id="age">나이</th>
		<th id="addr">주소</th>
		
	</tr>
	
	<tr>
		<td><%= no %></td>
		<td><input type="text" name="teacherName" value="<%= teacher.getTeacherName()%>"></td>
		<td><input type="text" name="teacherAge" value="<%= teacher.getTeacherAge()%>"></td>
		<td><input type="text" name="teacherAge" value="<%= teacherAddr.getTeacherAddrContent()%>"></td>
		<td><input type="submit" value = "수정완료"></td>
	</tr>
	
	<%
		
	%>
</table>
</form>
</body>
</html>