/*studentForm js코드*/
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

/*studentAddrForm js코드*/
//주소
var employeeAddrContent = document.getElementById('studentAddrContent');
var studentAddrContentValid = document.getElementById('studentAddrContentValid');
//버튼
var signStudent = document.getElementById('signStudentAddr');

//유효성 검사
signStudent.addEventListener('click', function() {
	if(studentAddrContent.value.length==''){
		studentAddrContentValid.innerHTML = '주소를 입력해주세요';
	}else{
		document.formAction.submit();
	}
});