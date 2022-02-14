//비밀번호 일치 확인
function pwdCheck(){    
    if ($('#pwd2').val() != "" && $('#pwd1').val() !== $('#pwd2').val()){
        alert("비밀번호가 일치하지 않습니다. 정확하게 입력해주세요.");
        return false;
    }
    else{
    	alert("비밀번호가 성공적으로 변경되었습니다.");
    }
}