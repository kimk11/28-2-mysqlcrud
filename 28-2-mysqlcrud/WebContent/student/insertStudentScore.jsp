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
	int Check = studentScoreDAO.selectCheck(studentNo);
	
	//0이면 추가, 1이면 수정
	if(Check==0){
		int insertCheck = studentScoreDAO.insertScore(studentNo, score);
		//0이면 입력 실패
		if(insertCheck==0){
			System.out.print("데이터 추가 실패");
		}
	}else if(Check==1){
		int updateCheck = studentScoreDAO.updateScore(studentNo, score);
		//0이면 수정 실패
		if(updateCheck==0){
			System.out.print("데이터 수정 실패");
		}
	}
	response.sendRedirect(request.getContextPath()+"/student/studentList.jsp");
%>
</body>
</html>