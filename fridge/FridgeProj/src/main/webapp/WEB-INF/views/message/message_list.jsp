<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찍먹냉장고 | 채팅</title>

<!-- CSS File -->
<link href="<c:url value="/resources/css/chat/chat.css"/>" rel="stylesheet">

<!-- 메세지 전송 아이콘(종이비행기) 때문에 필요 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>

</head>

<body>

	<br />
	<br />
	<br /> 
	<br /> 
	<br /> 

	<div class="msg-container">
	
		<div class="messaging">
	      <div class="inbox_msg">
	      	<!-- 메세지 목록 영역 -->
	        <div class="inbox_people">
	          <div class="headind_srch">
	            <div class="recent_heading">
	              <h4>Recent</h4>
	            </div>
	            <!-- 메세지 검색 -->
	            <!-- 
	            <div class="srch_bar">
	              <div class="stylish-input-group">
	                <input type="text" class="search-bar"  placeholder="Search" >
	                <span class="input-group-addon">
	                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
	                </span> 
	              </div>
	            </div> -->
	          </div>
	          
	          <!-- 메세지 리스트 -->
	          <div class="inbox_chat">
		          
	          </div>
	        </div>
	        
	        <!-- 메세지 내용 영역 -->
	        <div class="mesgs">
	          <!-- 메세지 내용 목록 -->
	          <div class="msg_history" name="contentList">
	            <!-- 메세지 내용이 올 자리 -->
	          </div>
	          <div class="send_message">
	          </div>
	          <!-- 메세지 입력란이 올자리 -->
	        </div>
	      </div>
	      
	    </div>
	</div>
	
<script>
	//사용자 아이디, 웹소켓, 방번호, 타겟 아이디 저장
	var id = "${sessionScope.id}";
	var wsocket;
	let room, other_nick;
	
	wsocket = new WebSocket("ws://127.0.0.1:8080<c:url value="/chat-ws.do"/>");	
	console.log(wsocket);
	//웹 소켓이 열렸을 때
	wsocket.onopen = function(){
		var msg = {
				type : "open",
				userid : id
		}
		wsocket.send(JSON.stringify(msg));
		console.log(id+"가 웹소켓 open");
	};
	//웹 소켓이 닫혔을 때
	wsocket.onclose = function(){
		console.log(id+"가 웹소켓 close");
	};
	
	//서버에서 메시지를 받을때마다 호출되는 함수 
	let receiveMessage = function(e) {//e는 message이벤트 객체
		console.log("Enter receiveMessage");
		//console.log(e);
		//console.log(e.source);
		//console.log(e.lastEventId);
		var message = JSON.parse(e.data);
		//console.log(message.userid);
		var roomNum = $('.active_chat').attr('id');
		MessageList(roomNum);
		if(roomNum == message.room){
			appendTargetMessage(message.targetid, message.content, message.senddate);
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
		}
	};
	
	wsocket.addEventListener("message", receiveMessage);
	

	//서버에 사용자 id와 target id를 등록하는 함수
	function register(target){
		console.log("id : " + id + " target : " + target);
		var msg = {
				type : "register",
				userid : id,
				targetid : target
		}
		wsocket.send(JSON.stringify(msg));
		console.log('register 들어옴');
	}

	const FirstMessageList = function(){
		$.ajax({
			url:"<c:url value="message_ajax_list.do"/>",
			method:"GET",
			data:{
			},
			dataType : "text",
			error:function(jqWHR, textStatus, errorThrown){
				console.log(jqWHR.statusText);
			},
			success:function(data){
				console.log("FirstMessageList : 메세지 리스트 리로드 성공");

				$('.inbox_chat').html(data);
				
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
					room = $(this).attr('room');
					other_nick = $(this).attr('other-nick');
					console.log(other_nick);
					register(other_nick);
					
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+room).addClass('active_chat');
					
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					send_msg += "		<div class='col-11'>";
					send_msg += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력...' />";
					send_msg += "		</div>";
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div>";
			          
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					
					// 메세지 입력 후 엔터
					$('.input_msg_write input').on('keypress',function(e){
						var keyCode = e.keyCode ? e.keyCode : e.which;
						if (keyCode == 13) {//엔터 입력
							// 메세지 전송 함수 호출
							SendMessage(room, other_nick);
						}
						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
						// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
						//$('.chat_list_box:first').addClass('active_chat');
					});
					
					// 메세지 내용을 불러오는 함수 호출
					MessageContentList(room);
					
				});	
			}
		})
	};
	
	
	// 메세지 리스트를 다시 가져온다.
	const MessageList = function(flag){
		$.ajax({
			url:"<c:url value="message_ajax_list.do"/>",
			method:"GET",
			data:{
			},
			error : function(jqWHR, textStatus, errorThrown){
				console.log(jqWHR.statusText);
			},
			success:function(data){
				console.log("MessageList : 메세지 리스트 리로드 성공");
				
				$('.inbox_chat').html(data);
				console.log('여긴 들어옴');
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
					//alert('room : '+ $(this).attr('room'));
					console.log('여기는?');
					room = $(this).attr('room');
					console.log("메시지 리로드했을 때 room : "+room);
					other_nick = $(this).attr('other-nick');
					register(other_nick);
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+room).addClass('active_chat');
					
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					send_msg += "		<div class='col-11'>";
					send_msg += "			<input type='text' class='write_msg form-control' id='message_input' placeholder='메세지를 입력...' />";
					send_msg += "		</div>";
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div>";
			          
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					
					// 메세지 보내고 엔터쳤을 때
					$('.write_msg.form-control').on('keypress',function(e){
						console.log('e.keyCode:%s,e.which:%s', e.keyCode, e.which);	
						var keyCode = e.keyCode ? e.keyCode : e.which;
						
						if (keyCode == 13) {//엔터 입력
							// 메세지 전송 함수 호출
							SendMessage(room, other_nick);
						}
						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
						// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
						//$('.chat_list_box:first').addClass('active_chat');
					});
					
					// 메세지 내용을 불러오는 함수 호출
					MessageContentList(room);
					
				});
				
				// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
				// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
				if(flag == "send"){
					$('.chat_list_box:first').addClass('active_chat');
				}
				else{
					$('.chat_list_box'+flag).addClass('active_chat');
				}
			}
		})
	};
    
	
	// 메세지 내용을 가져온다.
	// 읽지 않은 메세지들을 읽음으로 바꾼다.
	const MessageContentList = function(room) {
		$.ajax({
			url:"message_content_list.do",
			method:"GET",
			data:{
				room : room
			},
			error : function(jqWHR, textStatus, errorThrown){
				console.log(jqWHR.statusText);
			},
			success:function(data){
				console.log("메세지 내용 가져오기 성공");
				
				// 메세지 내용을 html에 넣는다
				$('.msg_history').html(data);
				
				// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);

			},
			error : function() {
				alert('서버 에러');
			}
		})
		
		$('.unread'+room).empty();
	
	};
	
	//메시지를 DIV태그에 뿌려주기 위한 함수
	var appendUserMessage = function(content, time){
		let send_msg = "<div class=\"outgoing_msg\">";
		send_msg += "<div class=\"sent_msg\">";
		send_msg += "<p>"+content+"</p>";
		send_msg += "<span class=\"time_date\">"+time+"</span>";
		send_msg += "</div>";
		send_msg += "</div>";

		$(".msg_history").append(send_msg);		
	}

	var appendTargetMessage = function(target, content, time){
        let receive_msg = "<div class=\'incoming_msg\'>";
        receive_msg += "<div class=\'incoming_msg_img\'>";
        receive_msg += "<a href=\'other_profile.do?other_nick="+target+"\'>";
        receive_msg += "<img src=\'${pageContext.request.contextPath}/resources/images/chat/none_profile.png\' alt=\'보낸사람 프로필\'>";
        receive_msg += "</a>";
        receive_msg += "</div>";
        receive_msg += "<div class=\"received_msg\">";
        receive_msg += "<div class=\"received_withd_msg\">";
        receive_msg += "<p>"+content+"</p>";
        receive_msg += "<span class=\"time_date\">"+time+"</span>";
        receive_msg += "</div>";
        receive_msg += "</div>";
        receive_msg += "</div>";
        
        $(".msg_history").append(receive_msg);       
    }
	
	// 메세지를 전송하는 함수
	const SendMessage = function(room, other_nick){
		
		let content = $('.write_msg').val();
		//alert("content: " + content);
		
		content = content.trim();
		var now = new Date();
		var month = ('0' + (now.getMonth() + 1)).slice(-2);
		var day = ('0' + now.getDate()).slice(-2);
		var hours = ('0' + now.getHours()).slice(-2); 
		var minutes = ('0' + now.getMinutes()).slice(-2);
		
		var timeString = month + "-" + day + " " + hours + ":" + minutes;
		 
		if(content == ""){
			alert("메세지를 입력하세요!");
		}
		else{
			var msg = {
					type : "chat",
					userid : id,
					targetid : other_nick,
					room : room,
					content : content,
					senddate : timeString
			}
			//서버로 메시지 전송
			wsocket.send(JSON.stringify(msg));
			//DIV(대화영역)에 메시지 출력
			appendUserMessage(content, timeString);
			//기존 메시지 클리어
			$('.write_msg').val("");
			//포커스 주기
			$('.write_msg').focus();
			// 메세지 리스트 리로드
			MessageList("send");
			// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
		}
	};
	
	$(document).ready(function(){
		// 메세지 리스트 리로드
		FirstMessageList();
	});
	
</script>
</body>
</html>