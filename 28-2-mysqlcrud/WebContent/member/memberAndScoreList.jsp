<!-- 28기 현희문 -->
<!-- 2018-07-09 -->
<!-- memberAndScore 리스트 작성 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberScoreDAO"%>
<%@ page import = "service.MemberAndScore" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberAndScoreList</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/table.css" />
	</head>
	<body>
	<%
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		MemberScoreDAO memberScoreDao = new MemberScoreDAO();
		
		ArrayList<MemberAndScore> list = new ArrayList<>();
		list = memberScoreDao.selectMemberAndScored(memberNo);
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
				<table border = "1">
					<tr>
						<td>점수번호</td>
						<td>회원번호</td>
						<td>회원이름</td>
						<td>회원나이</td>
						<td>회원점수</td>
					</tr>
	<%
		for(int i=0; i<list.size(); i++){
			MemberAndScore memberAndScore = list.get(i);
	%>
					<tr>
						<td><%=memberAndScore.getMemberScore().getMemberScoreNo()%></td>
						<td><%=memberAndScore.getMemberScore().getMemberNo()%></td>
						<td><%=memberAndScore.getMember().getMemberName()%></td>
						<td><%=memberAndScore.getMember().getMemberAge()%></td>
						<td><%=memberAndScore.getMemberScore().getScore()%></td>
					</tr>
	<%
		}
	%>
				</table>
			</div>
		
			<div id="bottom">
			
			</div>
		
		</div>
	</body>
</html>