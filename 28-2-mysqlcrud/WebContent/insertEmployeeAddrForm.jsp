<!-- 28�� ������ -->
<!-- 2018-06-26 -->
<!-- employee �Է� �� �ۼ� -->
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
				<label>���� : </label>
				<input type="text" id="employeeAddrContent" name="employeeAddrContent">
				<span id="employeeAddrContentValid"></span>
			</div>
			<div>
				<button type="button" id="signEmployee">�Է�</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		//�ּ�
		var employeeAddrContent = document.getElementById('employeeAddrContent');
		var employeeAddrContentValid = document.getElementById('employeeAddrContentValid');
		//��ư
		var signEmployee = document.getElementById('signEmployee');
		
		//��ȿ�� �˻�
		signEmployee.addEventListener('click', function() {
			if(employeeAddrContent.value.length==''){
				employeeAddrContentValid.innerHTML = '�ּҸ� �Է����ּ���';
			}else{
				document.formAction.submit();
			}
		});
	</script>
</body>
</html>