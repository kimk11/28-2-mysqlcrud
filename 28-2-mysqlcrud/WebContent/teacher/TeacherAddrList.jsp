<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="service.TeacherAddrDAO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="service.TeacherAddr" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	table, tr, td, th {
		border: solid 1px;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("euckr");
 	int no = Integer.parseInt(request.getParameter("no"));
	TeacherAddrDAO teacherAddrDao = new TeacherAddrDAO();
	ArrayList<TeacherAddr> list2 = teacherAddrDao.selectTeacherAddr(no);
	System.out.print(no + "<--no");
%>

<table>
	<tr>
		<th>번호</th>
		<th>주소</th>
	</tr>
<%
	for(int i=0; i<list2.size(); i++) {
		TeacherAddr teacherAddr = list2.get(i);
%>
	<tr>
		<td><%= teacherAddr.getTeacherAddrNo()%></td>
		<td><%= teacherAddr.getTeacherAddrContent()%></td>
	</tr>
<%
	}
%>
</table>
</body>
</html>