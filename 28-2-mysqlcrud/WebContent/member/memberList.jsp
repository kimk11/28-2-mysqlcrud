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
				<td>회원번호</td>
				<td>회원이름</td>
				<td>회원나이</td>
				<td>주소입력</td>
				<td>삭제</td>
				<td>수정</td>
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
					<p>MemberAddr 입력</p>
					<div>
						<input type="hidden" id="memberNo" name="memberNo" value="<%=u.getMemberNo() %>">
					</div>
					<div>
						<label>주소 : </label>
						<input type="text" id="memberAddrContent" name="memberAddrContent">
						<span id="memberAddrContentValid"></span>
					</div>
					<div>
						<button type="submit" id="signMember">입력</button>
					</div>
					</form>
				</td>
				
				<td><a href = "<%= request.getContextPath() %>/member/deleteMemberAction.jsp?memberNo=<%=u.getMemberNo() %>">삭제</a></td>
				<td><a href = "<%= request.getContextPath() %>/member/updateMemberForm.jsp?memberNo=<%=u.getMemberNo() %>">수정</a></td>
				<!-- updateMemberForm -> updateMemberAction -->
			</tr>
	<%
		}
	%>
		</table>
	<%
		if (currentPage > 1) {
	%>
		<a href="./memberList.jsp?currentPage=<%=currentPage - 1%>">◀ 이전</a>
	<%
		}
		int lastPage = rowNumber / rowPerPage;
		if (rowNumber % rowPerPage != 0) {
			lastPage++;
		}
		if (currentPage < lastPage){
	%>
		<a href="./memberList.jsp?currentPage=<%=currentPage + 1%>">다음 ▶</a>
	<%
		}
	%>
		<form>
			<div>
				이름 :
				<input type = "text" name = "searchName">
				<button type = "button">검색</button>
			</div>
		</form>
	
	</body>	
</html>