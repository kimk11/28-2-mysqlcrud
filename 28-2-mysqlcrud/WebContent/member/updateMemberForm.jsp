<!-- 28�� ���� -->
<!-- 2018-07-03 -->
<!-- member ������Ʈ �� �ۼ� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDAO" %>
<%@ page import = "service.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateMemberForm</title>
	</head>
<body>
<%
request.setCharacterEncoding("euckr");

int memberNo = Integer.parseInt(request.getParameter("memberNo"));

MemberDAO memberDao = new MemberDAO();
Member member = memberDao.selectMember(memberNo);

%>
	<div>
		<form action="<%= request.getContextPath() %>/member/updateMemberAction.jsp" method="post" name="formAction">
			<p>Member ����</p>
			<input type = "hidden" id="memberNo" name="memberNo" value="<%=member.getMemberNo()%>">
			<div>
				<label>�̸� : </label>
				<input type="text" id="memberName" name="memberName" value = "<%=member.getMemberName()%>">
				<span id="memberNameValid" class="memberBlank"></span>
			</div>
			<div>
				<label>���� : </label>
				<input type="text" id="memberAge" name="memberAge" value ="<%=member.getMemberAge()%>">
				<span id="memberAgeValid" class="memberBlank"></span>
			</div>
			<div>
				<button type="submit" id="signMember">����</button>
			</div>
		</form>
	</div>
</body>
</html>