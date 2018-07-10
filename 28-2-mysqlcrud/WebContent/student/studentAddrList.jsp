<!-- 28기 김진우 -->
<!-- 2018-07-02 -->
<!-- studentAddr 리스트 보기 작성 -->
<!-- 페이지 작업 추가 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddrDAO"%>
<%@ page import="service.StudentAddr"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
<%
	int studentNo =Integer.parseInt(request.getParameter("studentNo"));

	int currentPage = 1;
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPage = 2;
	StudentAddrDAO studentAddrDao = new StudentAddrDAO();
	ArrayList<StudentAddr> studentAddrList =  studentAddrDao.selectStudentAddrByPage(currentPage, rowPage, studentNo);
	
%>
	<table>
		<tr>
			<th>studentAddrContent</th>
		</tr>
		<% 
			for(int i=0 ; i<studentAddrList.size() ; i++){
				StudentAddr studentAddr = studentAddrList.get(i);
				%>
				<tr>
					<td><%= studentAddr.getStudentAddrContent() %></td>
				</tr>
				<%
			}
		%>
	</table>
<%
	int count = studentAddrDao.currentPage(studentNo);
	int startPage = 1;
	int lastPage = count/rowPage;
	if((count%rowPage)!=0){
		lastPage++;
	}
	
	if(currentPage>startPage){
		%>
			<a href="<%= request.getContextPath() %>/student/studentAddrList.jsp?currentPage=<%= currentPage-1 %>">이전</a>
		<%
	}
	if(currentPage<lastPage){
		%>
			<a href="<%= request.getContextPath() %>/student/studentAddrList.jsp?currentPage=<%= currentPage+1 %>">다음</a>
		<%
	}
%>
	<div>
		<button type="button" id="btn">뒤로가기</button>
	</div>
	
<script type="text/javascript">
	var btn = document.getElementById('btn');
	btn.addEventListener('click', function() {
		history.back();
	});
</script>
</body>
</html>