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
//이메일 인증 
function certification(){
    if($('#userEmail').val() == '') {
          alert('인증코드를 받을 이메일을 입력해주세요.')
    }else{
        //인증코드 입력란 노출
        $('#certificationCode').show();
    }
    //입력한 이메일값이 바뀔 때
    $('#userEmail').change(function(){
        $('#emailCheck').show(); 
        $('#certificationCode').hide();
    })
}
//이메일 인증 메일 보내기
var code="";
var checkCode = false;
$("#emailCheck").click(function(){
    var email=$("#email").val();
    var emailinput=$("#certificationCode");
    $.ajax({
        url: "sendMail.do",
        type: "get",
        data: {email : email},
        cache: false,
        successe: function(data){//인증번호가져옴
            alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
            emailinput.attr("disabled",false);//인증번호입력가능
            emailinput.val('');//기존에 값이 있었으면 지워줌
            $("#emailCheck").hide();
            checkCode = false;
            code = data;//인증번호를 변수에 저장
        }
    });
});
//이메일 인증코드 입력시 동일한지 확인
$("#emailCheck").click(function(){
    var inputCode=$("#certificationCode").val();
    if(inputCode != "" || code != ""){
        if(inputCode == code){
            alert("인증번호가 일치합니다.");
            emailinput.attr("disabled",true);//인증번호입력멈춤
            checkCode = true;
        } else{
            alert("인증번호가 일치하지 않습니다.\n다시 확인해주세요.");
            checkCode = false;
        }
    }
});
//비밀번호 일치 확인
function pwdCheck(){    
    if ($('#pwd2').val() != "" && $('#pwd1').val() !== $('#pwd2').val()){
        alert("비밀번호가 일치하지 않습니다. 정확하게 입력해주세요.");
    }
}
//아이디 중복 검사
function idDuplCheck(){
    //공란인 채로 중복확인 눌렀을 때
    if($('#id').val() == '') {
          alert('아이디를 입력해주세요.')
          return;
    }
    //else{
    //  $('#idCheck').hide();
    //}
            
    //입력한 아이디값이 바뀔 때
    $('#id').change(function () {
      $('#idCheck').show();
    })
    
    //중복검사버튼을 누르면 ajax로 컨트롤러의 checkMember로 보내 검증한다
    $.ajax({
        url: "checkMember.do",
        type: "post",
        dataType: "json",
        data: {"id":$("#id").val()},
        success: function (data) {
           if(data == 1){
            alert("이미 존재하는 아이디입니다.");
           }else if(data == 0){
            $('#idCheck').attr("value","Y");
              alert("사용 가능한 아이디입니다.");
              $('#idCheck').hide();
           }
        }
     });
     //중복검사 후 중복된 아이디가 없다면 $('#idCheck').hide();
}
//별명 중복 검사
function nicknameDuplCheck(){
    //공란인 채로 중복확인 눌렀을 때
    if($('#nick').val() == ''){
        alert('별명을 입력해주세요.')
        return;
    }
    //else{
    //  $('#nicknameCheck').hide();
    //}
    
    //입력한 별명값이 바뀔 때
    $('#nick').change(function(){
        $('#nicknameCheck').show(); 
    })
    
    //중복검사버튼을 누르면 ajax로 컨트롤러의 checkNick으로 보내 검증한다
    $.ajax({
        url: "checkNick.do",
        type: "post",
        dataType: "json",
        data: {"nick":$("#nick").val()},
        success: function (data) {
            if(data ==1){
            alert("이미 존재하는 별명입니다.");
            }else if(data == 0){
                $('#nicknameCheck').attr("value","Y");
                alert("사용 가능한 별명입니다.");
                $('#nicknameCheck').hide();
            }
        }
    });
    //중복검사 후 중복된 아이디가 없다면 $('#nicknameCheck').hide();
}
//이메일 인증 
var code="";//생성된 코드값
function certificationEmail(){
    //공란인 채로 인증하기 눌렀을 때
    if($('#email').val() == '') {
          alert('인증코드를 받을 이메일을 입력해주세요.')
          return;
    }
    
    else{//인증코드 입력란 노출
        $('#emailCheck').hide();
        $('#codeCheck').show();
        $('#certificationCode').show();
    }
    
    //입력한 이메일값이 바뀔 때
    $('#email').change(function(){
        $('#emailCheck').show();
        $('#codeCheck').hide();
        $('#certificationCode').hide();
    })
    
    //이메일 인증 메일 보내기
    $.ajax({
        url: "sendMail.do",
        type: "get",
        data: {"email" : $("#email").val()},
        success: function(data){
            alert("메일이 발송되었습니다.");
            $("#certificationCode").val('');//기존에 값이 있었으면 지워줌
            $("#emailCheck").hide();      
            code=data;//발송된 코드 code에 저장
            console.log(code);//발송된 코드를 찍어보자
            
        }
    });
    /*이메일 인증 성공한 경우 버튼과 인증코드 입력란 모두 숨김
        alert('인증이 완료되었습니다.')
        $('#emailCheck').hide(); 
        $('#codeCheck').hide();
        $('#certificationCode').hide();
        $("input[name=checkedEmail]").val('Y');
    */
}
//인증코드 제출
function certificationCodeSubmit(){
    var inputCode=$("#certificationCode").val();
    if(inputCode != "" || code != ""){
        if(inputCode == code){
            alert("인증이 성공하였습니다.");
            //추가
            $('#codeCheck').hide();
            $('#emailCheck').hide(); 
            $('#certificationCode').hide();
            $("input[name=checkedEmail]").val('Y');
            return;
        } else{
            alert("인증번호가 일치하지 않습니다.\n다시 입력해주세요.");
        }
    }
}
//체크박스
$(document).ready(function(){
    //체크박스 전체 선택
    $('#allAgreement').click(function(){
        if($('#allAgreement').prop('checked')){
            $('.custom-control-input').prop('checked',true);
        }
        else{
            $('.custom-control-input').prop('checked',false);
        }
    });
    //체크박스 하나라도 선택 해제 시 전체동의 체크박스도 해제
    $('.custom-control-input').click(function(){
        if($('input[name="agree"]:checked').length == 2){
            $('#allAgreement').prop('checked',true);            
        }
        else{
            $('#allAgreement').prop('checked',false);
        }
    });
});