<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table.css" />
<style>
table, th, td, th, tr {
	border: solid 1px #cccccc;
	border-collapse: collapse;
	padding: 5px 10px;
}

#no {
	width: 50px;
}

#name {
	width: 50px;
}

#age {
	width: 50px;
}

#addr {
	width: 200px;
}

.display1 {
	display: inline-block;
}


.fl {
	display: inline-block;
} 
</style>
</head>
<body>
	<div id="wrapper clearfix">
		<div id="header">
			<h1>&lt;/&gt; 28 - 2 mysqlcrud</h1>
		</div>

		<div id="left">
			<div>
				<ul class="menuOne">
					<li>Insert
						<ul class="menuTwo">
							<li><a href="<%= request.getContextPath() %>/Employee/insertEmployeeForm.jsp">Employee</a></li>
							<li><a href="<%= request.getContextPath() %>/member/insertMemberForm.jsp">Member</a></li>
							<li><a href="<%= request.getContextPath() %>/student/insertStudentForm.jsp">Student</a></li>
							<li><a href="<%= request.getContextPath() %>/teacher/insertTeacherForm.jsp">Teacher</a></li>
						</ul>
					</li>
					<li>List
						<ul class="menuTwo">
							<li><a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">Employee</a></li>
							<li><a href="<%= request.getContextPath() %>/member/memberList.jsp">Member</a></li>
							<li><a href="<%= request.getContextPath() %>/student/studentList.jsp">Student</a></li>
							<li><a href="<%= request.getContextPath() %>/teacher/teacherList.jsp">Teacher</a></li>
						</ul>
					</li>
					<li>ScoreAVG
						<ul class="menuTwo">
							<li><a href="<%= request.getContextPath() %>/Employee/eployeeListAboveAvg.jsp">Employee</a></li>
							<li><a href="<%= request.getContextPath() %>/member/memberListAboveAvg.jsp">Member</a></li>
							<li><a href="<%= request.getContextPath() %>/student/studentListAboveAvg.jsp">Student</a></li>
							<li><a href="<%= request.getContextPath() %>/teacher/teacherListAboveAvg.jsp">Teacher</a></li>
						</ul>
					</li>
				</ul>
			</div>

		</div>

		<div id="light">

			<h2>������ List!</h2>
			<table>
				<tr class="even">
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

					String searchWord = request.getParameter("searchWord"); // �̸� �˻�â
					int startRow = (currentPage - 1) * pagePerRow; // ���� ������
					int endRow = startRow + (pagePerRow - 1); // ���� ������

					TeacherDAO teacherDao = new TeacherDAO();
					int totalRow = teacherDao.count(); // �� row �� 
					ArrayList<Teacher> list = teacherDao.selectTeacherByPage(startRow, pagePerRow, searchWord);

					TeacherAddr teacherAddr = new TeacherAddr();
					TeacherAddrDAO teacherAddrDao = new TeacherAddrDAO();

					if (endRow > list.size() - 1) {
						endRow = list.size() - 1;
					}

					// �ݺ���  list : TeacherDAO.java ����¡ �۾� �� �˻�
					for (int i = 0; i < list.size(); i++) {
						Teacher teacher = list.get(i);

						int getTeacherNo = teacher.getTeacherNo();
						String getTeacherName = teacher.getTeacherName();
						int getTeacherAge = teacher.getTeacherAge();

						// list2 : TeacherAddrDAO.java �� ���� �ּ� ���̺� 
						ArrayList<TeacherAddr> list2 = teacherAddrDao.selectTeacherAddr(getTeacherNo);
						String getTeacherAddrContent = teacherAddr.getTeacherAddrContent();
				%>
				<tr class = "even">
					<td><%=getTeacherNo%></td>
					<td><a href="./TeacherAddrList.jsp?no=<%=getTeacherNo%>"><%=getTeacherName%></a></td>
					<!-- �̸� Ŭ�� �� �ּ���������  -->
					<td><%=getTeacherAge%></td>
					<td>
						<!-- �ּ� �Է� �� -->
						<form
							action="<%=request.getContextPath()%>/teacher/insertTeacherAddrAction.jsp"
							method="post" name="f">
							<div class="fl">
								<input type="hidden" id="teacherNo" name="teacherNo" value="<%=getTeacherNo%>" readonly="readonly"> 
								<input type="text" id="teacherAddrContent" name="teacherAddrContent" size="30px" id="textAddr"> 
								<span id="teacherAddrContentHelper"></span>
							</div>
							<div class="fl">
								<button type="submit" id="btn">�Է�</button>
							</div>

						</form>
					</td>
					<td><a href="./deleteTeacherAction.jsp?no=<%=getTeacherNo%>">����</a></td>
					<td><a href="./updateTeacherForm.jsp?no=<%=getTeacherNo%>">����</a></td>

					<!-- ���� �Է� �� -->
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
					<td><a
						href="<%=request.getContextPath()%>/teacher/teacherAndScoreList.jsp?no=<%=getTeacherNo%>">��������</a></td>

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
			<a href="./teacherList.jsp?currentPage=<%=currentPage + 1%>">����</a> <br>
			<br>
			<%
				}
			%>
			<!-- �˻�â -->
			<form action="./teacherList.jsp" method="post">
				<div>
					�̸� : <input type="text" name="searchWord">
					<button type="submit">�˻�</button>
				</div>
			</form>
			<br> <br> <br> <a href="./teacherListAboveAvg.jsp"><button>���
					�̻�</button></a>

		</div>
		<div id="bottom"></div>
	</div>
</body>
</html>