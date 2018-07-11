<!-- 28�� ���� -->
<!-- 2018-07-03 -->
<!-- member ����Ʈ �ۼ� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDAO" %>
<%@ page import = "service.Member" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberList</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table.css" />
	</head>
	<body>
	<%
		request.setCharacterEncoding("euckr");
		
		MemberDAO memberdao = new MemberDAO();
		
		
		int rowNumber = memberdao.countMember();
		
		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		String searchName = "";
		if(request.getParameter("searchName") != null){
			searchName = request.getParameter("searchName");
		}
		
		int rowPerPage = 5;
		
		int begin = (currentPage - 1) * rowPerPage;
		int end = begin + (rowPerPage - 1);
			if (end > rowNumber - 1) {
				end = rowNumber;
			}
			
		ArrayList<Member> list = memberdao.selectMemberByPage(begin, rowPerPage, searchName);
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
				<div>
					<h2>memberList</h2>
				</div>
				
				<div>
					<table border ="1">
						<tr class="even">
							<td>ȸ����ȣ</td>
							<td>ȸ���̸�</td>
							<td>ȸ������</td>
							<td>�ּ��Է�</td><!-- �ټ� -->
							<td>�ּҺ���</td>
							<td>ȸ������</td>
							<td>ȸ������</td>
							<td>�����Է�</td><!-- �ѹ� -->
							<td>��������</td>
						</tr>
	<%	
		for(int i=0;i<list.size();i++){
			Member member = list.get(i);
	%>
						<tr class="even">
							<td><%=member.getMemberNo() %></td>
							<td><a href = "<%= request.getContextPath() %>/member/memberAddrList.jsp?memberNo=<%=member.getMemberNo() %>"><%=member.getMemberName() %></a></td>
							<td><%=member.getMemberAge() %></td>
							
							<td>
								<form action="<%= request.getContextPath() %>/member/insertMemberAddrAction.jsp" method="post" name="insertAddrFormAction">
									<p>MemberAddr �Է�</p>
									<div>
										<input type="hidden" id="memberNo" name="memberNo" value="<%=member.getMemberNo() %>">
									</div>
									<div>
										<label>�ּ� : </label>
										<input type="text" id="memberAddrContent" name="memberAddrContent">
										<span id="memberAddrContentValid"></span>
									</div>
									<div>
										<button type="submit" id="signMember">�Է�</button>
									</div>
								</form>
							</td>
							<td><a href = "<%= request.getContextPath() %>/member/memberAddrList.jsp">�ּҺ���</a></td>
							<td><a href = "<%= request.getContextPath() %>/member/deleteMemberAction.jsp?memberNo=<%=member.getMemberNo() %>">����</a></td>
							<td><a href = "<%= request.getContextPath() %>/member/updateMemberForm.jsp?memberNo=<%=member.getMemberNo() %>">����</a></td>
							<!-- updateMemberForm -> updateMemberAction -->
							<td>
								<form action="<%= request.getContextPath() %>/member/insertMemberScoreAction.jsp" method="post" name="insertScoreFormAction">
									<p>MemberScore �Է�</p>
									<div>
										<input type="hidden" id="memberNo" name="memberNo" value="<%=member.getMemberNo() %>">
									</div>
									<div>
										<input type="text" id="memberScore" name="memberScore">
									</div>
									<div>
										<button type="submit" id="signMemberScore">�Է�</button>
									</div>
								</form>
							</td>
							<td><a href = "<%= request.getContextPath() %>/member/memberAndScoreList.jsp?memberNo=<%=member.getMemberNo()%>">��������</a></td>
						</tr>
	<%
		}
	%>
					</table>
				</div>
	<%
		if (currentPage > 1) {
	%>
			<a href="./memberList.jsp?currentPage=<%=currentPage - 1%>">�� ����</a>
	<%
		}
		int lastPage = rowNumber / rowPerPage;
		if (rowNumber % rowPerPage != 0) {
			lastPage++;
		}
		if (currentPage < lastPage){
	%>
			<a href="./memberList.jsp?currentPage=<%=currentPage + 1%>">���� ��</a>
	<%
		}
	%>
				<div>
					<form action="<%= request.getContextPath() %>/member/memberList.jsp" method="post" name="searchMemberFormAction">
						<div>
							�̸� :
							<input type = "text" name = "searchName">
							<button type="submit" id="searchMember">�˻�</button>
						</div>
					</form>
				</div>
			</div>
			
			<div id="bottom">
				
			</div>
			
		</div>
	</body>	
</html>