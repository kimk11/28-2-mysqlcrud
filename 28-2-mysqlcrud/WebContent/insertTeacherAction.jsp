<!-- 2018.06.26 ������ -->
<!-- Teacher �Է� ó�� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insert Teacher Action</title>
</head>
<body>
	<% request.setCharacterEncoding("euc-kr"); %>
	<jsp:useBean id="t" class="service.Teacher"></jsp:useBean>
	<!-- import ��Ȱ ��Ű�� memberŬ���� �� ��� Ŭ���� ���� ���� ���� ȣ�� -->
	<jsp:setProperty property="*" name="t" />
	<!-- * �Է� ������ŭ ȣ��  -->
	<!-- ������Ƽ�� = ����������  -->

	<%
		//TeacherDAO Ŭ������ ���� ������ ���ο� ��ü�� �ּҸ� dao�� ����ش�.
		TeacherDAO dao = new TeacherDAO();
		dao.insertTeacher(t); // dao ��ü���������� insertTeacher�޼��� ȣ��
	%>
	
</body>
</html>