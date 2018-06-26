<!-- 28�� ������ -->
<!-- 2018-06-26 -->
<!-- student �Է� �� �ۼ� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<div>
		<form action="/insertStudentAction.jsp" method="post" id="formAction">
			<div>
				<label>�̸� : </label>
				<input type="text" id="studentName" name="studentName" class="studentCheck">
				<span id="studentNameValid"></span>
			</div>
			<div>
				<label>���� : </label>
				<input type="text" id="studentAge" name="studentAge" class="studentCheck">
				<span id="studentAgeValid"></span>
			</div>
			<div>
				<button type="button" id="signStudent">�Է�</button>
				<span id="signValid"></span>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		//�̸� ��ȿ�� �˻�
		var studentName = document.getElementById('studentName');
		var studentNameValid = document.getElementById('studentNameValid');
		studentName.addEventListener('blur', function() {
			if(studentName.value.length<1){
				studentNameValid.innerHTML = '�̸��� �����ּ���'
			}else{
				studentNameValid.innerHTML = ''
			}
		});
		
		//���� ��ȿ�� �˻�
		var studentAge = document.getElementById('studentAge');
		var studentAgeValid = document.getElementById('studentAgeValid');
		studentAge.addEventListener('blur', function() {
			if(studentAge.value.length<1){
				studentAgeValid.innerHTML = '���̸� �����ּ���'
			}else{
				studentAgeValid.innerHTML = ''
			}
			for(var i=0 ; i<studentName.value.length ; i++){
				var check = document.forms.formAction.value.charAt(i);
				if(!(0<=check && 9>=check)){
					studentNameValid.innerHTML = '���̴� ���ڸ� �����ּ���.'
				}
			}
		});
		
		//�ϳ��� ���� ������ �˻�
		var signStudent = document.getElementById('signStudent');
		var studentCheck = document.getElementsByClassName('studentCheck');
		var signValid = document.getElementsByClassName('signValid');
		var studentFlag = true;
		for(var x=0 ; x<studentCheck.length ; x++){
			if(studentCheck[x].value == ''){
				studentFlag = false;
			}
		}
		signStudent.addEventListener('click', function() {
			if(studentFlag){
				document.getElementById('formAction').submit();
			}else{
				signValid.innerHTML = '���� �Է����ּ���.'
			}
		});
	</script>
</body>
</html>