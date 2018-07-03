<!-- 28�� ������ -->
<!-- 2018-07-02 -->
<!-- student ����Ʈ ���� �ۼ� -->
<!-- ������ �۾� �߰� -->
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
			<th>studentNo</th><th>studentName</th><th>studentAge</th><th>����</th><th>����</th>
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
									<label>�ּ� : </label>
									<input type="text" id="studentAddrContent" name="studentAddrContent">
									<span id="studentAddrContentValid"></span>
								</div>
								<div>
									<button type="submit" id="signStudent">�Է�</button>
								</div>
							</form>
						</div>
					</td>
					<td><a href="<%= request.getContextPath() %>/student/deleteStudentAction.jsp?studentNo=<%= student.getStudentNo() %>">����</a></td>
					<td><a href="<%= request.getContextPath() %>/student/updateStudentform.jsp?studentNo=<%= student.getStudentNo() %>">����</a></td>
				</tr>
				<%
			}
		%>
	</table>
	
	<!-- 	�˻�â -->
	<form>
		<div>
			�̸�:
			<input type="text" name="">
			<button type="submit">�˻�</button>
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
			<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= currentPage-1 %>">����</a>
		<%
	}
	if(currentPage<lastPage){
		%>
			<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= currentPage+1 %>">����</a>
		<%
	}
%>
</body>
</html>