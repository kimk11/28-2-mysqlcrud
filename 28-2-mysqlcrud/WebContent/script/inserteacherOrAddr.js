/*2018.06.27 송유빈*/
/*insertTeacherForm 스크립트*/
//이름
var teacherName = document.getElementById("teacherName");
var teacherNameHelper = document.getElementById("teacherNameHelper");

//나이
var teahcerAge = document.getElementById("teahcerAge");
var teacherAgeHelper = document.getElementById("teacherAgeHelper");

//버튼
var teacherBtn = document.getElementById("teacherBtn");

//유효성 검사
//addEventListener 메서드를 사용해 버튼을 클릭할 때 나타낼 이벤트를 if문으로 나타냈다. 
teacherBtn.addEventListener('click', function() {
	if(teacherName.value.length==''){		//이름이 공백일 때 이름을 입력해주세요 출력 
		teacherNameHelper.innerHTML = '이름을 입력해주세요';
	}else if(teacherName.value.length !=''){	//이름이 공백 아닐 때 공백 출력 
		teacherNameHelper.innerHTML = '';
	}if(teacherAge.value.length==''){		
		teacherAgeHelper.innerHTML = '나이를 입력해주세요';
	}else if(teacherAge.value.length!=''){
		teacherAgeHelper.innerHTML = '';
		//이름과 나이가 공백이 아닐 때 submit 실행
	}if(teacherName.value.length !='' && teacherAge.value.length!=''){
		document.f.submit();
	}
});



/*insertTeacherAddrForm 스크립트*/

//주소
var teacherAddrContentHelper = document.getElementById("teacherAddrContentHelper");

//버튼
var btn = document.getElementById("btn");

//유효성 검사
btn.addEventListener('click', function() {
	if (studentAddrContent.value.length == '') {
		teacherAddrContentHelper.innerHTML = '주소를 입력해주세요';
	} else {
		document.f.submit();
	}
});