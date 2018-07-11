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

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/table.css" />

<style type="text/css">
.centered { display: table; margin-left: auto; margin-right: auto; }
</style>

</head>
<body>
<div id="wrapper clearfix">
	<div id="header">
			<h1>&lt;/&gt; 28 - 2 mysqlcrud</h1>
	</div>
	
	<div id="left">
		<div>
			<ul class="menuOne">
				<li>
					Insert
					<ul class="menuTwo">
						<li><a href="<%= request.getContextPath() %>/Employee/insertEmployeeForm.jsp">Employee</a></li>
						<li><a href="<%= request.getContextPath() %>/member/insertMemberForm.jsp">Member</a></li>
						<li><a href="<%= request.getContextPath() %>/student/insertStudentForm.jsp">Student</a></li>
						<li><a href="<%= request.getContextPath() %>/teacher/insertTeacherForm.jsp">Teacher</a></li>
					</ul>
				</li>
				<li>
					List
					<ul class="menuTwo">
						<li><a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">Employee</a></li>
						<li><a href="<%= request.getContextPath() %>/member/memberList.jsp">Member</a></li>
						<li><a href="<%= request.getContextPath() %>/student/studentList.jsp">Student</a></li>
						<li><a href="<%= request.getContextPath() %>/teacher/teacherList.jsp">Teacher</a></li>
					</ul>
				</li>
				<li>
					ScoreAVG
					<ul class="menuTwo">
						<li><a href="<%= request.getContextPath() %>/Employee/eployeeListAboveAvg.jsp">Employee</a></li>
						<li><a href="<%= request.getContextPath() %>/member/memberListAboveAvg.jsp">Member</a></li>
						<li><a href="<%= request.getContextPath() %>/student/studentListAboveAvg.jsp">Student</a></li>
						<li><a href="<%= request.getContextPath() %>/teacher/teacherListAboveAvg.jsp">Teacher</a></li>
					</ul>
				</li>
			</ul>
		</div>
		
	</div>
	
	<div id="light">
		<div class="centered">
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
				<tr class="even">
					<th>employeeContet</th>
				</tr>
				<% 
					for(int i=0 ; i<employeeAddrList.size() ; i++){
						EmployeeAddr employeeAddr = employeeAddrList.get(i);
						%>
						<tr class="even">
							<td><%= employeeAddr.getEmployeeAddrContent() %></td>
						</tr>
						<%
					}
				%>
			</table>
		<%
			int count = employeeAddrDao.currentPage(employeeNo);
			int startPage = 1;
			int lastPage = count/rowPage;
			if((count%rowPage)!=0){
				lastPage++;
			}
		%>
			<div class="centered">
		<%
				if(currentPage>startPage){
					%>
						<a href="<%= request.getContextPath() %>/Employee/employeeAddrList.jsp?currentPage=<%= currentPage-1 %>">이전</a>
					<%
				}
				for(int i=0 ; i<lastPage ; i++){
					%>
						<a href="<%= request.getContextPath() %>/Employee/employeeAddrList.jsp?currentPage=<%= i+1 %>"><%= i+1 %></a>
					<%
				}
				if(currentPage<lastPage){
					%>
						<a href="<%= request.getContextPath() %>/Employee/employeeAddrList.jsp?currentPage=<%= currentPage+1 %>">다음</a>
					<%
				}
		%>
			</div>
			<div>
				<button type="button" id="btn">뒤로가기</button>
			</div>
		</div>
	</div>
	
	<div id="bottom">
	
</div>
</div>
<script type="text/javascript">
	var btn = document.getElementById('btn');
	btn.addEventListener('click', function() {
		history.back();
	});
</script>
</body>
</html>