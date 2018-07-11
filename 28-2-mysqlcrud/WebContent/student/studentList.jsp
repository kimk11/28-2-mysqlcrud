<!-- 28�� ������ -->
<!-- 2018-07-02 -->
<!-- student ����Ʈ ���� �ۼ� -->
<!-- ������ �۾� �߰� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentDAO"%>
<%@ page import="service.Student"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css" />

<style type="text/css">
	table {
		border-collapse: collapse;
	}
	table, th, td{
		border: 1px solid #0000ff;
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
				<li>
					Insert
					<ul class="menuTwo">
						<li><a href="<%= request.getContextPath() %>/Employee/insertEmployeeForm.jsp">Employee</a></li>
						<li><a href="<%= request.getContextPath() %>/member/insertMemberForm.jsp">Member</a></li>
						<li><a href="<%= request.getContextPath() %>/student/insertStudentForm.jsp">Student</a></li>
						<li><a href="<%= request.getContextPath() %>/teacher/insertTeacherForm.jsp">Teacher</a></li>
					</ul>
				</li>
				<li>
					List
					<ul class="menuTwo">
						<li><a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">Employee</a></li>
						<li><a href="<%= request.getContextPath() %>/member/memberList.jsp">Member</a></li>
						<li><a href="<%= request.getContextPath() %>/student/studentList.jsp">Student</a></li>
						<li><a href="<%= request.getContextPath() %>/teacher/teacherList.jsp">Teacher</a></li>
					</ul>
				</li>
				<li>
					ScoreAVG
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
	<%
		request.setCharacterEncoding("euckr");
	
		String word="";
		if(request.getParameter("word")!=null){
			word = request.getParameter("word");
		}
	%>
		<form action="<%= request.getContextPath() %>/student/studentList.jsp" method="post">
			�̸��˻� : <input type="text" name="word">
			<button type="submit">�˻�</button>
		</form>
	<%
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPage = 2;
		StudentDAO studentDao = new StudentDAO();
		ArrayList<Student> studentList =  studentDao.selectStudentByPage(currentPage, rowPage, word);
	// 	System.out.print(studentList.get(1).getStudentName()+"<<<<studentList");
	%>
		<table>
			<tr>
				<th>studentNo</th><th>studentName</th><th>studentAge</th><th>�ּ��Է�</th><th>����</th><th>����</th><th>�����Է�</th><th>��������</th>
																																<!-- ���ι� ���� -->
			</tr>
			<% 
				for(int i=0 ; i<studentList.size() ; i++){
					Student student = studentList.get(i);
					%>
					<tr>
						<td><%= student.getStudentNo() %></td>
						<td><a href="<%= request.getContextPath() %>/student/studentAddrList.jsp?studentNo=<%= student.getStudentNo() %>"><%= student.getStudentName() %></a></td>
						<td><%= student.getStudentAge() %></td>
						<td>
							<div>
								<form action="<%= request.getContextPath() %>/student/insertStudentAddrAction.jsp" method="post" name="formAction">
									<div>
										<input type="hidden" id="studentNo" name="studentNo" value="<%= student.getStudentNo() %>" readonly="readonly">
									</div>
									<div>
										<label>�ּ� : </label>
										<input type="text" id="studentAddrContent" name="studentAddrContent">
									</div>
									<div>
										<button type="submit" id="signStudent">�Է�</button>
									</div>
								</form>
							</div>
						</td>
						<td><a href="<%= request.getContextPath() %>/student/deleteStudentAction.jsp?studentNo=<%= student.getStudentNo() %>">����</a></td>
						<td><a href="<%= request.getContextPath() %>/student/updateStudentform.jsp?studentNo=<%= student.getStudentNo() %>">����</a></td>
						<td>
							<div>
								<form action="<%= request.getContextPath() %>/student/insertStudentScore.jsp" method="post" name="formAction">
									<div>
										<input type="hidden" id="studentNo" name="studentNo" value="<%= student.getStudentNo() %>" readonly="readonly">
									</div>
									<div>
										<label>���� : </label>
										<input type="text" name="score">
									</div>
									<div>
										<button type="submit" id="signStudent">�Է�</button>
									</div>
								</form>
							</div>
						</td>
						<td><a href="<%= request.getContextPath() %>/student/studentAndScoreList.jsp?studentNo=<%= student.getStudentNo() %>">��������</a></td>
					</tr>
					<%
				}
			%>
		</table>
		
	<%
		int count = studentDao.currentPage();
		int startPage = 1;
		int lastPage = count/rowPage;
		if((count%rowPage)!=0){
			lastPage++;
		}
		
		if(currentPage>startPage){
			%>
				<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= currentPage-1 %>">����</a>
			<%
		}
		if(currentPage<lastPage){
			%>
				<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= currentPage+1 %>">����</a>
			<%
		}
	%>
	</div>
		
	<div id="bottom">
	
	</div>
</div>
</body>
</html>