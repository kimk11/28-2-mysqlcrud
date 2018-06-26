<!-- 28기 김진우 -->
<!-- 2018-06-26 -->
<!-- employee 입력 폼 작성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">
	input {
		border: 1px solid #bcbcbc;
		border-radius: 5px;
	}
	button {
		border: 1px solid #bcbcbc;
		border-radius: 5px;
	}
</style>

</head>

<body>
	<div>
		<form action="<%= request.getContextPath() %>/insertStudentAction.jsp" method="post" name="formAction">
			<div>
				<input type="hidden" id="employeeNo" name="employeeNo" value="<%= request.getParameter("employeeNo") %>">
			</div>
			<div>
				<label>나이 : </label>
				<input type="text" id="employeeAddrContent" name="employeeAddrContent">
				<span id="employeeAddrContentValid"></span>
			</div>
			<div>
				<button type="button" id="signEmployee">입력</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		//주소
		var employeeAddrContent = document.getElementById('employeeAddrContent');
		var employeeAddrContentValid = document.getElementById('employeeAddrContentValid');
		//버튼
		var signEmployee = document.getElementById('signEmployee');
		
		//유효성 검사
		signEmployee.addEventListener('click', function() {
			if(employeeAddrContent.value.length==''){
				employeeAddrContentValid.innerHTML = '주소를 입력해주세요';
			}else{
				document.formAction.submit();
			}
		});
	</script>
</body>
</html>