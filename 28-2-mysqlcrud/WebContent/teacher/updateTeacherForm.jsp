<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="service.TeacherDAO" %>
<%@ page import ="service.Teacher" %>
<%@ page import ="service.TeacherAddr" %>
<%@ page import ="service.TeacherAddrDAO" %>
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
	Teacher teacher = new Teacher();
	int getTeacherNo = teacher.getTeacherNo();
	TeacherDAO teacherDao = new TeacherDAO();
	teacherDao.updateTeacher(teacher);

%>
<table>
	<tr>
		<th id="no">No</th>
		<th id="name">�̸�</th>
		<th id="age">����</th>
		<th id="addr">�ּ�</th>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>
</body>
</html>