<!-- 28�� ������ -->
<!-- 2018-06-26 -->
<!-- student �Է� �� �ۼ� -->
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
			<p>Student �Է�</p>
			<div>
				<label>�̸� : </label>
				<input type="text" id="studentName" name="studentName">
				<span id="studentNameValid"></span>
			</div>
			<div>
				<label>���� : </label>
				<input type="text" id="studentAge" name="studentAge">
				<span id="studentAgeValid"></span>
			</div>
			<div>
				<button type="button" id="signStudent">�Է�</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		//�̸�
		var studentName = document.getElementById('studentName');
		var studentNameValid = document.getElementById('studentNameValid');
		//����
		var studentAge = document.getElementById('studentAge');
		var studentAgeValid = document.getElementById('studentAgeValid');
		//��ư
		var signStudent = document.getElementById('signStudent');
		
		//��ȿ�� �˻�
		signStudent.addEventListener('click', function() {
			if(studentName.value.length==''){
				studentNameValid.innerHTML = '�̸��� �Է����ּ���';
			}else if(studentAge.value.length==''){
				studentAgeValid.innerHTML = '���̸� �Է����ּ���';
			}else{
				document.formAction.submit();
			}
		});
	</script>
</body>
</html>