<!-- 28�� ������ -->
<!-- 2018-07-02 -->
<!-- student ����Ʈ ���� �ۼ� -->
<!-- ������ �۾� �߰� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentDAO"%>
<%@ page import="service.StudentScoreDAO"%>
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
		
			// ������, �������� �����ϱ� ���� ����
			String order = "noDESC";
			if(request.getParameter("order")!=null){
				order = request.getParameter("order");
			}
			System.out.println(order+"<<order employee");
		
			// �˻��ܾ ������ ����
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
			//������������ ������ ����
			int currentPage = 1;
			if(request.getParameter("currentPage")!=null){
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			// ���������� ��� �������� �����ϴ� ����
			int rowPage = 2;
			StudentDAO studentDao = new StudentDAO();
			ArrayList<Student> studentList =  studentDao.selectStudentByPage(currentPage, rowPage, word, order);
		// 	System.out.print(studentList.get(1).getStudentName()+"<<<<studentList");
		%>
			<table>
				<tr class="even">
					<th>
						studentNo
<!-- 								��ȣ �������� �������� ��ư  start-->
						<input type="hidden" id="noOrder" value="<%= order %>">
						<button type="button" id="noBtn">����</button>

<!-- 								��ȣ �������� �������� ��ư  end-->
					</th>
					<th>
						studentName
<!-- 								�̸� �������� �������� ��ư  start-->
						<input type="hidden" id="nameOrder" value="<%= order %>">
						<button type="button" id="nameBtn">����</button>

<!-- 								�̸� �������� �������� ��ư  end-->
					</th>
					<th>
						studentAge
<!-- 								���� �������� �������� ��ư  start-->
						<input type="hidden" id="ageOrder" value="<%= order %>">
						<button type="button" id="ageBtn">����</button>

<!-- 								���� �������� �������� ��ư  end-->
					</th>
					<th>�ּ��Է�</th><th>����</th><th>����</th><th>�����Է�</th><th>��������</th>
																		<!-- ���ι� ���� -->
				</tr>
				<% 
					for(int i=0 ; i<studentList.size() ; i++){
						Student student = studentList.get(i);
						int check = new StudentScoreDAO().selectCheck(student.getStudentNo());
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
							<%
								if(0==check){
								%>
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
								<%
								}else{
								%>
									<a href="<%= request.getContextPath() %>/student/updatestudentScoreForm.jsp?studentNo=<%= student.getStudentNo() %>">���� ����</a>
								<%
								}
							%>
							</td>
							<td>
							<%
								if(0==check){
								%>
									��������
								<%
								}else{
								%>
									<a href="<%= request.getContextPath() %>/student/studentAndScoreList.jsp?studentNo=<%= student.getStudentNo() %>">��������</a>
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
			int count = studentDao.currentPage(word);
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
						<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= currentPage-1 %>&order=<%=order%>&word=<%=word%>">����</a>
					<%
				}
				for(int i=0 ; i<lastPage ; i++){
					%>
						<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= i+1 %>&order=<%=order%>&word=<%=word%>"><%= i+1 %></a>
					<%
				}
				if(currentPage<lastPage){
					%>
						<a href="<%= request.getContextPath() %>/student/studentList.jsp?currentPage=<%= currentPage+1 %>&order=<%=order%>&word=<%=word%>">����</a>
					<%
				}
		%>
			</div>
		</div>
	</div>
		
	<div id="bottom">
		<p class="groupContent">
				���� : Member | ������ : Employee,Student | ������ : Teacher
		</p>
	</div>

<script type="text/javascript">
	//��ȣ ����
	var noBtn = document.getElementById('noBtn');
	var noOrder = document.getElementById('noOrder');
	//�̸� ����
	var nameBtn = document.getElementById('nameBtn');
	var nameOrder = document.getElementById('nameOrder');
	//���� ����
	var ageBtn = document.getElementById('ageBtn');
	var ageOrder = document.getElementById('ageOrder');
	
	//��ȣ ��ư �̺�Ʈ
	noBtn.addEventListener('click', function() {
		if('noASC' == noOrder.value){
			location.href='<%=request.getContextPath()%>/student/studentList.jsp?order=noDESC&word=<%=word%>';
		}else if('noDESC' == noOrder.value){
			location.href='<%=request.getContextPath()%>/student/studentList.jsp?order=noASC&word=<%=word%>';
		}else{
			location.href='<%=request.getContextPath()%>/student/studentList.jsp?order=noDESC&word=<%=word%>';
		}
	});
	
	//�̸� ��ư �̺�Ʈ
	nameBtn.addEventListener('click', function() {
		if('nameASC' == nameOrder.value){
			location.href='<%=request.getContextPath()%>/student/studentList.jsp?order=nameDESC&word=<%=word%>';
		}else if('nameDESC' == nameOrder.value){
			location.href='<%=request.getContextPath()%>/student/studentList.jsp?order=nameASC&word=<%=word%>';
		}else{
			location.href='<%=request.getContextPath()%>/student/studentList.jsp?order=nameDESC&word=<%=word%>';
		}
	});
	
	//���� ��ư �̺�Ʈ
	ageBtn.addEventListener('click', function() {
		if('ageASC' == ageOrder.value){
			location.href='<%=request.getContextPath()%>/student/studentList.jsp?order=ageDESC&word=<%=word%>';
		}else if('ageDESC' == ageOrder.value){
			location.href='<%=request.getContextPath()%>/student/studentList.jsp?order=ageASC&word=<%=word%>';
		}else{
			location.href='<%=request.getContextPath()%>/student/studentList.jsp?order=ageDESC&word=<%=word%>';
		}
	});
</script>
</div>
</body>
</html>