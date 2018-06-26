<!-- 28기 김진우 -->
<!-- 2018-06-26 -->
<!-- studentaddr 입력 처리 작성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="service.studentAddrDAO"%>
<%@page import="service.StudentAddr"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
<%
	request.setCharacterEncoding("euckr");

	StudentAddr studentAddr = new StudentAddr();
	
	studentAddr.setStudentAddrNo(Integer.parseInt(request.getParameter("StudentAddrNo")));
	studentAddr.setStudentAddrContent(request.getParameter("StudentAddrContent"));
	
	studentAddrDAO studentDao = new studentAddrDAO();
	studentDao.studentAddrInsert(studentAddr);
%>

</body>
</html>