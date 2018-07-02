<!-- 28기 김진우 -->
<!-- 2018-07-02 -->
<!-- student 리스트 보기 작성 -->
<!-- 페이지 작업 추가 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentDAO"%>
<%@ page import="service.Student"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int currentPage = 1;
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPage = 2;
	StudentDAO studentDao = new StudentDAO();
	ArrayList<Student> studentList =  studentDao.selectStudentByPage(currentPage, rowPage);
	
%>
	<table>
		<tr>
			<th>studentName</th><th>studentAge</th>
		</tr>
		<% 
			for(int i=0 ; i<studentList.size() ; i++){
				Student student = studentList.get(i);
				%>
				<tr>
					<td><%= student.getStudentName() %></td>
					<td><%= student.getStudentAge() %></td>
				</tr>
				<%
			}
		%>
	</table>
<%
	int count = studentDao.currentPage();
	int startPage = 1;
	int lastPage = count/rowPage;
	if((count%rowPage)!=0){
		lastPage++;
	}
	
	if(currentPage>startPage){
		%>
			<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= currentPage-1 %>">이전</a>
		<%
	}
	if(currentPage<lastPage){
		%>
			<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= currentPage+1 %>">다음</a>
		<%
	}
%>
</body>
</html>