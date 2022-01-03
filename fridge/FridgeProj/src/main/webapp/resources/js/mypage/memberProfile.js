
var nick = $("input[name=nick]").val();
console.log(nick);

$.ajax({
	url: "/profile/feeds/" + nick,
	dataType: 'json'
}).done(function(data) {
	printFeed(data);
	addListener();
	console.log("던 함수 시작");
}).fail(function(request, error) {
	console.log('응답코드:%s,에러 메시지:%s,error:%s', request.status, request.responseText, error);
	console.log("실패 함수 시작");
});

function insertComment(flag) {
		
		e = $(event.target);
		$.ajax({
			url: "/community/comment/",
			data: {fb_no: e.next().val(),fc_content:e.prev().val(), "nick":nick},
			dataType: 'json',
			type:'post',
		}).done(function(data) {
			console.log( $('ul'));
			console.log(data);
		}).fail(function(req, error) {
			
			console.log();
			console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
		});	
		var commentString="";
		
		commentString += "<div class='content'><img alt='' src='/upload/profile/" + nick + ".jpg' class='img-circle pull-left'>";
		commentString += "<p><a href='" + "" + "'>" + nick + "</a>" +  e.prev().val() + "</p>";
		commentString += "</div>";
		
		$('div.comments').prepend(commentString);
		e.prev().val("");
		e.prev().focus()
	}

var feeds = Array();

function printFeed(data) {
	console.log("프린트 피드 함수 시작");
	$.each(data, function(i, feed) {
		feeds.push(feed);

		console.log("feed 인덱스: ", feeds.length);

		feedString = "";
		feedString += '<div class="gallery-item">';
		feedString += '<div class="carouselGallery-carousel" data-index="' + (feeds.length - 1) + '">';
		feedString += '<img alt="' + feed["list_fi_src"][0] + '" src="/upload/feed/'+feed["fb_no"]+'/' + feed["list_fi_src"][0] + '" class="gallery-image"></div>';

		feedString += '<div class="gallery-item-info">';
		feedString += '<ul><li class="gallery-item-likes"><span class="visually-hidden">Likes:</span>';
		feedString += '<i class="fas fa-heart" aria-hidden="true"></i>&nbsp;&nbsp;' + feed["list_f_likeMember"].length + '</li>';

		feedString += '<li class="gallery-item-comments"><span class="visually-hidden">Comments:</span>';
		feedString += '<i class="fas fa-comment" aria-hidden="true"></i>&nbsp;&nbsp;' + feed["list_f_comment"].length + '</li></ul></div></div>';

		$('.gallery').append(feedString);
	});
	
	console.log(feeds);
	console.log("printFeed함수 끝");
};



var updateArrows = function() {
	$('.carouselGallery-right').removeClass('disabled');
	$('.carouselGallery-left').removeClass('disabled');
	var curIndex = $('.carouselGallery-carousel.active').data('index');
	updateArrows.nbrOfItems = updateArrows.nbrOfItems || $('.carouselGallery-carousel').length - 1;

	curIndex === updateArrows.nbrOfItems && $('.carouselGallery-right').addClass('disabled');
	curIndex === 0 && $('.carouselGallery-left').addClass('disabled');
}

function addListener() {
	console.log("add listenr 함수 시작");
	$('.gallery-item-info').on('click', function(e) {
		console.log("item info 클릭이벤트발생");

		scrollTo = $('body').scrollTop();
		$('body').addClass('noscroll');
		$('body').css('position', 'fixed');
		$('carouselGallery-carousel').removeClass('active');
		$(this).prev().addClass('active');
		showModal(feeds[$(this).prev().data("index")]);
		updateArrows();
	});
	console.log("add 리스너 함수 끝");
}

$('body').on('click', '.carouselGallery-right, .carouselGallery-left', function(e) {
	console.log("adㅇ바디 함수 시작");
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
		showModal(feeds[$(nextItem.get(0)).data("index")]);
		nextItem.first().addClass('active');
	}
	updateArrows();
	console.log("add 바디 함수 끝");
});

var modalHtml = '';

showModal = function(feed) {
	console.log("showModal함수");
	console.log(feed);
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
			modalHtml += "<a href='" + "" + "'><img alt='' src='/upload/profile/" + feed["nick"] + ".jpg' class='img-circle pull-left'><span>" + feed["nick"] + "</a></div>";

			modalHtml += "<div class='body'>";
			modalHtml += "<div class='content'><img alt='" + feed["nick"] + "' src='/upload/profile/" + feed["nick"] + ".jpg' class='img-circle pull-left'>";
			modalHtml += "<p><a href='" + '' + "'>" + feed["nick"] + "</a>" + feed["fb_content"] + "</p></div>";

			modalHtml += "<div class='comments'>";
			$.each(feed["list_f_comment"], function(i, comment) {
				modalHtml += "<div class='content'><img alt='' src='/upload/profile/" + comment["id"] + ".jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + "" + "'>" + comment["nick"] + "</a>" + comment["fc_content"] + "</p>";
				modalHtml += "</div>";
			});		
			modalHtml += "</div></div>";



			modalHtml += "<div class='footer'>";
			modalHtml += "<ul class='list-inline'>"
			modalHtml += "<li><a href='#'><i class='far fa-heart'></i></a></li>";
			modalHtml += "<li><a href='#'><i class='far fa-envelope'></i></a></li>";
			modalHtml += "<li class='pull-right'><a href='#'><i class='fas fa-bars'></i></a></li></ul>";

			modalHtml += "<div class='show-like'><a href='#'><i class='far fa-heart'></i> 좋아요 " + feed["list_f_likeMember"].length + "개</a></div>";

		modalHtml += "<div class='add-comment'>";
			modalHtml += "<i class='far fa-comments'></i>";
			modalHtml += "<input type='text' name='comment' class='comment' placeholder='댓글 달기..'/>";
			modalHtml += "<p class='pull-right' onclick='insertComment();'>게시</p>";
			modalHtml += '<input type="hidden" name="fb_no" value="'+feed["fb_no"]+'"></input></div>';

			modalHtml += "</div></div></div></div></div></div>";

			$('body').append(modalHtml).fadeIn(2500);
		}
	}
	console.log("쇼 모달 함수 끝");
};

$('body').on('click', '.carouselGallery-wrapper', function(e) {
	console.log("add 잡1수 시작");
	if ($(e.target).hasClass('.carouselGallery-wrapper')) {
		removeModal();
	}
	console.log("add 잡1 함수 끝");
});

$('body').on('click', '.carouselGallery-modal .fa-times-circle', function(e) {
	console.log("잡2 ㅎ시작");
	removeModal();
	console.log("잡2 함수 끝");
});

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

document.onkeydown = function(evt) {
	console.log("몰라 리스너 함수 시작");
	evt = evt || window.event;
	if (evt.keyCode == 27) {
		removeModal();
	}
	console.log("몰라 리스너 함수 끝");
};


