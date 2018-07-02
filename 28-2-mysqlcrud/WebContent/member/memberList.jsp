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
		<table>
			<tr>
				<td>회원번호</td>
				<td>회원이름</td>
				<td>회원나이</td>
			</tr>
		
	<%
		MemberDAO memberdao = new MemberDAO();
		
		
		int rowNumber = memberdao.count();
		
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
				<td><%=u.getMemberName() %></td>
				<td><%=u.getMemberAge() %></td>
			</tr>
	<%
		}
	%>
		</table>
	<%
		if (currentPage > 1) {
	%>
		<div>
			<div><a href="./memberList.jsp?currentPage=<%=currentPage - 1%>">◀ 이전</a></div>
		</div>
	<%
		}
		int lastPage = rowNumber / rowPerPage;
		if (rowNumber % rowPerPage != 0) {
			lastPage++;
		}
		if (currentPage < lastPage){
	%>
		<div>
			<div><a href="./memberList.jsp?currentPage=<%=currentPage + 1%>">다음 ▶</a></div>
		</div>
	<%
		}
	%>
	</body>	
</html>