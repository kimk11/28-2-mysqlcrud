<!-- 28�� ������ -->
<!-- 2018-06-26 -->
<!-- studentaddr �Է� �� �ۼ� -->
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
		<form action="<%= request.getContextPath() %>/insertStudentAddrAction.jsp" method="post" name="formAction">
			<div>
				<input type="hidden" id="studentNo" name="studentNo" value="<%= request.getParameter("studentNo") %>" readonly="readonly">
			</div>
			<div>
				<label>�ּ� : </label>
				<input type="text" id="studentAddrContent" name="studentAddrContent">
				<span id="studentAddrContentValid"></span>
			</div>
			<div>
				<button type="button" id="signStudentAddr">�Է�</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		//�ּ�
		var studentAddrContent = document.getElementById('studentAddrContent');
		var studentAddrContentValid = document.getElementById('studentAddrContentValid');
		//��ư
		var signStudent = document.getElementById('signStudentAddr');
		
		//��ȿ�� �˻�
		signStudent.addEventListener('click', function() {
			if(studentAddrContent.value.length==''){
				studentAddrContentValid.innerHTML = '�ּҸ� �Է����ּ���';
			}else{
				document.formAction.submit();
			}
		});
	</script>
</body>
</html>