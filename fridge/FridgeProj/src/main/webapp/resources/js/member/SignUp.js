
//유효성 검사
const forms = document.getElementsByClassName('validation-form'); 

window.addEventListener('load', () => { 
		
		Array.prototype.filter.call(forms, (form) => { 
			form.addEventListener('submit', function (event) { 
				if (form.checkValidity() === false) { 
					event.preventDefault(); 
					event.stopPropagation(); 
				}
			form.classList.add('was-validated'); 
			}, false); 
		}); 
	}, false);

//아이디 중복 검사
function idDuplCheck(){

	//공란인 채로 중복확인 눌렀을 때
	if($('#userId').val() == '') {
	      alert('아이디를 입력해주세요.')
	}
	        
	//입력한 아이디값이 바뀔 때
	$('#userId').change(function () {
      $('#idCheck').show();
    })
    
    //중복검사 후 중복된 아이디가 없는 경우 $('#idCheck').hide();로 버튼 숨기기.
    
  }

//이메일 인증
function certification(){
	if($('#userEmail').val() == '') {
	      alert('인증코드를 받을 이메일을 입력해주세요.')
	}
	//이메일 인증 성공한 경우 $('#emailCheck').hide();로 버튼 숨기기.
}
  
//비밀번호 일치 확인
function pwdCheck(){	
	if ($('#pwd2').val() != "" && $('#pwd1').val() !== $('#pwd2').val()){
		alert("비밀번호가 일치하지 않습니다. 정확하게 입력해주세요.");
	}
}

//체크박스
$(document).ready(function(){
	//체크박스 전체 선택하기
	$('#allAgreement').click(function(){
		if($('#allAgreement').prop('checked')){
			$('.custom-control-input').prop('checked',true);
		}else{
			$('.custom-control-input').prop('checked',false);
		}
	});
	//하나 해제 시 전체동의도 체크 해제
	$('.custom-control-input').click(function(){
		if($('input[name="check"]:checked').length == 2){
			$('#allagreement').prop('checked',true);
			
		}
		else{
			$('#allagreement').prop('checked',false);
		}
	});
});

