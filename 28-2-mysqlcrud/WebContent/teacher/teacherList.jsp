<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.TeacherDAO"%>
<%@ page import="service.Teacher"%>
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
width :10%;
}
#name {
width :20%;
}
#age {
width :15%;
}
</style>
</head>
<body>
	<h2>선생님 List!</h2>
	<table>
		<tr>
			<th id="no">No</th>
			<th id="name">이름</th>
			<th id="age">나이</th>
		</tr>

		<%
		int currentPage = 1; //현재페이지
		int pagePerRow = 5; //한 페이지에 나올 row 수
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		int startRow = (currentPage - 1) * pagePerRow;
		int endRow = startRow + (pagePerRow - 1);
		
		
		TeacherDAO teacherDao = new TeacherDAO();
		int totalRow = teacherDao.count();
		ArrayList<Teacher> list = teacherDao.selectTeacherByPage(startRow, pagePerRow);
		
		
		if (endRow	> list.size()-1) {
			endRow = list.size()-1;
		}
		for(int  i=0;i<list.size();i++) {
			Teacher teacher = list.get(i);
			
			int getTeacherNo = teacher.getTeacherNo();
			String getTeacherName = teacher.getTeacherName();
			int getTeacherAge = teacher.getTeacherAge();
	%>
		<tr>
			<td><%= getTeacherNo%></td>
			<td><%= getTeacherName%></td>
			<td><%= getTeacherAge%></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
		if (currentPage > 1) {
	%>
	<a href="./teacherList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
	<%
		}

	int lastPage = (totalRow-1) / pagePerRow;
	if ((totalRow-1) % pagePerRow != 0) {
		lastPage++;
	}
		if (currentPage < lastPage) {
	%>
	<a href="./teacherList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
	<%
		}

	%>

</body>
</html>