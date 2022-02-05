<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String spriteDir =request.getContextPath();
	//관심버튼
	//댓글
	//현재위치
	//구매 수량?
	//검색
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Map_TradingTmp.jsp</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="<c:url value="/resources/css/share/shareMap.css"/>" rel="stylesheet">
	<!-- 지도 키, 발급 후 src_appkey 부분 변경 -->
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d555d6661391d7bcc7566ec232018705&libraries=services,clusterer"></script>
<style type="text/css">
#my_modal {
	display: none;
	width: 500px;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#my_modal .modal_close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
}
</style>
</head>
<body>
<div id="my_modal">
    
    <a class="modal_close_btn">닫기</a>
</div>
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!--화면 크기가 작을때 보여지는 네비게이션바(모바일용)  -->
				<div class="navbar-header">
					<button class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#collapse-menu">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

					<a class="navbar-brand" href="#"> <strong>냉장고</strong>
					</a>
				</div>

				<!-- 화면 크기가 클때 상단에 보여지는 네비게이션바(데스크탑용) -->
				<div class="collapse navbar-collapse" id="collapse-menu">
					<!-- 네비게이션바에 폼 추가 -->
					<form class="navbar-form navbar-right">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="검색">
						</div>
						<button type="submit" class="btn btn-info">확인</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">HOME</a></li>
						<li><a href="#">회원가입</a></li>
						<li><a href="#">냉장고 관리</a></li>
						<li><a href="#">거래 게시판</a></li>
						<li><a href="#">지도게시판</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>

		<div id="content" class="container-fluid ">
			<div id="map" style="height: 900px;"></div>
			<!--================= 거래 게시물 상세 내역 =================== 
				1. 이 부분을 미리 생성해놓고 display로 주는게 나은지 
				2. createElement로 어펜트 인서트하는게 나은지 
				
				//Condition
				@1 처음에 로드 에버리지를 높히냐 이후로 분배하냐의 느낌일까?
				@2 첫 마커 클릭 이후엔 어짜피 떠있음. 허나 별도 이벤트 없을 땐 리퀘스트 발생 안할 것
				@3 (살짝 논외) 거래 갱신 주기와 관련해서도 생각해볼 요소인듯 
			-->
			<!-- t_bbs가 거래게시판 인 것 같아 해당 테이블 칼럼 우선 참고했습니다. -->

			<div id="boardView" style="width: 50%;">
				<div class="container container-sm container-detail">
					<span id="list"></span>
				</div>
				
			</div>
		</div>
		<div class="footer">푸터 영역_Temp</div>
	</div>
	<!-- wrap -->
	<!-- class:wrap -->
</body>

<script type="text/javascript">
 	var board = document.getElementById("boardView"); //display none ->true로 변경
 	let curPosition; // curPosition 끌올용 let
 	

 	//지도를 담을 영역의 DOM 레퍼런스
 	var container = document.getElementById('map'), 
		options = { //지도 생성 시 필요 기본 옵션
			center: new kakao.maps.LatLng(37.566826, 126.9786567), //지도의 중심좌표.
			level: 4 //지도의 레벨(확대, 축소 정도)
		};
 	
 	//지도 생성 및 객체 리턴
	var map = new kakao.maps.Map(container, options); 
	
	//클러스터
	var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 5 // 클러스터 할 최소 지도 레벨 
    });
	//주소-좌표 반환 객체 생성
	var geocoder = new kakao.maps.services.Geocoder();
	
	var list = ${lists};
	var markers=[];
	var cntMarker={};
	
	//현재 뿌려주는거
	function getDB(){
		for(let i=0;i<list.length;i++){
			
			if(!(markers.includes(list[i].addr))){
				cntMarker["list[i].addr"]= 1;
				markers.push(list[i].addr);

				var positions = list[i].addr;
				geocoder.addressSearch(list[i].addr, function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {					
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
						//거래보기 a태그 자리에 이벤트 세팅
						var content = '<div class="wrap">' + 
					    '    <div class="info">' + 
					    '        <div class="title">' + 
				   					 list[i].addr +
					    '			 의 거래'+
					    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
					    '        </div>' + 
					    '        <div class="body">' + 
					    '            <div class="img">' +
					    '                <img src="" width="73" height="70" alt="이미지임">' +
					    '           </div>' + 
					    '            <div class="desc">' + 
					    '                <div class="ellipsis">희망 거래 '+cntMarker["list[i].addr"]+'개</div>' + 
					    '                <div><a href="javascript:void(0)" onclick="fold()"><input id="tbaddr" type="hidden" name="tbaddr" value="'+list[i].addr+'">거래목록보기</a></div>' + 
					    '            </div>' + 
					    '        </div>' + 
					    '    </div>' +    
					    '</div>';
						
						//마커를 중심으로 커스텀 오버레이 표시.
						var overlay = new kakao.maps.CustomOverlay({
						    content: content,
						    map: map,
						    position: marker.getPosition()
						});
						//마커별 이벤트리스너 등록
						kakao.maps.event.addListener(marker, 'click', function() {
		          	      // 마커 위 엘리먼트 표시
		          	      overlay.setMap(map);
		          		});
						//오버레이 닫기
						function closeOverlay(){
		          			overlay.setmap(null);
		          		}
						//마커 표시
						marker.setMap(map);
						//클러스터러에 마커 추가
						clusterer.addMarker(marker);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});
			}
			else if((markers.includes(list[i].addr))){
				cntMarker["list[i].addr"]+= 1;
			}
		}
	}

	getDB();
	

	function fold(){
		board.style.display = 'block';
		let tbaddr =document.getElementById("tbaddr").value;
		console.log(tbaddr);
		$.ajax({
			type : 'get',
			url:"<c:url value="/share/list.do"/>",
			data:{"start":1,"end":10,"tbaddr":tbaddr,"tbno":8},
			dataType:'json',
			success:function(data){successAjax(data,'list');},
			error:function(req,status,error){
				console.log('응답코드:%s,에러 메시지:%s,error:%s,status:%s',
						req.status,
						req.responseText,
						error,status);//@@
			}
		});
	}
	//Ajax - response 후 List Build fn
	var successAjax = function(data,id){
	    var tableString="<table class='table table-bordered' style='width: 50%'>";
	    tableString+="<tr>";
	    tableString+="<th>번호</th><th>제목</th><th>작성자</th><th>지역</th><th>작성일</th>";
	    tableString+="</tr>";
	    $.each(data,function(index,item){//@@index 불필요
	    	var date = new Date(item["tb_postDate"]);
	    	var postDate=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	    	tableString+="<tr>";
	    	tableString+='<td>'+item["tb_no"]+'</td><td><a href="javascript:void(0)" id="'+item["tb_no"]+'" onclick="view()">'+item["tb_title"]+'</a></td><td>'+item["id"]+'</td><td>'+item["addr"]+'</td><td>'+postDate+'</td>';
	    	tableString+="</tr>"
	    });
	    tableString+="</table>";	    
	    $('#'+id).html(tableString);
	};
	
	$('.download-gml').click(function() {
	    event.preventDefault(); //태그의 기본 동작 차단

	    //{backdrop: 'static'}는 여백 클릭시 닫히지 않도록 하는 옵션
	    $('#downloadModal').modal({backdrop: 'static'}).on('shown.bs.modal', function (e){
	        console.info('download modal');
	    });
	});
	
	function view(){
		var zIndex = 9999;
	    var modal = document.getElementById("my_modal");
		//var tbno= 7; // 인수 받고 e.target?
		//console.log(tbno);
	    $.ajax({
			type : 'get',
			url:"<c:url value="/share/view.do"/>",
			data:"tbno=7", //{"":''}json형식 아닌가? 이리하면 왜 안되냐
			//contentType : "application/json;charset=UTF-8",
			dataType:'json',
			processData: false,
			success:function(viewData){successAjax(viewData,'my_modal');},
			error:function(req,status,error){
				//console.log("Ajax Failed");
				console.log('응답코드:%s,에러 메시지:%s,error:%s,status:%s',
						req.status,
						req.responseText,
						error,status);
			}
		});
	    
	    // 모달 div 뒤에 희끄무레한 레이어
	    var bg = document.createElement('div');
        bg.setStyle({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        });
        document.body.append(bg);

        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
	}////view
	
	//Ajax - response 후 View Build fn
	var successAjax = function(data,id){
	    var tableString="<table class='table table-bordered' style='width: 50%'>";
	    tableString+="<tr>";
	    tableString+="<th>번호</th><th>제목</th><th>작성자</th><th>지역</th><th>작성일</th>";
	    tableString+="</tr>";
	    $.each(data,function(index,item){//@@index 불필요
	    	var date = new Date(item["tb_postDate"]);
	    	var postDate=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	    	tableString+="<tr>";
	    	tableString+='<td>'+item["tb_no"]+'</td><td><a href="javascript:void(0)" id="'+item["tb_no"]+'" onclick="view()">'+item["tb_title"]+'</a></td><td>'+item["id"]+'</td><td>'+item["addr"]+'</td><td>'+postDate+'</td>';
	    	tableString+="</tr>"
	    });
	    tableString+="</table>";	    
	    $('#'+id).html(tableString);
	};
	
	
	Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };
	$('#popup_open_btn').on('click', function() {
	    // 모달창 띄우기
	    modal('my_modal');
	});
	
	//db 연동 마커 표시 -ajax 뷰 따리빼기 귀찮으니 이렇게 하자...
	/*
		function showMarker(){
			$.ajax({
		        method: 'get',
		        url: "/share/shareMap",
		        data: "",
		        processData : true,
		        contentType : "application/json; charset=utf-8",
		        success: function (success) {
					console.log("들어옴");
		            positions.length = 0;
		            for (let i = 0; i < success.data.length; i++) {
		                //positions.push({title: success.data[i].title, latlng: new kakao.maps.LatLng(success.data[i].myLat, success.data[i].myLng), id: success.data[i].id, category : success.data[i].categoryName});
		            }
		            for (let i = 0; i < positions.length; i++) {
		                let imageSrc;              
		                var marker = new kakao.maps.Marker({
		                    map: map,
		                    position: positions[i].latlng,
		                    title: positions[i].title,
		                    image : markerImage
		                });	              
		                //for문 밖에 있으면 마지막 마커에만 적용
		                kakao.maps.event.addListener(marker, 'click', clickMarker(map, marker, iwContent, iwPosition));
		            }
		        },
		        error: function (request, status, error) {
		            //alert("code: " + request.status + "\n" +"msg:"+request.responseText+"\n"+ "error: " + error);
		        }
		    });
		}
		showMarker();*/
	
	/* session -> member.addr 사용 시 x
	//초기 현재 위치 기반 테스트용 지도&마커
	//geolocation 사용 가능 여부
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	var curLat = position.coords.latitude, // 위도
	    		curLon = position.coords.longitude; // 경도
			var curPosition = new kakao.maps.LatLng(curLat, curLon);//현재 위치 카카오 LatLng 객체에 담기
			map.setCenter(curPosition);//현재 위치로 지도 중심 변경
			
			//테스트용 마커 생성
			var tmpMarker = new kakao.maps.Marker({
			position: curPosition
			});
			console.log("테스트 마커 생성");
			//테스트용 마커 지도 위 세팅
			tmpMarker.setMap(map);
	      });
	}
	else {	
		alert("위치를 찾을 수 없습니다.");		
	}
	*/
	
</script>
</html>