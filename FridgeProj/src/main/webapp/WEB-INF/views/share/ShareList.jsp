<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>찍먹냉장고 | 냉장고 속 남은 재료 나눠먹기</title>
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="resources/js/sharelist/select.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script><!-- @@둘 중 하나 날리자 버전 상관 없으면 위에거 남기는걸로 -->
	<!-- 지도 키, 발급 후 src_appkey 부분 변경 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d555d6661391d7bcc7566ec232018705&libraries=services,clusterer"></script>
	
	<!-- 페이징 -->
	<!-- <link rel="stylesheet" type="text/css" href="resources/css/sharelist/paging.css" /> -->
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/bootstrap.min.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/materialdesignicons.min.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/jquery.mCustomScrollbar.min.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/prettyPhoto.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/unslider.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/template.css"/>" />
	<!-- 정렬 드롭다운 -->
	<link rel="stylesheet" type="text/css" href="<c:url value="resources/css/sharelist/justselect.css"/>" />
	<!-- 하기 0205기존 rel.@@ -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sharelist/shareMap.css"/>">
	
	
	<!-- @@모달용 임시 이후 css로 이동 -->
	<style type="text/css">
	#my_modal {
		display: none;
		width: 700px;
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
	<div id="my_modal" class="mmod">
    <a class="modal_close_btn">닫기</a>
    
	</div>
	<div class="container" style="margin-top:80px">
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
	</div>
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
		console.log(list.length);
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
						
						//오버레이용 ctc
						var content = '<div class="wrap">' + 
					    '    <div class="info">' + 
					    '        <div class="title">' + 
				   					 list[i].addr +
					    '			 의 거래'+
					    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
					    '        </div>' + 
					    '        <div class="body">' + 
					    '            <div class="desc">' + 
					    '                <div class="ellipsis">희망 거래 4 개</div>' + 
					    '                <div><a href="javascript:void(0);" onclick="getList(\''+list[i].addr+'\')">거래목록보기</a></div>' + 
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
		          		};
						//마커 표시
						marker.setMap(map);
						//클러스터러에 마커 추가
						clusterer.addMarker(marker);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } //////////////////////
				});
			}
			else if((markers.includes(list[i].addr))){
				cntMarker["list[i].addr"]+= 1;
			}
		}
	};
	getDB();
	
	//목록 받아오기
	function getList(e){
		board.style.display = 'block';
		console.log("getlist의 e: "+e);
		$.ajax({
			type : 'get',
			url:'<c:url value="/share/shareAjaxList.do?mAddr='+e+'"/>',
			data:{},
			success:function(data){
				$('#list').html(data);
				},
			error:function(req,status,error){
				console.log("getList Failed");
			}
		})
	};
	
	//모달관련
	$('.download-gml').click(function() {
	    event.preventDefault(); //태그의 기본 동작 차단

	    //{backdrop: 'static'}는 여백 클릭시 닫히지 않도록 하는 옵션
	    $('#downloadModal').modal({backdrop: 'static'}).on('shown.bs.modal', function (e){
	        console.info('download modal');
	    });
	});

	function getView(e){
		var zIndex = 9999; //상단 locating용
	    var modal = document.getElementById("my_modal");
		console.log("getView의 e "+e);
	    $.ajax({
			type : 'get',
			url:'<c:url value="/share/view.do?tb_no='+e+'"/>',
			data:{},
			success:function(viewData){
				$('#my_modal').html(viewData);
				},
			error:function(req,status,error){
				console.log('응답코드:%s,에러 메시지:%s,error:%s,status:%s',
						req.status,
						req.responseText,
						error,status);
				console.log('viewAjax Failed');
			}
		});	    
	    // 모달 div 뒤에 희끄무레한 레이어
	    var bg = document.createElement('div');
        bg.setStyle({
            position: 'fixed', zIndex: zIndex,
            left: '0px', top: '0px', width: '100%',
            height: '100%', overflow: 'auto',
            backgroundColor: 'rgba(0,0,0,0.4)' // 레이어 색갈은 여기서 바꾸면 됨
        });
        document.body.append(bg);
        /*
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });*/

        modal.setStyle({
            position: 'fixed', display: 'block',
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
	};////view

	//@모달 css관련
	Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };
    /*
	$('#popup_open_btn').on('click', function() {
	    // 모달창 띄우기
	    modal('my_modal');
	});*/
	/*
	 $(document).ready(function( $ ){  console.log("시작");
		    $("#popup_open_btn").on("click", function(event) {  //팝업오픈 버튼 누르면
		    $("#my_modal").show();   //팝업 오픈
		   
		    $(".btn btn-warning").on("click", function(event) { 		        
		        console.log("onㅇㅇㅇ");
		    	$("#my_modal").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
		      });
		 
		  });
	 });
	/*
	function closeModView(){
		close.addEventListener("click",function(){
			console.log("리스너부착");
			modal.classList.add("hidden");
		})
		console.log("들어는 왔다...");
		bg.remove();
		//$('.mmod').display("none"); //@@레이아웃도 같이 처리해줘야함. 까먹을뻔 ㅋ
	}*/
</script>
</html>