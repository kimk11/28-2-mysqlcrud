<!-- 2018.07.12 ������ -->
<!-- teacherList.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.TeacherDAO"%>
<%@ page import="service.TeacherAddr"%>
<%@ page import="service.Teacher"%>
<%@page import="service.TeacherScoreDAO"%>
<%@page import="service.TeacherScore"%>
<%@ page import="service.TeacherAddrDAO"%>
<%@ page import="service.TeacherAndScore"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���</title>
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
					if(request.getParameter("searchWord")==null){
						searchWord="";
					}
					int startRow = (currentPage - 1) * pagePerRow; // ���� ������
					int endRow = startRow + (pagePerRow - 1); // ���� ������
					
					
					TeacherDAO teacherDao = new TeacherDAO();
					int totalRow = teacherDao.count(searchWord); // �� row �� 
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
						
						TeacherScoreDAO teacherScoreDao = new TeacherScoreDAO();
						int check = teacherScoreDao.selectCheck(getTeacherNo);
					
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
					<td><a href="<%= request.getContextPath() %>/teacher/deleteTeacherAction.jsp?no=<%=getTeacherNo%>">����</a></td>
					<td><a href="<%= request.getContextPath() %>/teacher/updateTeacherForm.jsp?no=<%=getTeacherNo%>">����</a></td>

					<!-- ���� �Է� �� -->
					<td>
					<%
						// check�� 0�̸� ������ �������� �Է����� ���� ������ ��Ÿ���� �Ѵ�
						// check�� 1�̸� ������ �������� ������ư�� ���� ���Ⱑ ��Ÿ���� �ȴ�.
						
						if(check == 0) {
					%>
						<form action="<%= request.getContextPath() %>/teacher/insertTeacherScore.jsp" method="post">
							<div class="display1">
								<input type="hidden" id="teacherNo" name="teacherNo" value="<%=getTeacherNo%>" readonly="readonly"> 
								<input type="text" id="teacherScore" name="teacherScore" size="7">
							</div>
							<div class="display1">
								<button type="submit" id="btn">�Է�</button>
							</div>
						</form>
						
					<%
					System.out.println(getTeacherNo + "<--no");
						}else if(check == 1) {
					%>
							<a href="<%= request.getContextPath() %>/teacher/updateTeacherScoreForm.jsp?teacherNo=<%=getTeacherNo%>"><button type="submit" id="btn">��������</button></a>
					<%
						}
					%>
					</td>
					
					
					<td>
					<%
						if(check == 0) {
					%>
						��������
					<%
						} else if(check == 1) {
					%>
						<a href="<%=request.getContextPath()%>/teacher/teacherAndScoreList.jsp?no=<%=getTeacherNo%>"><button>��������</button></a>
					<%
						}
					%>
					</td>

				</tr>
				<%
						}
				%>
			</table>
		
			<%
				if (currentPage > 1) {
			%>
			<a href="<%= request.getContextPath() %>/teacher/teacherList.jsp?currentPage=<%=currentPage - 1%>&searchWord=<%=searchWord%>">����</a>
			<%
				}

				int lastPage = (totalRow - 1) / pagePerRow;
				if ((totalRow - 1) % pagePerRow != 0) {
					lastPage++;
				}
				if (currentPage < lastPage) {
			%>
			<a href="<%= request.getContextPath() %>/teacher/teacherList.jsp?currentPage=<%=currentPage + 1%>&searchWord=<%=searchWord%>">����</a> <br>
			<br>
			<%
				}
			%>
			
			<!-- �˻�â -->
			<!-- �˻�â�� �Է��� �̸� ���� �̸� DB�� ������ �� ���ڶ� ���ٸ� ��ġ�ϴ� ���̺��� ���̵��� ���� -->
			<form action="./teacherList.jsp" method="get">
				<div>
					�̸� : <input type="text" name="searchWord">
					<button type="submit">�˻�</button>
				</div>
			</form>
			<br><br><br> 
			<a href="<%= request.getContextPath() %>/teacher/teacherListAboveAvg.jsp"><button>��� �̻�</button></a>
			<a href="<%= request.getContextPath() %>/teacher/teacherList.jsp"><button>��ü����Ʈ</button></a>
		</div>
		<div id="bottom"></div>
	</div>
</body>
</html>