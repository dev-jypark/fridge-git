//로그인 필수입력 정보
  
function Login() {
	var id = document.form1.id;
	var pwd = document.form1.pwd;
	
	 //아이디에서 입력 필수 조건문
	 if (id.value == "")
	 {
        alert("아이디를 입력해주세요.");
        id.focus();//포커스를 id박스로 이동.
        return false;
	 }
	 
	//패스워드 필수 입력 조건문
	 if (pwd.value == "")
	 {
      alert("비밀번호를 입력해주세요.");
      pwd.focus();//포커스를 Password박스로 이동.
      return false;
	 }
	 document.login_form.submit();	
}

//소셜 로그인

let social = {
	kakao : {
		data : {key : 'ab245ed56c428f41a272afe5487d647e'},
		init : function(){
			Kakao.init(social.kakao.data.key);},
		login : function (){
			Kakao.Auth.login({
				success: function (response){
					console.log("카카오 로그인 성공", response);
					social.kakao.info();
				},
			fail: function (error) {
					console.log("카카오 로그인 실패", error);},
			})
		},
		info : function (){
			Kakao.API.request({
				url: '/v2/user/me',
				success: function (response) {
					console.log("카카오 정보 불러오기 성공 ", response)
					let userInfo = {
						type : 'kakao',
						id : response.id,
						nm : response.properties.nickname,
						email : response.kakao_account.email
						};					
					socialGetInfo(userInfo);
					setTimeout(social.kakao.logout, 500);					
						},						
 				fail: function (error) {
						console.log("카카오 정보 불러오기 오류 ", error);
					},
				})
			},
			logout : function (){
				if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url: '/v1/user/unlink',
					success: function (response) {
						console.log("카카오 로그아웃 성공", response);},
					fail: function (error) {
						console.log("카카오 로그아웃 실패", error);},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		},
		},
		google : {
		data : {
			clientId : '1048162818783-hjp4j0h4m9uehdm28uvq9fe6299otejd.apps.googleusercontent.com',
			apikey : 'AIzaSyCBY096HpUHFEEd6FV_qYaKEYBYtPoVNNk',
		},
			init : function (elId){
				gapi.load('auth2', function() {
				gapi.auth2.init({client_id: social.google.data.clientId});
				let options = new gapi.auth2.SigninOptionsBuilder();
				options.setPrompt('select_account');
				options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
				gapi.auth2.getAuthInstance().attachClickHandler(elId, options, social.google.loginSuccess, social.google.logoutFail);
			});
			},
			loginSuccess : function (googleUser){
			 console.log("구글 로그인 성공", googleUser);
			let profile = googleUser.getBasicProfile();
				let userInfo = {
				type : 'google',
				id : profile.getId(),
				nm : profile.getName(),
				email : profile.getEmail()
				};
				console.log("userInfo: ", userInfo)
			socialGetInfo(userInfo);
			setTimeout(social.google.logout, 500);
			},
		logoutFail : function (error){
			console.log("구글 로그인 실패", error);
		},
		logout : function (){
			let auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function () {
			 console.log('구글 로그아웃 성공 ');
			});
			}
		}
	}

$(function(){
			social.kakao.init();
			social.google.init("googleBtn");			
		});
		
		function socialGetInfo(info){
			$('#loginType').val(info.type);
			$('#socialNickname').val(info.nm);
			$('#socialEmail').val(info.email);
			$('#socialId').val(info.id);
			setTimeout($('#form').submit(), 2000);
		}
