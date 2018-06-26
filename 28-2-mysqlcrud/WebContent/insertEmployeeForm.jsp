<!-- 28기 김진우 -->
<!-- 2018-06-26 -->
<!-- employee 입력 폼 작성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<div>
		<form action="<%= request.getContextPath() %>/insertStudentAction.jsp" method="post" name="formAction">
			<div>
				<label>이름 : </label>
				<input type="text" id="employeeName" name="employeeName">
				<span id="employeeNameValid"></span>
			</div>
			<div>
				<label>나이 : </label>
				<input type="text" id="employeeAge" name="employeeAge">
				<span id="employeeAgeValid"></span>
			</div>
			<div>
				<button type="button" id="signEmployee">입력</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		//이름
		var employeeName = document.getElementById('employeeName');
		var employeeNameValid = document.getElementById('employeeNameValid');
		//나이
		var employeeAge = document.getElementById('employeeAge');
		var employeeAgeValid = document.getElementById('employeeAgeValid');
		//버튼
		var signEmployee = document.getElementById('signEmployee');
		
		//유효성 검사
		signEmployee.addEventListener('click', function() {
			if(employeeName.value.length==''){
				employeeNameValid.innerHTML = '이름을 입력해주세요';
			}else if(employeeAge.value.length==''){
				employeeAgeValid.innerHTML = '나이를 입력해주세요';
			}else{
				document.formAction.submit();
			}
		});
	</script>
</body>
</html>