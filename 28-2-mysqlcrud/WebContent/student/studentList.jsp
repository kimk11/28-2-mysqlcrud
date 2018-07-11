<!-- 28기 김진우 -->
<!-- 2018-07-02 -->
<!-- student 리스트 보기 작성 -->
<!-- 페이지 작업 추가 -->
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
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/table.css" />

<style type="text/css">
.centered { display: table; margin-left: auto; margin-right: auto; }
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
		<div class="centered">
		<%
			request.setCharacterEncoding("euckr");
		
			String word="";
			if(request.getParameter("word")!=null){
				word = request.getParameter("word");
			}
		%>
			<form action="<%= request.getContextPath() %>/student/studentList.jsp" method="post">
				이름검색 : <input type="text" name="word">
				<button type="submit">검색</button>
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
				<tr class="even">
					<th>studentNo</th><th>studentName</th><th>studentAge</th><th>주소입력</th><th>삭제</th><th>수정</th><th>점수입력</th><th>점수보기</th>
																																	<!-- 조인문 연습 -->
				</tr>
				<% 
					for(int i=0 ; i<studentList.size() ; i++){
						Student student = studentList.get(i);
						%>
						<tr class="even">
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
											<label>주소 : </label>
											<input type="text" id="studentAddrContent" name="studentAddrContent">
										</div>
										<div>
											<button type="submit" id="signStudent">입력</button>
										</div>
									</form>
								</div>
							</td>
							<td><a href="<%= request.getContextPath() %>/student/deleteStudentAction.jsp?studentNo=<%= student.getStudentNo() %>">삭제</a></td>
							<td><a href="<%= request.getContextPath() %>/student/updateStudentform.jsp?studentNo=<%= student.getStudentNo() %>">수정</a></td>
							<td>
								<div>
									<form action="<%= request.getContextPath() %>/student/insertStudentScore.jsp" method="post" name="formAction">
										<div>
											<input type="hidden" id="studentNo" name="studentNo" value="<%= student.getStudentNo() %>" readonly="readonly">
										</div>
										<div>
											<label>점수 : </label>
											<input type="text" name="score">
										</div>
										<div>
											<button type="submit" id="signStudent">입력</button>
										</div>
									</form>
								</div>
							</td>
							<td><a href="<%= request.getContextPath() %>/student/studentAndScoreList.jsp?studentNo=<%= student.getStudentNo() %>">점수보기</a></td>
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
		%>
			<div class="centered">
		<%
				if(currentPage>startPage){
					%>
						<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= currentPage-1 %>">이전</a>
					<%
				}
				for(int i=0 ; i<lastPage ; i++){
					%>
						<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= i+1 %>"><%= i+1 %></a>
					<%
				}
				if(currentPage<lastPage){
					%>
						<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= currentPage+1 %>">다음</a>
					<%
				}
		%>
			</div>
		</div>
	</div>
		
	<div id="bottom">
	
	</div>
</div>
</body>
</html>