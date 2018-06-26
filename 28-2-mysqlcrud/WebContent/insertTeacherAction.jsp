<!-- 2018.06.26 송유빈 -->
<!-- Teacher 입력 처리 -->
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
	<!-- import 역활 패키지 member클래스 및 멤버 클래스 통해 선언 생성 호출 -->
	<jsp:setProperty property="*" name="t" />
	<!-- * 입력 개수만큼 호출  -->
	<!-- 프로퍼티명 = 전역변수명  -->

	<%
		//TeacherDAO 클래스를 통해 생성된 새로운 객체의 주소를 dao에 담아준다.
		TeacherDAO dao = new TeacherDAO();
		dao.insertTeacher(t); // dao 객체참조변수에 insertTeacher메서드 호출
	%>
	
</body>
</html>