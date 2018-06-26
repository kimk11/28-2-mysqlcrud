<!-- 28�� ������ -->
<!-- 2018-06-26 -->
<!-- employee �Է� �� �ۼ� -->
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
				<label>�̸� : </label>
				<input type="text" id="employeeName" name="employeeName">
				<span id="employeeNameValid"></span>
			</div>
			<div>
				<label>���� : </label>
				<input type="text" id="employeeAge" name="employeeAge">
				<span id="employeeAgeValid"></span>
			</div>
			<div>
				<button type="button" id="signEmployee">�Է�</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		//�̸�
		var employeeName = document.getElementById('employeeName');
		var employeeNameValid = document.getElementById('employeeNameValid');
		//����
		var employeeAge = document.getElementById('employeeAge');
		var employeeAgeValid = document.getElementById('employeeAgeValid');
		//��ư
		var signEmployee = document.getElementById('signEmployee');
		
		//��ȿ�� �˻�
		signEmployee.addEventListener('click', function() {
			if(employeeName.value.length==''){
				employeeNameValid.innerHTML = '�̸��� �Է����ּ���';
			}else if(employeeAge.value.length==''){
				employeeAgeValid.innerHTML = '���̸� �Է����ּ���';
			}else{
				document.formAction.submit();
			}
		});
	</script>
</body>
</html>