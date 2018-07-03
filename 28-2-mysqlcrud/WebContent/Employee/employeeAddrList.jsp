<!-- 28기 김진우 -->
<!-- 2018-07-02 -->
<!-- employeeAddr 리스트 보기 작성 -->
<!-- 페이지 작업 추가 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeAddrDAO"%>
<%@ page import="service.EmployeeAddr"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int employeeNo =Integer.parseInt(request.getParameter("employeeNo"));
	
	int currentPage = 1;
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPage = 2;
	EmployeeAddrDAO employeeAddrDao = new EmployeeAddrDAO();
	ArrayList<EmployeeAddr> employeeAddrList =  employeeAddrDao.selectEmployeeAddrByPage(currentPage, rowPage, employeeNo);
	
%>
	<table>
		<tr>
			<th>employeeContet</th>
		</tr>
		<% 
			for(int i=0 ; i<employeeAddrList.size() ; i++){
				EmployeeAddr employeeAddr = employeeAddrList.get(i);
				%>
				<tr>
					<td><%= employeeAddr.getEmployeeAddrContent() %></td>
				</tr>
				<%
			}
		%>
	</table>
<%
	int count = employeeAddrDao.currentPage();
	int startPage = 1;
	int lastPage = count/rowPage;
	if((count%rowPage)!=0){
		lastPage++;
	}
	
	if(currentPage>startPage){
		%>
			<a href="<%= request.getContextPath() %>/Employee/employeeAddrList.jsp?currentPage=<%= currentPage-1 %>">이전</a>
		<%
	}
	if(currentPage<lastPage){
		%>
			<a href="<%= request.getContextPath() %>/Employee/employeeAddrList.jsp?currentPage=<%= currentPage+1 %>">다음</a>
		<%
	}
%>
</body>
</html>