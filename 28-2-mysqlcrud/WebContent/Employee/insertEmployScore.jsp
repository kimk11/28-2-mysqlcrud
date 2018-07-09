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
	
	//0이면 추가, 1이면 수정
	if(Check==0){
		int insertCheck = employeeScoreDAO.insertScore(employeeNo, score);
		//0이면 입력 실패
		if(insertCheck==0){
			System.out.print("데이터 추가 실패");
		}
	}else if(Check==1){
		int updateCheck = employeeScoreDAO.updateScore(employeeNo, score);
		//0이면 수정 실패
		if(updateCheck==0){
			System.out.print("데이터 수정 실패");
		}
	}
	response.sendRedirect(request.getContextPath()+"/Employee/employeeList.jsp");
%>
</body>
</html>