<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.TeacherDAO"%>
<%@ page import="service.TeacherAddr"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherAddrDAO"%>
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
	<h2>선생님 List!</h2>
	<table>
		<tr>
			<th id="no">No</th>
			<th id="name">이름</th>
			<th id="age">나이</th>
			<th>주소</th>
			<th>삭제</th>
			<th>수정</th>
			
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
		
		TeacherAddr teacherAddr = new TeacherAddr();
		TeacherAddrDAO teacherAddrDao = new TeacherAddrDAO();
		
		
		
		if (endRow	> list.size()-1) {
			endRow = list.size()-1;
		}
		
		// 반복문
		for(int  i=0;i<list.size();i++) {

				Teacher teacher = list.get(i);
			
			
			int getTeacherNo = teacher.getTeacherNo();
			String getTeacherName = teacher.getTeacherName();
			int getTeacherAge = teacher.getTeacherAge();
			
			ArrayList<TeacherAddr> list2 = teacherAddrDao.selectTeacherAddr(getTeacherNo);
			String getTeacherAddrContent = teacherAddr.getTeacherAddrContent();
 			
 		
 		
	%>
		<tr>
			<td><%= getTeacherNo%></td>
			<td><a href ="./TeacherAddrList.jsp?no=<%=getTeacherNo%>"><%=getTeacherName%></a></td>	<!-- 이름 클릭 시 주소페이지로  -->
			<td><%= getTeacherAge%></td>
			<td>
				<form action="<%= request.getContextPath() %>/teacher/insertTeacherAddrAction.jsp" method ="post" name="f">
					<div>
						<input type = "hidden" id="teacherNo" name ="teacherNo" value="<%= getTeacherNo%>" readonly="readonly">
						<input type = "text" id="teacherAddrContent" name ="teacherAddrContent" size="30px" id="textAddr">
						<span id="teacherAddrContentHelper"></span>
					</div>
					<div>
						<button type="submit" id="btn">입력</button>
					</div>
					<div id="clear"></div>
				</form>
			</td>
			<td><a href="./deleteTeacherAction.jsp?no=<%=getTeacherNo%>">삭제</a></td>
			<td><a href="./updateTeacherForm.jsp?no=<%=getTeacherNo%>">수정</a></td>
		</tr>
		<%
		}
		
		%>
	</table>
	<form>
		<div>
			이름 :
			<input type="text" name="searchWord">
			<button type="button">검색</button>
		</div>
	</form>
	
	
	
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