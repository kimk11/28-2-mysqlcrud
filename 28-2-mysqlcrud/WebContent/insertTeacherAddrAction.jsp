<!-- 2018.06.26 ������ -->
<!-- Teacher �ּ� ó�� ȭ�� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherAddrDAO" %>
<%@ page import = "service.TeacherAddr" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insert Teacher Addr Action</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="ta" class="service.TeacherAddr"></jsp:useBean>
<!-- import ��Ȱ ��Ű�� memberŬ���� �� ��� Ŭ���� ���� ���� ���� ȣ�� -->
<jsp:setProperty property="*" name="ta" />
<!-- * �Է� ������ŭ ȣ��  -->
<!-- ������Ƽ�� = ����������  -->
	
<%	
	
	TeacherAddrDAO dao = new TeacherAddrDAO();
	dao.insertTeacherAddr(ta);
%>
</body>
</html>