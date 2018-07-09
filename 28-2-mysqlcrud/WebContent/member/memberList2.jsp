<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDAO" %>
<%@ page import = "service.Member" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberList</title>
	</head>
	<body>
		<table border ="1">
			<tr>
				<td>ȸ����ȣ</td>
				<td>ȸ���̸�</td>
				<td>ȸ������</td>
				<td>�ּ��Է�</td>
				<td>����</td>
				<td>����</td>
			</tr>
		
	<%
		MemberDAO memberdao = new MemberDAO();
		
		
		int rowNumber = memberdao.countMember();
		
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
			
		ArrayList<Member> list = memberdao.selectMemberByPage(begin, rowPerPage);
		System.out.println(list + "<-- list");
		
		for(int i=0;i<list.size();i++){
			Member u = list.get(i);
	%>
			<tr>
				<td><%=u.getMemberNo() %></td>
				<td><a href = "<%= request.getContextPath() %>/member/memberAddrList.jsp?memberNo=<%=u.getMemberNo() %>"><%=u.getMemberName() %></a></td>
				<td><%=u.getMemberAge() %></td>
				
				<td>
					<form action="<%= request.getContextPath() %>/member/insertMemberAddrAction.jsp" method="post" name="formAction">
					<p>MemberAddr �Է�</p>
					<div>
						<input type="hidden" id="memberNo" name="memberNo" value="<%=u.getMemberNo() %>">
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
				
				<td><a href = "<%= request.getContextPath() %>/member/deleteMemberAction.jsp?memberNo=<%=u.getMemberNo() %>">����</a></td>
				<td><a href = "<%= request.getContextPath() %>/member/updateMemberForm.jsp?memberNo=<%=u.getMemberNo() %>">����</a></td>
				<!-- updateMemberForm -> updateMemberAction -->
			</tr>
	<%
		}
	%>
		</table>
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
		<form>
			<div>
				�̸� :
				<input type = "text" name = "searchName">
				<button type = "button">�˻�</button>
			</div>
		</form>
	
	</body>	
</html>