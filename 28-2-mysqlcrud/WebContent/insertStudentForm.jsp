<!-- 28기 김진우 -->
<!-- 2018-06-26 -->
<!-- student 입력 폼 작성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/insertStudent.css">

</head>

<body>
	<div>
		<form action="<%= request.getContextPath() %>/insertStudentAction.jsp" method="post" name="formAction">
			<p>Student 입력</p>
			<div>
				<label>이름 : </label>
				<input type="text" id="studentName" name="studentName">
				<span id="studentNameValid"></span>
			</div>
			<div>
				<label>나이 : </label>
				<input type="text" id="studentAge" name="studentAge">
				<span id="studentAgeValid"></span>
			</div>
			<div>
				<button type="button" id="signStudent">입력</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		//이름
		var studentName = document.getElementById('studentName');
		var studentNameValid = document.getElementById('studentNameValid');
		//나이
		var studentAge = document.getElementById('studentAge');
		var studentAgeValid = document.getElementById('studentAgeValid');
		//버튼
		var signStudent = document.getElementById('signStudent');
		
		//유효성 검사
		signStudent.addEventListener('click', function() {
			if(studentName.value.length==''){
				studentNameValid.innerHTML = '이름을 입력해주세요';
			}else if(studentAge.value.length==''){
				studentAgeValid.innerHTML = '나이를 입력해주세요';
			}else{
				document.formAction.submit();
			}
		});
	</script>
</body>
</html>