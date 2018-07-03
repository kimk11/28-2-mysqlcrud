/*studentForm js코드*/
//유효성 검사 문자열 제거
	function black(){
		var studentBlank = document.getElementsByClassName('studentBlank');
		for(var b=0 ; b<studentBlank.length ; b++){
			studentBlank[b].innerHTML='';
		}
	}

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
		if(studentName.value==''){
			black();
			studentNameValid.innerHTML = '이름을 입력해주세요';
		}else if(studentAge.value==''){
			black();
			studentAgeValid.innerHTML = '나이를 입력해주세요';
		}else{
			document.formAction.submit();
		}
	});
	



/*studentAddrForm js코드*/
	//주소
	var studentAddrContent = document.getElementById('studentAddrContent');
	var studentAddrContentValid = document.getElementById('studentAddrContentValid');
	//버튼
	var signStudentAddr = document.getElementById('signStudentAddr');
	
	//유효성 검사
	signStudentAddr.addEventListener('click', function() {
		if(studentAddrContent.value==''){
			studentAddrContentValid.innerHTML = '주소를 입력해주세요';
		}else{
			document.formAction.submit();
		}
	});