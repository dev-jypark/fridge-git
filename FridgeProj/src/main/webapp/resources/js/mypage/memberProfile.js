
var user;
var userid; 
var usernick;

var feeds = Array();


$.ajax({
	url: "/community.do,",
	data: { id: $("input[name=id]").val()},
	dataType: 'json'
}).done(function(data) {
	
	user=data;
	userid=data["id"];
	usernick=data["nick"];
	console.log(user);	
	console.log(userid);
	console.log(usernick);
	$.ajax({
		url: "/profile/feeds.do"
		/*data: { id: $("input[name=id]").val()},
		dataType: 'json'*/
	}).done(function(data) {
		printFeed(data);
		initListener();
	}).fail(function(request, error) {
		console.log('응답코드:%s,에러 메시지:%s,error:%s', request.status, request.responseText, error);
		
	});

}).fail(function(req, error) {
	console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
	console.log($("input[name=target]").val());
});

function printFeed(data) {
	
	$.each(data, function(i, feed) {
		
		feeds.push(feed);

		feedString = "";
		feedString += '<div class="gallery-item">';
		feedString += '<div class="carouselGallery-carousel" data-index="' + (feeds.length - 1) + '">';
		feedString += '<img alt="' + feed["fb_no"] + '" src="/upload/feed/'+feed["fb_no"]+'/' + feed["list_fi_src"][0] + '" class="gallery-image"></div>';

		feedString += '<div class="gallery-item-info">';
		feedString += '<ul><li class="gallery-item-likes"><span class="visually-hidden">Likes:</span>';
		feedString += '<i class="fas fa-heart" aria-hidden="true"></i>&nbsp;&nbsp;<span class="count">' + feed["list_f_likeMember"].length + '</span></li>';

		feedString += '<li class="gallery-item-comments"><span class="visually-hidden">Comments:</span>';
		feedString += '<i class="fas fa-comment" aria-hidden="true"></i>&nbsp;&nbsp;<span class="count">' + feed["list_f_comment"].length + '</span></li></ul></div></div>';

		$('.gallery').append(feedString);
	});
};

function showModal(index) {
	feed = feeds[index]
	console.log(feed);
	var modalHtml = '';
	imagepath = feed["list_fi_src"][0];

	maxHeight = $(window).height() - 100;
	
	if ($('.carouselGallery-wrapper').length === 0) {
		if (typeof imagepath !== 'undefined') {
			modalHtml = "<div class='carouselGallery-wrapper'>";

			modalHtml += "<div class='carouselGallery-modal'>";
			modalHtml += "<span class='carouselGallery-left'><i class='fas fa-angle-left'></i></span><span class='carouselGallery-right'><i class='fas fa-angle-right'></i></span>";


			modalHtml += "<div class='container'>";
			modalHtml += "<i class='far fa-times-circle'></i>";
			modalHtml += "<div class='carouselGallery-scrollbox' style='max-height:" + maxHeight + "px'>";
			modalHtml += "<div class='carouselGallery-modal-image'>";
			modalHtml += "<img src='/upload/feed/"+feed["fb_no"]+'/' + feed["list_fi_src"][0] + "' alt='" + feed["list_fi_src"][0] + "'>";
			modalHtml += "</div>";

			modalHtml += "<div class='carouselGallery-modal-text'>";

			modalHtml += "<div class='header'>";
			modalHtml += "<a href='/memberProfile/" + feed["nick"] + ".do'><img alt='" + feed["nick"] + "' src='/upload/profile/" + feed["imgsrc"] + "' class='img-circle pull-left'><span>" + feed["nick"] + "</a></div>";

			modalHtml += "<div class='body'>";
			modalHtml += "<div class='content'><a href='/memberProfile/" + feed["nick"] + ".do'><img alt='" + feed["nick"] + "' src='/upload/profile/" + feed["imgsrc"] + "' class='img-circle pull-left'>";
			modalHtml += "<p>" + feed["nick"] + "</a>" + feed["fb_content"] + "</p></div>";

			
			// 댓글 출력 파트 
			modalHtml += "<div class='comments'>";
			$.each(feed["list_f_comment"], function(i, comment) {
				modalHtml += "<div class='content'><a href='/memberProfile/" + comment["nick"] + ".do'><img alt='" + comment["nick"] + "' src='/upload/profile/" + comment["imgsrc"] + "' class='img-circle pull-left'>";
				modalHtml += "<p>" + comment["nick"] + "</a>" + comment["fc_content"] + "</p>";
				modalHtml += "</div>";
			});		
			modalHtml += "</div></div>";
			
			var temp = 'far';
			
			for(var i = 0; i < feed['list_f_likeMember'].length; i++){
				if(feed['list_f_likeMember'][i]['nick'] === usernick){
					temp = 'fas';
					break;	
				}
			}

			// 좋아요 기능 파트
			modalHtml += "<div class='footer'>";
			modalHtml += "<ul class='list-inline'>";
			//modalHtml += "<li><a href='javascript:void(0)'><i class='"+temp+" fa-heart' onclick='likeProcess("+index+")'></i></a></li>";
			//modalHtml += "<li><a href='javascript:void(0)'><i class='"+temp+" fa-envelope'></i></a></li>";
			//modalHtml += "<li class='pull-right'><a href='#'><i class='fas fa-bars'></i></a></li></ul>";

			modalHtml += "<div class='show-like'><i class='"+temp+" fa-heart' onclick='likeProcess("+index+")'></i><a href='javascript:void(0)'> 좋아요 <span class='likeCount'>" + feed["list_f_likeMember"].length + "</span>개</a></div>";

			
			// 댓글 입력 파트
			modalHtml += "<div class='add-comment'>";
			modalHtml += "<i class='far fa-comments'></i>";
			modalHtml += "<input type='text' name='comment' class='comment' placeholder='댓글 달기..'/>";
			modalHtml += "<p class='pull-right' data-index='" + index + "'>게시</p>";
			modalHtml += '<input type="hidden" name="fb_no" value="'+feed["fb_no"]+'"></input></div>';

			modalHtml += "</div></div></div></div></div></div>";

			$('body').append(modalHtml).fadeIn(2500);
		}
	}
	console.log("쇼 모달 함수 끝");
};

function insertComment() {
	
	var e = $(event.target);
	var index = e.data('index');
	var fb_content = e.prev().val().trim();
	
	$.ajax({
		url: "/community/comment.do",
		data: {"fb_no":e.next().val(), "fc_content":e.prev().val(), "id":userid},
		type:'post',
	}).done(function(data) {
		console.log('댓글입력성공');
	}).fail(function(req, error) {
		console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
	});	
	
	feeds[index]['list_f_comment'].unshift({"id":userid, "fc_content":fb_content});
	$('.gallery-item-comments:eq('+index+') .count').text(feeds[index]['list_f_comment'].length);
	
	var commentString="";
	
	commentString += "<div class='content'><a href='/memberProfile/" + usernick + ".do'><img alt='"+usernick+"' src='/upload/profile/" + user["imgsrc"] + "' class='img-circle pull-left'>";
	commentString += "<p>" + usernick + "</a>" +  e.prev().val() + "</p>";
	commentString += "</div>";
	
	$('div.comments').prepend(commentString);
	e.prev().val("");
	e.prev().focus()
	e.css('cursor', 'default').css('font-weight','normal');
	e.attr('onclick', '');
}

function likeProcess(index) {
	
	var e = $(event.target);
	var list_f_likeMember = feeds[index]['list_f_likeMember'];
	var param;
	console.log(list_f_likeMember);

	
	if (e.hasClass('far')) {
		e.removeClass('far');
		e.addClass('fas');
		list_f_likeMember.push({"nick":user});				
		param = 0;
	}
	else {
		e.removeClass('fas');
		e.addClass('far');		
		list_f_likeMember.splice($.inArray(usernick, list_f_likeMember), 1);		
		
		param = 1;
	}
	console.log($.inArray(usernick, list_f_likeMember));
	$('.likeCount').html(list_f_likeMember.length);
	$('.gallery-item-likes:eq('+index+') .count').text(list_f_likeMember.length);
	console.log(list_f_likeMember);
	
	$.ajax({
		url: "/community/like.do",
		data: { fb_no: feeds[index]['fb_no'], "id": userid, "flag":param },
		type: 'post',
	}).done(function(data) {
		console.log("좋아요 요청 성공");
	}).fail(function(req, error) {
		console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
	});
}


var updateArrows = function() {
	$('.carouselGallery-right').removeClass('disabled');
	$('.carouselGallery-left').removeClass('disabled');
	var curIndex = $('.carouselGallery-carousel.active').data('index');
	updateArrows.nbrOfItems = updateArrows.nbrOfItems || $('.carouselGallery-carousel').length - 1;

	curIndex === updateArrows.nbrOfItems && $('.carouselGallery-right').addClass('disabled');
	curIndex === 0 && $('.carouselGallery-left').addClass('disabled');
}


var removeModal = function() {
	$('body').find('.carouselGallery-wrapper').remove();
	$('body').removeClass('noscroll');
	$('body').css('position', 'static');
	$('body').animate({
		scrollTop: scrollTo
	}, 0);
	console.log("모달 삭제 끝");
};

// Avoid break on small devices
var carouselGalleryScrollMaxHeight = function() {
	if ($('.carouselGallery-scrollbox').length) {
		maxHeight = $(window).height() - 100;
		$('.carouselGallery-scrollbox').css('max-height',
			maxHeight + 'px');
	}
}

$(window).resize(function() { // set event on resize
	console.log("리사이즈 함수 시작");
	clearTimeout(this.id);
	this.id = setTimeout(carouselGalleryScrollMaxHeight, 100);
	console.log("resize 함수 끝");
});



function initListener() {
	
	$('.gallery-item-info').on('click', function(e) {
		console.log("item info 클릭이벤트발생");

		scrollTo = $('body').scrollTop();
		$('body').addClass('noscroll');
		$('body').css('position', 'fixed');
		$('carouselGallery-carousel').removeClass('active');
		$(this).prev().addClass('active');
		showModal($(this).prev().data("index"));
		updateArrows();
	});
	
	$(document).on('click', '.carouselGallery-right, .carouselGallery-left', function(e) {
		if ($(this).hasClass('disabled'))
			return;
		var curIndex = $('.carouselGallery-carousel.active').data('index');
		var nextItemIndex = parseInt(curIndex + 1);
		if ($(this).hasClass('carouselGallery-left')) {
			nextItemIndex -= 2;
		}
		var nextItem = $('.carouselGallery-carousel[data-index=' + nextItemIndex + ']');
		// console.log(nextItemIndex);
		if (nextItem.length > 0) {
			$('.carouselGallery-carousel').removeClass('active');
			$('body').find('.carouselGallery-wrapper').remove();
			showModal($(nextItem.get(0)).data("index"));
			nextItem.first().addClass('active');
		}
		updateArrows();
		console.log("add 바디 함수 끝");
	});
	
	$(document).on('input','.comment', function() {
		if($(this).val().trim()=='') {
			$(this).next().css('cursor', 'default').css('font-weight','normal');
			$(this).next().attr('onclick', '');
		}
		else {
			$(this).next().css('cursor', 'pointer').css('font-weight','bold');
			$(this).next().attr('onclick', 'insertComment()');
		}
	});

	$(document).on('click', '.carouselGallery-modal .fa-times-circle', function(e) {
		removeModal();
	});
	
	document.onkeydown = function(evt) {
		//evt = evt || window.event;
		if (evt.keyCode == 27) {
			removeModal();
		}
	};
	
	/*
	컨텐츠를 제외한 다른곳 누르면 꺼지는 기능같은데 안먹음
	$(document).on('click', '.carouselGallery-wrapper', function(e) {
		if ($(e.target).hasClass('.carouselGallery-wrapper')) {
			removeModal();
		}
	});
	*/
}