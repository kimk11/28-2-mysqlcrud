<!-- 2018.06.26 송유빈 -->
<!-- Teacher 주소 처리 화면 -->

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
<!-- import 역활 패키지 member클래스 및 멤버 클래스 통해 선언 생성 호출 -->
<jsp:setProperty property="*" name="ta" />
<!-- * 입력 개수만큼 호출  -->
<!-- 프로퍼티명 = 전역변수명  -->
	
<%	
	
	TeacherAddrDAO dao = new TeacherAddrDAO();
	dao.insertTeacherAddr(ta);
%>
</body>
</html>