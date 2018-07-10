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
	</head>
	<body>
			<table border = "1">
				<tr>
					<td>점수번호</td>
					<td>회원번호</td>
					<td>회원이름</td>
					<td>회원나이</td>
					<td>회원점수</td>
				</tr>
	<%
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		MemberScoreDAO memberScoreDao = new MemberScoreDAO();
		
		ArrayList<MemberAndScore> list = new ArrayList<>();
		list = memberScoreDao.selectMemberAndScored(memberNo);
		
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
	</body>
</html>