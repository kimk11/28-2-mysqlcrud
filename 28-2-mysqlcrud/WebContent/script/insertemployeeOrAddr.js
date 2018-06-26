/*employeeForm js코드*/
	//이름
	var employeeName = document.getElementById('employeeName');
	var employeeNameValid = document.getElementById('employeeNameValid');
	//나이
	var employeeAge = document.getElementById('employeeAge');
	var employeeAgeValid = document.getElementById('employeeAgeValid');
	//버튼
	var signEmployee = document.getElementById('signEmployee');
	
	//유효성 검사
	signEmployee.addEventListener('click', function() {
		if(employeeName.value.length==''){
			employeeNameValid.innerHTML = '이름을 입력해주세요';
		}else if(employeeAge.value.length==''){
			employeeAgeValid.innerHTML = '나이를 입력해주세요';
		}else{
			document.formAction.submit();
		}
	});

/*employeeAddrForm js코드*/
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