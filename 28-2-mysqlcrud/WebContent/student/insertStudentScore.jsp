<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAndScore" %>
<%@ page import="service.StudentScoreDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%	
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	int score = Integer.parseInt(request.getParameter("score"));

	StudentScoreDAO studentScoreDAO = new StudentScoreDAO();
	
	
	int insertCheck = studentScoreDAO.insertScore(studentNo, score);
	//0이면 입력 실패
	if(insertCheck==0){
		System.out.print("데이터 추가 실패");
	}
		
	response.sendRedirect(request.getContextPath()+"/student/studentList.jsp");
%>
</body>
</html>