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
	
		// Score ������ ������ ���� �߰��� �ϰ�, ������ ������ �� ���̴�.
		// 0�̸� Score ���� ����, 1�̸� Score ���� �ִ�.
		if(check==0){	
			int insertCheck = teacherScoreDao.insertTeacherScore(score, no);
		}else{ 
			int updateCheck = teacherScoreDao.updateScore(no, score);
		}
	
	
	response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
%>
</body>
</html>