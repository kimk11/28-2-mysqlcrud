<!-- 2018.06.26 ������ -->
<!-- Teacher �Է� ó�� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insert Teacher Action</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		// Teacher Ŭ������ ���� ������ ���ο� ��ü�� �ּҸ� teacher�� ����ش�.
		Teacher teacher = new Teacher();
		teacher.setTeacherName(request.getParameter("teacherName"));
	
		/* 
		teacher ��ü���������� �ּҰ��� ã�ư� int�� TeacherAge��
		request�� ��û�� �� �� String Ÿ������ �ۿ� �� �����´�.
		�׷��� integer.parseInt�� String -> int�� �ٲ��ش�.
		*/
		teacher.setTeacherAge(Integer.parseInt(request.getParameter("teacherAge")));
		
		
		//TeacherDAO Ŭ������ ���� ������ ���ο� ��ü�� �ּҸ� dao�� ����ش�.
		TeacherDAO dao = new TeacherDAO();
		dao.insertTeacher(teacher); // dao ��ü���������� insertTeacher�޼��� ȣ��
		
		
		response.sendRedirect(request.getContextPath() + "/teacher/insertTeacherForm.jsp");
	%>

</body>
</html>