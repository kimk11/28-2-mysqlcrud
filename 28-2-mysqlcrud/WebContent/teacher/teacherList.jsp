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

			<h2>선생님 List!</h2>
			<table>
				<tr class="even">
					<th id="no">No</th>
					<th id="name">이름</th>
					<th id="age">나이</th>
					<th>주소</th>
					<!-- 다수 -->
					<th>삭제</th>
					<th>수정</th>
					<th>점수입력</th>
					<!--  한번 -->
					<th>점수보기</th>
					<!--  한번 -->


				</tr>

				<%
					request.setCharacterEncoding("EUC-KR");
					int currentPage = 1; //현재페이지
					int pagePerRow = 5; //한 페이지에 나올 row 수
					if (request.getParameter("currentPage") != null) {
						currentPage = Integer.parseInt(request.getParameter("currentPage"));
					}

					String searchWord = request.getParameter("searchWord"); // 이름 검색창
					int startRow = (currentPage - 1) * pagePerRow; // 시작 페이지
					int endRow = startRow + (pagePerRow - 1); // 끝날 페이지

					TeacherDAO teacherDao = new TeacherDAO();
					int totalRow = teacherDao.count(); // 총 row 수 
					ArrayList<Teacher> list = teacherDao.selectTeacherByPage(startRow, pagePerRow, searchWord);

					TeacherAddr teacherAddr = new TeacherAddr();
					TeacherAddrDAO teacherAddrDao = new TeacherAddrDAO();

					if (endRow > list.size() - 1) {
						endRow = list.size() - 1;
					}

					// 반복문  list : TeacherDAO.java 페이징 작업 및 검색
					for (int i = 0; i < list.size(); i++) {
						Teacher teacher = list.get(i);

						int getTeacherNo = teacher.getTeacherNo();
						String getTeacherName = teacher.getTeacherName();
						int getTeacherAge = teacher.getTeacherAge();

						// list2 : TeacherAddrDAO.java 한 명의 주소 테이블 
						ArrayList<TeacherAddr> list2 = teacherAddrDao.selectTeacherAddr(getTeacherNo);
						String getTeacherAddrContent = teacherAddr.getTeacherAddrContent();
				%>
				<tr class = "even">
					<td><%=getTeacherNo%></td>
					<td><a href="./TeacherAddrList.jsp?no=<%=getTeacherNo%>"><%=getTeacherName%></a></td>
					<!-- 이름 클릭 시 주소페이지로  -->
					<td><%=getTeacherAge%></td>
					<td>
						<!-- 주소 입력 폼 -->
						<form
							action="<%=request.getContextPath()%>/teacher/insertTeacherAddrAction.jsp"
							method="post" name="f">
							<div class="fl">
								<input type="hidden" id="teacherNo" name="teacherNo" value="<%=getTeacherNo%>" readonly="readonly"> 
								<input type="text" id="teacherAddrContent" name="teacherAddrContent" size="30px" id="textAddr"> 
								<span id="teacherAddrContentHelper"></span>
							</div>
							<div class="fl">
								<button type="submit" id="btn">입력</button>
							</div>

						</form>
					</td>
					<td><a href="./deleteTeacherAction.jsp?no=<%=getTeacherNo%>">삭제</a></td>
					<td><a href="./updateTeacherForm.jsp?no=<%=getTeacherNo%>">수정</a></td>

					<!-- 점수 입력 폼 -->
					<td>
						<form action="./insertTeacherScore.jsp" method="post">
							<div class="display1">
								<input type="hidden" id="teacherNo" name="teacherNo" value="<%=getTeacherNo%>" readonly="readonly"> 
								<input type="text" id="teacherScore" name="teacherScore" size="7">
							</div>
							<div class="display1">
								<button type="submit" id="btn">입력</button>
							</div>
						</form>
					</td>
					<td><a
						href="<%=request.getContextPath()%>/teacher/teacherAndScoreList.jsp?no=<%=getTeacherNo%>">점수보기</a></td>

				</tr>
				<%
					}
				%>
			</table>



			<%
				if (currentPage > 1) {
			%>
			<a href="./teacherList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
			<%
				}

				int lastPage = (totalRow - 1) / pagePerRow;
				if ((totalRow - 1) % pagePerRow != 0) {
					lastPage++;
				}
				if (currentPage < lastPage) {
			%>
			<a href="./teacherList.jsp?currentPage=<%=currentPage + 1%>">다음</a> <br>
			<br>
			<%
				}
			%>
			<!-- 검색창 -->
			<form action="./teacherList.jsp" method="post">
				<div>
					이름 : <input type="text" name="searchWord">
					<button type="submit">검색</button>
				</div>
			</form>
			<br> <br> <br> <a href="./teacherListAboveAvg.jsp"><button>평균
					이상</button></a>

		</div>
		<div id="bottom"></div>
	</div>
</body>
</html>