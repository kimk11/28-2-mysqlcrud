<!-- 28기 김진우 -->
<!-- 2018-07-02 -->
<!-- employee 리스트 보기 작성 -->
<!-- 페이지 작업 추가 -->
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
			
			// 오름차, 내림차를 구분하기 위한 변수
			String order = "noDESC";
			if(request.getParameter("order")!=null){
				order = request.getParameter("order");
			}
			System.out.println(order+"<<order employee");
			
			// 검색단어의 값을 저장하기 위한 변수
			String word="";
			if(request.getParameter("word")!=null){
				word = request.getParameter("word");
			}
			//System.out.println(word+"<<<<word");
		%>
			<form action="<%= request.getContextPath() %>/Employee/employeeList.jsp" method="post">
				이름검색 : <input type="text" name="word">
				<button type="submit">검색</button>
			</form>
		<%
			//현재 페이지를 저장하는 변수
			int currentPage = 1;
			if(request.getParameter("currentPage")!=null){
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			//한페이지에 몇개씩 보여줄지 저장하는 변수
			int rowPage = 5;
			
			EmployeeDAO employeeDao = new EmployeeDAO();
			ArrayList<Employee> employeeList =  employeeDao.selectEmployeeByPage(currentPage, rowPage, word, order);
			
		%>
			<table >
				<tr class="even">
					<th>
						employeeNo
<!-- 								번호 오름차순 내림차순 버튼  start-->
						<input type="hidden" id="noOrder" value="<%= order %>">
						<button type="button" id="noBtn">정렬</button>

<!-- 								번호 오름차순 내림차순 버튼  end-->
					</th>
					<th>
						employeeName
<!-- 								이름 오름차순 내림차순 버튼  start-->
						<input type="hidden" id="nameOrder" value="<%= order %>">
						<button type="button" id="nameBtn">정렬</button>

<!-- 								이름 오름차순 내림차순 버튼  end-->
					</th>
					<th>
						employeeAge
<!-- 								나이 오름차순 내림차순 버튼  start-->
						<input type="hidden" id="ageOrder" value="<%= order %>">
						<button type="button" id="ageBtn">정렬</button>

<!-- 								나이 오름차순 내림차순 버튼  end-->
					</th>
					<th>주소입력</th><th>삭제</th><th>수정</th><th>점수입력</th><th>점수보기</th>
																		<!-- 조인문 연습 -->
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
											<label>주소 : </label>
											<input type="text"name="employeeAddrContent">
										</div>
										<div>
											<button type="submit" id="signEmployee">입력</button>
										</div>
									</form>
								</div>
							</td>
							<td><a href="<%= request.getContextPath() %>/Employee/deleteEmployeeAction.jsp?employeeNo=<%= employee.getEmployeeNo() %>">삭제</a></td>
							<td><a href="<%= request.getContextPath() %>/Employee/updateEmployeeForm.jsp?employeeNo=<%= employee.getEmployeeNo() %>">수정</a></td>
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
												<label>점수 : </label>
												<input type="text" name="score">
											</div>
											<div>
												<button type="submit" id="signEmployee">입력</button>
											</div>
										</form>
									</div>
							<%
								}else{
							%>
									<a href="<%= request.getContextPath() %>/Employee/updateEmployeeScoreForm.jsp?employeeNo=<%= employee.getEmployeeNo() %>">점수 수정</a>
							<%
								}
							%>								
							</td>
							<td>
							<%
								if(0==check){
								%>
									점수없음	
								<%
								}else{
								%>
									<a href="<%= request.getContextPath() %>/Employee/employeeAndScoreList.jsp?employeeNo=<%= employee.getEmployeeNo() %>">점수보기</a>	
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
						<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage-1 %>&order=<%= order %>&word=<%=word%>">이전</a>
					<%
				}
				for(int i=0 ; i<lastPage ; i++){
					%>
						<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= i+1 %>&order=<%= order %>&word=<%=word%>"><%= i+1 %></a>
					<%
				}
				if(currentPage<lastPage){
					%>
						<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage+1 %>&order=<%= order %>&word=<%=word%>">다음</a>
					<%
				}
		%>
			</div>
		</div>
	</div>
	<div id="bottom">
		<p class="groupContent">
				현희문 : Member | 김진우 : Employee,Student | 송유빈 : Teacher
		</p>
	</div>
</div>

<script type="text/javascript">
	//번호 정렬
	var noBtn = document.getElementById('noBtn');
	var noOrder = document.getElementById('noOrder');
	//이름 정렬
	var nameBtn = document.getElementById('nameBtn');
	var nameOrder = document.getElementById('nameOrder');
	//나이 정렬
	var ageBtn = document.getElementById('ageBtn');
	var ageOrder = document.getElementById('ageOrder');
	
	//번호 버튼 이벤트
	noBtn.addEventListener('click', function() {
		if('noASC' == noOrder.value){
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=noDESC&word=<%=word%>';
		}else if('noDESC' == noOrder.value){
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=noASC&word=<%=word%>';
		}else{
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=noDESC&word=<%=word%>';
		}
	});
	
	//이름 버튼 이벤트
	nameBtn.addEventListener('click', function() {
		if('nameASC' == nameOrder.value){
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=nameDESC&word=<%=word%>';
		}else if('nameDESC' == nameOrder.value){
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=nameASC&word=<%=word%>';
		}else{
			location.href='<%=request.getContextPath()%>/Employee/employeeList.jsp?order=nameDESC&word=<%=word%>';
		}
	});
	
	//나이 버튼 이벤트
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