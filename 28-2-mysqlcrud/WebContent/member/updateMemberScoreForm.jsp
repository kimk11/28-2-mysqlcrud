<!-- 28�� ���� -->
<!-- 2018-07-12 -->
<!-- updateMemberScoreForm(ȸ������ ���� ȭ��) �ۼ� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberScoreDAO"%>
<%@ page import = "service.MemberScore"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateMemberScoreForm</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/table.css" />
	</head>
	<body>
	<%
	request.setCharacterEncoding("euckr");

	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	
	MemberScoreDAO memberScoreDao = new MemberScoreDAO();
	MemberScore memberScore = memberScoreDao.selectMemberScoreForUpdateMemberScore(memberNo);
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
				<div>
					<h2>ȸ�� ���� ����</h2>
					<form action ="updateMemberScoreAction.jsp" method = "post">
						<table border = "1">
							<tr>
								<td>������ȣ</td>
								<td>ȸ����ȣ</td>
								<td>ȸ������</td>
								<td>����</td>
							</tr>
							<tr>
								<td><input type = "text" name = "memberScoreNo" value = "<%=memberScore.getMemberScoreNo()%>" readonly></td>
								<td><input type = "text" name = "memberNo" value = "<%=memberScore.getMemberNo()%>" readonly></td>
								<td><input type = "text" name = "memberScore" value = "<%=memberScore.getScore()%>"></td>
								<td><input type = "submit" value = "����"></td>
							</tr>
						</table>
					</form>
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