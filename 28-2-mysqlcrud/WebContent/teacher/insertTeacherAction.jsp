<!-- 2018.06.26 송유빈 -->
<!-- Teacher 입력 처리 -->
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
		// Teacher 클래스를 통해 생성된 새로운 객체의 주소를 teacher에 담아준다.
		Teacher teacher = new Teacher();
		teacher.setTeacherName(request.getParameter("teacherName"));
	
		/* 
		teacher 객체참조변수에 주소값을 찾아가 int인 TeacherAge를
		request로 요청을 할 땐 String 타입으로 밖에 못 가져온다.
		그래서 integer.parseInt로 String -> int로 바꿔준다.
		*/
		teacher.setTeacherAge(Integer.parseInt(request.getParameter("teacherAge")));
		
		
		//TeacherDAO 클래스를 통해 생성된 새로운 객체의 주소를 dao에 담아준다.
		TeacherDAO dao = new TeacherDAO();
		dao.insertTeacher(teacher); // dao 객체참조변수에 insertTeacher메서드 호출
		
		
		response.sendRedirect(request.getContextPath() + "/teacher/insertTeacherForm.jsp");
	%>

</body>
</html>