<!-- 28기 김진우 -->
<!-- 2018-07-02 -->
<!-- employee 리스트 보기 작성 -->
<!-- 페이지 작업 추가 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeDAO"%>
<%@ page import="service.Employee"%>
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
	EmployeeDAO employeeDao = new EmployeeDAO();
	ArrayList<Employee> employeeList =  employeeDao.selectEmployeeByPage(currentPage, rowPage);
	
%>
	<table>
		<tr>
			<th>employeeName</th><th>employeeAge</th>
		</tr>
		<% 
			for(int i=0 ; i<employeeList.size() ; i++){
				Employee employee = employeeList.get(i);
				%>
				<tr>
					<td><%= employee.getEmployeeName() %></td>
					<td><%= employee.getEmployeeAge() %></td>
				</tr>
				<%
			}
		%>
	</table>
<%
	int count = employeeDao.currentPage();
	int startPage = 1;
	int lastPage = count/rowPage;
	if((count%rowPage)!=0){
		lastPage++;
	}
	
	if(currentPage>startPage){
		%>
			<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage-1 %>">이전</a>
		<%
	}
	if(currentPage<lastPage){
		%>
			<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage+1 %>">다음</a>
		<%
	}
%>
</body>
</html>