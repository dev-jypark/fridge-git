<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 실제 내용 시작 -->
<div class="container">

	<div class="page-header">
		<h1>
			스프링 <small>웹소켓</small>
		</h1>
	</div>
	<fieldset>
		<legend>웹소켓 클라이언트</legend>
		<form>
			<div class="form-group">
				<label for="nickname" class="col-sm-1">닉네임</label>
				<div class="col-sm-4">
					<input class="form-control " type="text" id="nickname">
					<input class="form-control " type="hidden" id="target" value="kim">
				</div>
			</div>
			<input class="btn btn-info" type="button" id="enterBtn" value="입장">
			<input class="btn btn-danger" type="button" id="exitBtn" value="퇴장">

			<div class="form-group">
				<h4>대화내용</h4>
				<div id="chatArea">
					<div id="chatMessage"
						style="height: 300px; border: 1px gray solid; overflow: auto"></div>
				</div>
			</div>

			<div class="form-group">
				<label for="message" class="col-sm-1">메시지</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="message" />
				</div>
			</div>
			<input class="btn btn-success" type="button" id="sendBtn" value="전송">
		</form>
	</fieldset>


</div>
<!-- 실제 내용 끝-->
<!-- 푸터 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer_.jsp" />
<!-- 푸터 끝 -->
<script>
	/*
	채팅 테스트
	localhost를 아이피로 변경 소스 및 브라우저 URL도 변경
	그리고 인바운드 규칙추가 8080
	 */
	//웹소켓 객체 저장용
	var wsocket;
	//닉 네임 저장용
	var nickname;
	//입장버튼 클릭시 ]-서버와 연결된 웹소켓 클라이언트 생성
	$('#enterBtn').one(
			'click',
			function() {
				wsocket = new WebSocket("ws://192.168.0.40:8080<c:url value="/chat-ws.do"/>");
				console.log('wsocket:', wsocket);
				//서버와 연결된 웹 소켓에 이벤트 등록
				wsocket.onopen = open;
				wsocket.onclose = function() {
					appendMessage("연결이 끊어 졌어요");
				};
				wsocket.addEventListener("message", receiveMessage);
				wsocket.onerror = function(e) {
					console.log('에러발생:', e)
				};
			});
	
	//퇴장버튼 클릭시]
	$('#exitBtn').one('click', function() {
		wsocket.send('msg:' + nickname + '가(이) 퇴장 했어요');
		wsocket.close();
	});

	//전송버튼 클릭시]
	$('#sendBtn').click(function() {
		sendMessage();
	});
	
	//메시지 입력후 전송 버튼 클릭이 아닌 엔터키 처리]
	$('#message').on('keypress', function(e) {
		console.log('e.keyCode:%s,e.which:%s', e.keyCode, e.which);		
		var keyCode = e.keyCode ? e.keyCode : e.which;
		if (keyCode == 13) {//엔터 입력
			sendMessage();

		}

	});
	//함수 정의]
	//서버에 연결되었을때 호출되는 콜백함수
	var open = function() {
		//서버로 연결한 사람의 정보(닉네임) 전송
		//msg:kim가(이) 입장했어요
		//사용자가 입력한 닉네임 저장
		nickname = $('#nickname').val();
		register(nickname);
		//wsocket.send('msg:' + nickname + "가(이) 입장했어요");
		console.log('msg:' + nickname + "가(이) 입장했어요");
		appendMessage("연결되었어요");
	}
	
	//메시지 수신 위해 서버에 id 등록
	function register(nickname){
		var msg = {
				type : "register",
				userid : nickname
		};
		wsocket.send(JSON.stringify(msg));
	}
	
	//메시지를 DIV태그에 뿌려주기 위한 함수]
	var appendMessage = function(msg) {
		$('#chatMessage').append(msg + "<br/>");
	};
	
	//서버에서 메시지를 받을때마다 호출되는 함수 
	var receiveMessage = function(e) {//e는 message이벤트 객체
		//서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
		if (e.data.substring(0, 4) == 'msg:')
			appendMessage(e.data.substring(4));//서버로부터 받은 메시지를 msg:부분을 제외하고 div에 출력
	};
	
	//서버로 메시지 전송하는 함수]
	function sendMessage() {
		target = $('#target').val();
		//상대방 아이디를 포함한 메시지 형태
		var msg = {
				type : "chat",
				target : target,
				message : "msg:" + nickname + '>>' + $('#message').val() //msg:Superman:안녕
		}
		//서버로 메시지 전송
		wsocket.send(JSON.stringify(msg));
		//DIV(대화영역)에 메시지 출력
		appendMessage($('#message').val());
		//기존 메시지 클리어			
		$('#message').val("");
		//포커스 주기
		$('#message').focus();
	}
</script>



