<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeAndScore" %>
<%@ page import="service.EmployeeScoreDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%	
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	int score = Integer.parseInt(request.getParameter("score"));

	EmployeeScoreDAO employeeScoreDAO = new EmployeeScoreDAO();
	int Check = employeeScoreDAO.selectCheck(employeeNo); 
	
	//0�̸� �߰�, 1�̸� ����
	if(Check==0){
		int insertCheck = employeeScoreDAO.insertScore(employeeNo, score);
		//0�̸� �Է� ����
		if(insertCheck==0){
			System.out.print("������ �߰� ����");
		}
	}else if(Check==1){
		int updateCheck = employeeScoreDAO.updateScore(employeeNo, score);
		//0�̸� ���� ����
		if(updateCheck==0){
			System.out.print("������ ���� ����");
		}
	}
	response.sendRedirect(request.getContextPath()+"/Employee/employeeList.jsp");
%>
</body>
</html>