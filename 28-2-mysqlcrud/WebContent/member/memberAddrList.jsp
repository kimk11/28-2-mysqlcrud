<!-- 28기 현희문 -->
<!-- 2018-07-03 -->
<!-- memberAddr 리스트 작성 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberAddrDAO" %>
<%@ page import = "service.MemberAddr" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberList</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/table.css" />
	</head>
	<body>
	<%
		MemberAddrDAO memberAddrDao = new MemberAddrDAO();
		
		
		int rowNumber = memberAddrDao.countMemberAddr();
		
		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int rowPerPage = 5;
		
		int begin = (currentPage - 1) * rowPerPage;
		int end = begin + (rowPerPage - 1);
			if (end > rowNumber - 1) {
				end = rowNumber;
			}
			
		ArrayList<MemberAddr> list = memberAddrDao.selectMemberAddrByPage(begin, rowPerPage);
		System.out.println(list + "<-- list");
	%>
	
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
								<li><a href="<%=request.getContextPath()%>/Employee/insertEmployeeForm.jsp">Employee</a></li>
								<li><a href="<%=request.getContextPath()%>/member/insertMemberForm.jsp">Member</a></li>
								<li><a href="<%=request.getContextPath()%>/student/insertStudentForm.jsp">Student</a></li>
								<li><a href="<%=request.getContextPath()%>/teacher/insertTeacherForm.jsp">Teacher</a></li>
							</ul>
						</li>
						<li>
							List
							<ul class="menuTwo">
								<li><a href="<%=request.getContextPath()%>/Employee/employeeList.jsp">Employee</a></li>
								<li><a href="<%=request.getContextPath()%>/member/memberList.jsp">Member</a></li>
								<li><a href="<%=request.getContextPath()%>/student/studentList.jsp">Student</a></li>
								<li><a href="<%=request.getContextPath()%>/teacher/teacherList.jsp">Teacher</a></li>
							</ul>
						</li>
						<li>
							ScoreAVG
							<ul class="menuTwo">
								<li><a href="<%=request.getContextPath()%>/Employee/eployeeListAboveAvg.jsp">Employee</a></li>
								<li><a href="<%=request.getContextPath()%>/member/memberListAboveAvg.jsp">Member</a></li>
								<li><a href="<%=request.getContextPath()%>/student/studentListAboveAvg.jsp">Student</a></li>
								<li><a href="<%=request.getContextPath()%>/teacher/teacherListAboveAvg.jsp">Teacher</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			
			<div id="light">
				<table border ="1">
					<tr>
						<td>이메일번호</td>
						<td>회원번호</td>
						<td>이메일</td>
					</tr>
	<%		
		for(int i=0;i<list.size();i++){
			MemberAddr memberAddr = list.get(i);
	%>
					<tr>
						<td><%=memberAddr.getMemberAddrNo() %></td>
						<td><%=memberAddr.getMemberNo() %></td>
						<td><%=memberAddr.getMemberAddrContent() %></td>
					</tr>
	<%
		}
	%>
				</table>
	<%
		if (currentPage > 1) {
	%>
		<a href="<%= request.getContextPath() %>/member/memberAddrList.jsp?currentPage=<%=currentPage - 1%>">◀ 이전</a>
	<%
		}
		int lastPage = rowNumber / rowPerPage;
		if (rowNumber % rowPerPage != 0) {
			lastPage++;
		}
		if (currentPage < lastPage){
	%>
		<a href="<%= request.getContextPath() %>/member/memberAddrList.jsp?currentPage=<%=currentPage + 1%>">다음 ▶</a>
	<%
		}
	%>
			</div>
			
			<div id="bottom">
			
			</div>
			
		</div>
		
	</body>	
</html>