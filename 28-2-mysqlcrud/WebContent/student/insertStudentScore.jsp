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
	
	//0�̸� �߰�, 1�̸� ����
	if(Check==0){
		int insertCheck = studentScoreDAO.insertScore(studentNo, score);
		//0�̸� �Է� ����
		if(insertCheck==0){
			System.out.print("������ �߰� ����");
		}
	}else if(Check==1){
		int updateCheck = studentScoreDAO.updateScore(studentNo, score);
		//0�̸� ���� ����
		if(updateCheck==0){
			System.out.print("������ ���� ����");
		}
	}
	response.sendRedirect(request.getContextPath()+"/student/studentList.jsp");
%>
</body>
</html>