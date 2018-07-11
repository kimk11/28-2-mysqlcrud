<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.TeacherDAO"%>
<%@ page import="service.TeacherAddr"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherAddrDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
table, td, th, tr {
	border: solid 1px #cccccc;
	border-collapse: collapse;
	padding: 5px 10px;
}

#no {
	width: 50px;
}

#name {
	width: 150px;
}

#age {
	width: 80px;
}

#addr {
	width: 200px;
}

.display1 {
	display: inline-block;
}
</style>
</head>
<body>
	<h2>������ List!</h2>
	<table>
		<tr>
			<th id="no">No</th>
			<th id="name">�̸�</th>
			<th id="age">����</th>
			<th>�ּ�</th>
			<!-- �ټ� -->
			<th>����</th>
			<th>����</th>
			<th>�����Է�</th>
			<!--  �ѹ� -->
			<th>��������</th>
			<!--  �ѹ� -->


		</tr>

		<%
			request.setCharacterEncoding("EUC-KR");
			int currentPage = 1; //����������
			int pagePerRow = 5; //�� �������� ���� row ��
			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}

			String searchWord = request.getParameter("searchWord");
			int startRow = (currentPage - 1) * pagePerRow;
			int endRow = startRow + (pagePerRow - 1);

			TeacherDAO teacherDao = new TeacherDAO();
			int totalRow = teacherDao.count();
			ArrayList<Teacher> list = teacherDao.selectTeacherByPage(startRow, pagePerRow, searchWord);

			TeacherAddr teacherAddr = new TeacherAddr();
			TeacherAddrDAO teacherAddrDao = new TeacherAddrDAO();

			if (endRow > list.size() - 1) {
				endRow = list.size() - 1;
			}

			// �ݺ���
			for (int i = 0; i < list.size(); i++) {
				Teacher teacher = list.get(i);

				int getTeacherNo = teacher.getTeacherNo();
				String getTeacherName = teacher.getTeacherName();
				int getTeacherAge = teacher.getTeacherAge();

				ArrayList<TeacherAddr> list2 = teacherAddrDao.selectTeacherAddr(getTeacherNo);
				String getTeacherAddrContent = teacherAddr.getTeacherAddrContent();
		%>
		<tr>
			<td><%=getTeacherNo%></td>
			<td><a href="./TeacherAddrList.jsp?no=<%=getTeacherNo%>"><%=getTeacherName%></a></td>
			<!-- �̸� Ŭ�� �� �ּ���������  -->
			<td><%=getTeacherAge%></td>
			<td>
				<form
					action="<%=request.getContextPath()%>/teacher/insertTeacherAddrAction.jsp"
					method="post" name="f">
					<div>
						<input type="hidden" id="teacherNo" name="teacherNo"
							value="<%=getTeacherNo%>" readonly="readonly"> <input
							type="text" id="teacherAddrContent" name="teacherAddrContent"
							size="30px" id="textAddr"> <span
							id="teacherAddrContentHelper"></span>
					</div>
					<div>
						<button type="submit" id="btn">�Է�</button>
					</div>

				</form>
			</td>
			<td><a href="./deleteTeacherAction.jsp?no=<%=getTeacherNo%>">����</a></td>
			<td><a href="./updateTeacherForm.jsp?no=<%=getTeacherNo%>">����</a></td>

			<td>
				<form action="./insertTeacherScore.jsp" method="post">
					<div class="display1">
						<input type="hidden" id="teacherNo" name="teacherNo" value="<%=getTeacherNo%>" readonly="readonly"> 
						<input type="text" id="teacherScore" name="teacherScore" size="7">
					</div>
					<div class="display1">
						<button type="submit" id="btn">�Է�</button>
					</div>
				</form>
			</td>
			<td><a href="<%= request.getContextPath() %>/teacher/teacherAndScoreList.jsp??no=<%=getTeacherNo%>">��������</a></td>

		</tr>
		<%
			}
		%>
	</table>



	<%
		if (currentPage > 1) {
	%>
	<a href="./teacherList.jsp?currentPage=<%=currentPage - 1%>">����</a>
	<%
		}

		int lastPage = (totalRow - 1) / pagePerRow;
		if ((totalRow - 1) % pagePerRow != 0) {
			lastPage++;
		}
		if (currentPage < lastPage) {
	%>
	<a href="./teacherList.jsp?currentPage=<%=currentPage + 1%>">����</a>
	<br>
	<br>
	<%
		}
	%>
	<form action="./teacherList.jsp" method="post">
		<div>
			�̸� : <input type="text" name="searchWord">
			<button type="submit">�˻�</button>
		</div>
	</form>
</body>
</html>