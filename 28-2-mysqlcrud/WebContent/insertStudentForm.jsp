<!-- 28기 김진우 -->
<!-- 2018-06-26 -->
<!-- student 입력 폼 작성 -->
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
				<label>이름 : </label>
				<input type="text" id="studentName" name="studentName" class="studentCheck">
				<span id="studentNameValid"></span>
			</div>
			<div>
				<label>나이 : </label>
				<input type="text" id="studentAge" name="studentAge" class="studentCheck">
				<span id="studentAgeValid"></span>
			</div>
			<div>
				<button type="button" id="signStudent">입력</button>
				<span id="signValid"></span>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		//이름 유효성 검사
		var studentName = document.getElementById('studentName');
		var studentNameValid = document.getElementById('studentNameValid');
		studentName.addEventListener('blur', function() {
			if(studentName.value.length<1){
				studentNameValid.innerHTML = '이름을 적어주세요'
			}else{
				studentNameValid.innerHTML = ''
			}
		});
		
		//나이 유효성 검사
		var studentAge = document.getElementById('studentAge');
		var studentAgeValid = document.getElementById('studentAgeValid');
		studentAge.addEventListener('blur', function() {
			if(studentAge.value.length<1){
				studentAgeValid.innerHTML = '나이를 적어주세요'
			}else{
				studentAgeValid.innerHTML = ''
			}
			for(var i=0 ; i<studentName.value.length ; i++){
				var check = document.forms.formAction.value.charAt(i);
				if(!(0<=check && 9>=check)){
					studentNameValid.innerHTML = '나이는 숫자만 적어주세요.'
				}
			}
		});
		
		//하나라도 값이 없는지 검사
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
				signValid.innerHTML = '값을 입력해주세요.'
			}
		});
	</script>
</body>
</html>