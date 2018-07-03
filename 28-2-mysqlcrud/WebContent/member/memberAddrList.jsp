<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberAddrDAO" %>
<%@ page import = "service.MemberAddr" %>
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
				<td>이메일번호</td>
				<td>회원번호</td>
				<td>이메일</td>
			</tr>
		
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
		<form>
			<div>
				이름 :
				<input type = "text" name = "searchName">
				<button type = "button">검색</button>
			</div>
		</form>
	
	</body>	
</html>