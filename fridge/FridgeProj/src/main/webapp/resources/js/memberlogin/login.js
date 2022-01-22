function Login() {
	var id = document.form1.id;
	var pwd = document.form1.pwd;
	
	 //아이디에서 입력 필수 조건문
	 if (id.value == "")
	 {
        alert("아이디를 입력해야 합니다!");
        id.focus();//포커스를 id박스로 이동.
        return false;
	 }
	 
	//패스워드 필수 입력 조건문
	 if (pwd.value == "")
	 {
      alert("비밀번호를 입력해야 합니다!");
      pwd.focus();//포커스를 Password박스로 이동.
      return false;
	 }	
}
