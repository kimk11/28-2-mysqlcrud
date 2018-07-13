<!-- 28�� ������ -->
<!-- 2018-07-02 -->
<!-- employee ����Ʈ ���� �ۼ� -->
<!-- ������ �۾� �߰� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeDAO"%>
<%@ page import="service.Employee"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.EmployeeScoreDAO" %>
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
			
			// �˻��ܾ��� ���� �����ϱ� ���� ����
			String word="";
			if(request.getParameter("word")!=null){
				word = request.getParameter("word");
			}
			//System.out.println(word+"<<<<word");
		%>
			<form action="<%= request.getContextPath() %>/Employee/employeeList.jsp" method="post">
				�̸��˻� : <input type="text" name="word">
				<button type="submit">�˻�</button>
			</form>
		<%
			//���� �������� �����ϴ� ����
			int currentPage = 1;
			if(request.getParameter("currentPage")!=null){
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			//���������� ��� �������� �����ϴ� ����
			int rowPage = 5;
			
			EmployeeDAO employeeDao = new EmployeeDAO();
			ArrayList<Employee> employeeList =  employeeDao.selectEmployeeByPage(currentPage, rowPage, word, order);
			
		%>
			<table >
				<tr class="even">
					<th>
						employeeNo
<!-- 								��ȣ �������� �������� ��ư  start-->
						<input type="hidden" id="noOrder" value="<%= order %>">
						<button type="button" id="noBtn">����</button>

<!-- 								��ȣ �������� �������� ��ư  end-->
					</th>
					<th>
						employeeName
<!-- 								�̸� �������� �������� ��ư  start-->
						<input type="hidden" id="nameOrder" value="<%= order %>">
						<button type="button" id="nameBtn">����</button>

<!-- 								�̸� �������� �������� ��ư  end-->
					</th>
					<th>
						employeeAge
<!-- 								���� �������� �������� ��ư  start-->
						<input type="hidden" id="ageOrder" value="<%= order %>">
						<button type="button" id="ageBtn">����</button>

<!-- 								���� �������� �������� ��ư  end-->
					</th>
					<th>�ּ��Է�</th><th>����</th><th>����</th><th>�����Է�</th><th>��������</th>
																		<!-- ���ι� ���� -->
				</tr>
				<% 
					for(int i=0 ; i<employeeList.size() ; i++){
						Employee employee = employeeList.get(i);
						int check = new EmployeeScoreDAO().selectCheck(employee.getEmployeeNo());
				%>
						<tr class="even">
							<td>
								<%= employee.getEmployeeNo() %>
							</td>
							<td><a href="<%= request.getContextPath() %>/Employee/employeeAddrList.jsp?employeeNo=<%= employee.getEmployeeNo() %>"><%= employee.getEmployeeName() %></a></td>
							<td><%= employee.getEmployeeAge() %></td>
							<td>
								<div>
									<form action="<%= request.getContextPath() %>/Employee/insertEmployeeAddrAction.jsp" method="post" name="formAction">
										<div>
											<input type="hidden" id="employeeNo" name="employeeNo" value="<%= employee.getEmployeeNo() %>">
										</div>
										<div>
											<label>�ּ� : </label>
											<input type="text"name="employeeAddrContent">
										</div>
										<div>
											<button type="submit" id="signEmployee">�Է�</button>
										</div>
									</form>
								</div>
							</td>
							<td><a href="<%= request.getContextPath() %>/Employee/deleteEmployeeAction.jsp?employeeNo=<%= employee.getEmployeeNo() %>">����</a></td>
							<td><a href="<%= request.getContextPath() %>/Employee/updateEmployeeForm.jsp?employeeNo=<%= employee.getEmployeeNo() %>">����</a></td>
							<td>
							<%	
								if(0==check){
							%>
									<div>
										<form action="<%= request.getContextPath() %>/Employee/insertEmployScore.jsp" method="post" name="formAction">
											<div>
												<input type="hidden" id="employeeNo" name="employeeNo" value="<%= employee.getEmployeeNo() %>">
											</div>
											<div>
												<label>���� : </label>
												<input type="text" name="score">
											</div>
											<div>
												<button type="submit" id="signEmployee">�Է�</button>
											</div>
										</form>
									</div>
							<%
								}else{
							%>
									<a href="<%= request.getContextPath() %>/Employee/updateEmployeeScoreForm.jsp?employeeNo=<%= employee.getEmployeeNo() %>">���� ����</a>
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
									<a href="<%= request.getContextPath() %>/Employee/employeeAndScoreList.jsp?employeeNo=<%= employee.getEmployeeNo() %>">��������</a>	
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
			int count = employeeDao.currentPage(word);
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
						<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage-1 %>&order=<%= order %>&word=<%=word%>">����</a>
					<%
				}
				for(int i=0 ; i<lastPage ; i++){
					%>
						<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= i+1 %>&order=<%= order %>&word=<%=word%>"><%= i+1 %></a>
					<%
				}
				if(currentPage<lastPage){
					%>
						<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage+1 %>&order=<%= order %>&word=<%=word%>">����</a>
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
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=noDESC&word=<%=word%>';
		}else if('noDESC' == noOrder.value){
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=noASC&word=<%=word%>';
		}else{
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=noDESC&word=<%=word%>';
		}
	});
	
	//�̸� ��ư �̺�Ʈ
	nameBtn.addEventListener('click', function() {
		if('nameASC' == nameOrder.value){
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=nameDESC&word=<%=word%>';
		}else if('nameDESC' == nameOrder.value){
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=nameASC&word=<%=word%>';
		}else{
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=nameDESC&word=<%=word%>';
		}
	});
	
	//���� ��ư �̺�Ʈ
	ageBtn.addEventListener('click', function() {
		if('ageASC' == ageOrder.value){
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=ageDESC&word=<%=word%>';
		}else if('ageDESC' == ageOrder.value){
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=ageASC&word=<%=word%>';
		}else{
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=ageDESC&word=<%=word%>';
		}
	});
</script>

</body>
</html>