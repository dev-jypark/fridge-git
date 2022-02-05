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


//별명 중복 검사
function nicknameDuplCheck(){
    //공란인 채로 중복확인 눌렀을 때
    if($('#socialNickname').val() == ''){
        alert('별명을 입력해주세요.')
        return;
    }
    //else{
    //  $('#nicknameCheck').hide();
    //}
    
    //입력한 별명값이 바뀔 때
    $('#socialNickname').change(function(){
        $('#nicknameCheck').show(); 
    })
    
    //중복검사버튼을 누르면 ajax로 SignUp컨트롤러의 checksocialNick으로 보내 검증한다
    $.ajax({
        url: "checksocialNick.do",
        type: "post",
        dataType: "json",
        data: {"nick":$("#socialNickname").val()},
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


	