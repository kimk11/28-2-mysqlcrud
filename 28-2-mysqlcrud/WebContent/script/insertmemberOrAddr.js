/*memberForm js코드*/

//유효성 검사 문자열 제거
	function black(){
		var memberBlank = document.getElementsByClassName('memberBlank');
		for(var b=0 ; b<memberBlank.length ; b++){
			memberBlank[b].innerHTML='';
		}
	}
	//이름
	var memberName = document.getElementById('memberName');
	var memberNameValid = document.getElementById('memberNameValid');
	//나이
	var memberAge = document.getElementById('memberAge');
	var memberAgeValid = document.getElementById('memberAgeValid');
	//버튼
	var signMember = document.getElementById('signMember');
	
	//유효성 검사
	signMember.addEventListener('click', function() {
		if(memberName.value.length==''){
			black();
			memberNameValid.innerHTML = '이름을 입력해주세요';
		}else if(memberAge.value.length==''){
			black();
			memberAgeValid.innerHTML = '나이를 입력해주세요';
		}else{
			document.formAction.submit();
		}
	});
	



/*memberAddrForm js코드*/
	
//주소
	var memberAddrContent = document.getElementById('memberAddrContent');
	var memberAddrContentValid = document.getElementById('memberAddrContentValid');
	//버튼
	var signMember = document.getElementById('signMember');
	
	//유효성 검사
	signMember.addEventListener('click', function() {
		if(memberAddrContent.value.length==''){
			memberAddrContentValid.innerHTML = '주소를 입력해주세요';
		}else{
			document.formAction.submit();
		}
	});