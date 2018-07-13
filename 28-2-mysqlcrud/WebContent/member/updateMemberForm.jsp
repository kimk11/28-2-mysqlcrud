<!-- 28기 현희문 -->
<!-- 2018-07-03 -->
<!-- member 업데이트 폼 작성 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDAO" %>
<%@ page import = "service.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateMemberForm</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/table.css" />
		<style>
			table, td, th, tr {
				border: solid 1px #cccccc;
				border-collapse: collapse;
				padding: 5px 10px;
			}
			
			#name {
				width: 150px;
			}
			
			#age {
				width: 80px;
			}
		</style>
	</head>
	<body>
	<%
		request.setCharacterEncoding("euckr");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		MemberDAO memberDao = new MemberDAO();
		Member member = memberDao.selectOneMember(memberNo);
	
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
				<h2>회원 정보 수정</h2>
					<form action="<%= request.getContextPath() %>/member/updateMemberAction.jsp" method="post" name="formAction">				
						<table>
							<tr class="even">
								<th id="no">회원번호</th>
								<th id="name">회원이름</th>
								<th id="age">회원나이</th>
								<th>수정</th>
							</tr>
							<tr class="even">
								<td><input type = "text" name = "memberNo" value="<%=member.getMemberNo()%>" readonly></td>
								<td><input type="text" name="memberName" value="<%=member.getMemberName()%>"></td>
								<td><input type="text" name="memberAge" value="<%=member.getMemberAge()%>"></td>
								<td><input type="submit" value = "수정"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		
			<div id="bottom">
				<p class="groupContent">
						현희문 : Member | 김진우 : Employee,Student | 송유빈 : Teacher
				</p>
			</div>
			
		</div>
	</body>
</html>