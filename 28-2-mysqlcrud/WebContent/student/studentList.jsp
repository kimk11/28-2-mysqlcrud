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
<style type="text/css">
	table {
		border-collapse: collapse;
	}
	table, th, td{
		border: 1px solid #0000ff;
	}
</style>

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
			<th>studentNo</th><th>studentName</th><th>studentAge</th><th>삭제</th><th>수정</th>
		</tr>
		<% 
			for(int i=0 ; i<studentList.size() ; i++){
				Student student = studentList.get(i);
				%>
				<tr>
					<td><%= student.getStudentNo() %></td>
					<td><a href="<%= request.getContextPath() %>/student/studentAddrList.jsp?studentNo=<%= student.getStudentNo() %>"><%= student.getStudentName() %></a></td>
					<td><%= student.getStudentAge() %></td>
					<td>
						<div>
							<form action="<%= request.getContextPath() %>/student/insertStudentAddrAction.jsp" method="post" name="formAction">
								<div>
									<input type="hidden" id="studentNo" name="studentNo" value="<%= student.getStudentNo() %>" readonly="readonly">
								</div>
								<div>
									<label>주소 : </label>
									<input type="text" id="studentAddrContent" name="studentAddrContent">
									<span id="studentAddrContentValid"></span>
								</div>
								<div>
									<button type="submit" id="signStudent">입력</button>
								</div>
							</form>
						</div>
					</td>
					<td><a href="<%= request.getContextPath() %>/student/deleteStudentAction.jsp?studentNo=<%= student.getStudentNo() %>">삭제</a></td>
					<td><a href="<%= request.getContextPath() %>/student/updateStudentform.jsp?studentNo=<%= student.getStudentNo() %>">수정</a></td>
				</tr>
				<%
			}
		%>
	</table>
	
	<!-- 	검색창 -->
	<form>
		<div>
			이름:
			<input type="text" name="">
			<button type="submit">검색</button>
		</div>
	</form>
	
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