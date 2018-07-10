<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberScoreDAO"%>
<%@ page import = "service.MemberAndScore"%>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberListAboveAvg</title>
	</head>
	<body>
		<h1>memberListAboveAvg</h1>
		<%
			MemberScoreDAO memberScoreDao = new MemberScoreDAO();
			int average = memberScoreDao.selectScoreAvg();
		
			ArrayList<MemberAndScore> list = new ArrayList<>();
			list = memberScoreDao.selectMemberListAboveAvg();
		%>
		<div>
			평균 : <%=average%>
		</div>
		<table border = "1">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원이름</th>
					<th>회원점수</th>
				</tr>
			</thead>
			<tbody>
				<%
				for(int i=0 ; i<list.size(); i++){
					MemberAndScore memberAndScore = list.get(i);
				%>
				<tr>
					<td><%=memberAndScore.getMemberScore().getMemberNo()%></td>
					<td><%=memberAndScore.getMember().getMemberName()%></td>
					<td><%=memberAndScore.getMemberScore().getScore()%></td>
				</tr>
				
				<%
				}
				%>
			</tbody>
		</table>
	</body>
</html>