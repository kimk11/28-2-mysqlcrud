<!-- 28기 현희문 -->
<!-- 2018-07-03 -->
<!-- member 리스트 작성 -->

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
				<td>주소입력</td><!-- 다수 -->
				<td>주소보기</td>
				<td>회원삭제</td>
				<td>회원수정</td>
				<td>점수입력</td><!-- 한번 -->
				<td>점수보기</td>
			</tr>
		
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
		
		for(int i=0;i<list.size();i++){
			Member member = list.get(i);
	%>
			<tr>
				<td><%=member.getMemberNo() %></td>
				<td><a href = "<%= request.getContextPath() %>/member/memberAddrList.jsp?memberNo=<%=member.getMemberNo() %>"><%=member.getMemberName() %></a></td>
				<td><%=member.getMemberAge() %></td>
				
				<td>
					<form action="<%= request.getContextPath() %>/member/insertMemberAddrAction.jsp" method="post" name="insertAddrFormAction">
						<p>MemberAddr 입력</p>
						<div>
							<input type="hidden" id="memberNo" name="memberNo" value="<%=member.getMemberNo() %>">
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
				<td><a href = "<%= request.getContextPath() %>/member/memberAddrList.jsp">주소보기</a></td>
				<td><a href = "<%= request.getContextPath() %>/member/deleteMemberAction.jsp?memberNo=<%=member.getMemberNo() %>">삭제</a></td>
				<td><a href = "<%= request.getContextPath() %>/member/updateMemberForm.jsp?memberNo=<%=member.getMemberNo() %>">수정</a></td>
				<!-- updateMemberForm -> updateMemberAction -->
				<td>
					<form action="<%= request.getContextPath() %>/member/insertMemberScoreAction.jsp" method="post" name="insertScoreFormAction">
						<p>MemberScore 입력</p>
						<div>
							<input type="hidden" id="memberNo" name="memberNo" value="<%=member.getMemberNo() %>">
						</div>
						<div>
							<input type="text" id="memberScore" name="memberScore">
						</div>
						<div>
							<button type="submit" id="signMemberScore">입력</button>
						</div>
					</form>
				</td>
				<td><a href = "<%= request.getContextPath() %>/member/memberAndScoreList.jsp?memberNo=<%=member.getMemberNo()%>">점수보기</a></td>
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
		<form action="<%= request.getContextPath() %>/member/memberList.jsp" method="post" name="searchMemberFormAction">
			<div>
				이름 :
				<input type = "text" name = "searchName">
				<button type="submit" id="searchMember">검색</button>
			</div>
		</form>
	
	</body>	
</html>