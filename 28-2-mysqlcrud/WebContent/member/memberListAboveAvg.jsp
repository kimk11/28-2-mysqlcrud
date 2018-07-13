<!-- 28�� ���� -->
<!-- 2018-07-10 -->
<!-- memberListAboveAvg(��������� ������� �̻��� ȸ�� ����Ʈ) �ۼ� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberScoreDAO"%>
<%@ page import = "service.MemberAndScore"%>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberListAboveAvg</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/table.css" />
	</head>
	<body>
		<%
			MemberScoreDAO memberScoreDao = new MemberScoreDAO();
			int average = memberScoreDao.selectAvgScore();
		
			ArrayList<MemberAndScore> list = new ArrayList<>();
			list = memberScoreDao.selectAvgJoin();
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
				<h2>��� �̻� ����Ʈ</h2><br>
				<div>
					��� : <%=average%>
				</div>
				<div>
					<table border = "1">
						<thead>
							<tr>
								<th>ȸ����ȣ</th>
								<th>ȸ���̸�</th>
								<th>ȸ������</th>
							</tr>
						</thead>
						<tbody>
							<%
							for(int i=0 ; i<list.size(); i++){
								MemberAndScore memberAndScore = list.get(i);
							%>
							<tr>
								<td><%=memberAndScore.getMemberScore().getMemberNo()%></td>
								<td><%=memberAndScore.getMember().getMemberName()%></td>
								<td><%=memberAndScore.getMemberScore().getScore()%></td>
							</tr>
							
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
			
			<div id="bottom">
				<p class="groupContent">
						���� : Member | ������ : Employee,Student | ������ : Teacher
				</p>
			</div>
			
		</div>
	</body>
</html>