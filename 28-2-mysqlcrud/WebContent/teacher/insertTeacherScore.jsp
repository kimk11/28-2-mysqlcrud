<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherScoreDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int score = Integer.parseInt(request.getParameter("teacherScore")); 
	int no = Integer.parseInt(request.getParameter("teacherNo"));
	TeacherScoreDAO teacherScoreDao = new TeacherScoreDAO();
	teacherScoreDao.insertTeacherScore(score, no);
	int check = teacherScoreDao.selectCheck(no);
	
		// Score 점수가 없으면 새로 추가를 하고, 있으면 수정을 할 것이다.
		// 0이면 Score 값이 없고, 1이면 Score 값이 있다.
		if(check==0){	
			int insertCheck = teacherScoreDao.insertTeacherScore(score, no);
		}else{ 
			int updateCheck = teacherScoreDao.updateScore(no, score);
		}
	
	
	response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
%>
</body>
</html>