<!-- 28�� ���� -->
<!-- 2018-07-09 -->
<!-- memberAndScore ����Ʈ �ۼ� -->

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
					<td>������ȣ</td>
					<td>ȸ����ȣ</td>
					<td>ȸ���̸�</td>
					<td>ȸ������</td>
					<td>ȸ������</td>
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