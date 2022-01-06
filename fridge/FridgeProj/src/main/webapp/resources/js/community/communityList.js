var nick = $("input[name=nick]").val(); // 히든박스에 닉네임저장 
nick = nick.length == 0 ? "Kil_dong" : nick;  // 임시로 아이디가 없으면 김길동으로 테스트 하기위한 코드
console.log(nick);

var feeds = Array(); // 에이작스로 가져온 모든 데이터(피드글)를 관리할 전역변수

$.ajax({
	url: "/community/feeds/" + nick,
	dataType: 'json'
}).done(function(data) {
	printFeed(data);
	console.log(feeds);
	initListenerOnDocument();	
}).fail(function(req, error) {
	console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
});


function printFeed(data) {
	
	$.each(data, function(i, feed) {
		
		feeds.push(feed);
		
		var index = (feeds.length - 1);

		feedString = "";
		feedString += '<section class="feedify-item">';
		feedString += '<header class="feedify-item-header clearfix">';
		feedString += '<h1 class="pull-left"><a href="/memberProfile/' + feed["nick"] + '">';
		feedString += '<img alt="' + feed["nick"] + '" src="/upload/profile/' + feed["nick"] + '.jpg" class="img-circle pull-left">' + feed["nick"] + '</a></h1>';
		feedString += '<h2 class="pull-right hidden-xs">' + feed["fb_postdate"] + '</h2>';
		feedString += '</header>';

		feedString += '<div class="feedify-item-body">';
		feedString += '<img alt="' + feed["list_fi_src"][0] + '" src="/upload/feed/' + feed["fb_no"] + '/' + feed["list_fi_src"][0] + '" class="img-responsive"></div>';
		feedString += '<footer>';
		feedString += '<div class="actions"><ul class="list-inline">';
		
		
		// 메인 좋아요 기능 구현
		var temp = 'far';
		
		for(var i = 0; i < feed['list_f_likeMember'].length; i++){
			if(feed['list_f_likeMember'][i]['nick'] === nick){
				temp = 'fas';
				break;	
			}
		}
		
		feedString += '<li><a href="javascript:void(0);" onclick="likeProcess(0)"><i class="'+temp+' fa-heart" data-index="' + index + '"></i></a></li>';
		feedString += '<li><a href="javascript:void(0);" onclick="showModal('+ index +')"><i class="far fa-clone"></i></a></li>';
		feedString += '<li class="pull-right"><a href="' + '/*TODO:글관련메뉴바*/' + '"><i class="fas fa-bars"></i></a></li></ul></div>';

		feedString += '<div class="legend">';
		feedString += '<h3><a href="' + '/*TODO:좋아요목록뿌려주기*/' + '"><i class="far fa-heart"></i> 좋아요 <span class="likeCount">' + feed["list_f_likeMember"].length + '</span>개</a></h3>';
		//feedString += '<h4 class="pull-left"><a href="' + '' + '">' + '' + '</a></h4>';//아마 필요없는 코드 작업후 필요없으면 삭제
		feedString += '<p>' + feed["fb_content"] + '</p></div>';

		
		// 메인 댓글 출력 파트
		feedString += '<ul class="comments list-unstyled">';
		$.each(feed["list_f_comment"], function(i, comment) {
			if (i > 2)
				return;

			feedString += '<li><h4 class="pull-left"><a href="/memberProfile/' + comment["nick"] + '">' + comment["nick"] + '</a></h4>';
			feedString += '<p>'+comment["fc_content"]+'</p>';
			feedString += '</li>';

		});

		feedString += '</ul>';

		// 메인 댓글 입력 파트
		feedString += '<div class="add-comment">';
		feedString += '<i class="far fa-comments"></i>';
		feedString += '<input type="text" name="comment" data-flag="0" class="comment" placeholder="댓글 달기.."></input>';
		feedString += '<p class="pull-right" data-index="' + index + '">게시</p>';
		feedString += '<input type="hidden" name="fb_no" value="' + feed["fb_no"] + '"></input></div>';

		feedString += '</footer></section>';

		$('.feedify').append(feedString);
	});
}

function insertComment(flag) {

	var e = $(event.target);
	var index = e.data('index');
	var fb_content = e.prev().val().trim();
	console.log(flag);
	
	$.ajax({
		url: "/community/comment/",
		data: { fb_no: e.next().val(), fc_content: e.prev().val(), "nick": nick },
		type: 'post',
	}).done(function(data) {
		console.log("댓글 입력 성공");
	}).fail(function(req, error) {
		console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
	});

	var commentString = "";
	
	commentString += '<li><h4 class="pull-left"><a href="/memberProfile/' + nick + '">' + nick + '</a></h4><p>';
	commentString += fb_content;
	commentString += '</li>';
	
	$('ul.comments:eq(' + index + ') li:eq(2)').remove();
	$('ul.comments:eq(' + index + ')').prepend(commentString);
	
	feeds[index]['list_f_comment'].unshift({"nick":nick, "fc_content":fb_content});
	console.log(feeds[index]['list_f_comment']);
	
	if (flag != 0) {
		
		commentString = "";
		commentString += "<div class='content'><img alt='"+nick+"' src='/upload/profile/" + nick + ".jpg' class='img-circle pull-left'>";
		commentString += "<p><a href='/memberProfile/" + nick + "'>" + nick + "</a>" + fb_content + "</p>";
		commentString += "</div>";

		$('div.comments').prepend(commentString);		
	}	
	
	e.prev().val("");
	e.prev().focus();
	e.css('cursor', 'default').css('font-weight','normal');
	e.attr('onclick', '');
}

function likeProcess(flag) {
	
	var e = $(event.target);	
	var index = e.data('index');
	//var likeCount = parseInt($('.likeCount:eq(' + index + ')').html());
	var list_likeMember = feeds[index]['list_f_likeMember'];
	var param;

	console.log(feeds[e.data('index')]);
	
	if (e.hasClass('far')) {
		e.removeClass('far');
		e.addClass('fas');
		list_likeMember.push({"nick":nick});
		$('.likeCount:eq(' +index + ')').html(list_likeMember.length);
		
		if(flag == 1){
			var mainHeart = $('li i.fa-heart:eq('+index+')');
			mainHeart.removeClass('far');
			mainHeart.addClass('fas');
			$('.carouselGallery-modal-text .likeCount').html(list_likeMember.length);
		}
		
		param = 0;
	}
	else {
		e.removeClass('fas');
		e.addClass('far');
		console.log($.inArray(nick, feeds[e.data('index')]['list_f_likeMember']));
		list_likeMember.splice($.inArray(nick, feeds[e.data('index')]['list_f_likeMember']), 1);
		$('.likeCount:eq(' + index + ')').html(list_likeMember.length);
		
		if(flag == 1){
			var mainHeart = $('li i.fa-heart:eq('+index+')');
			mainHeart.removeClass('fas');
			mainHeart.addClass('far');
			$('.carouselGallery-modal-text .likeCount').html(list_likeMember.length);
		}
		param = 1;
	}
	
	console.log(list_likeMember);
	
	$.ajax({
		url: "/community/like/",
		data: { fb_no: feeds[index]['fb_no'], "nick": nick, "flag":param },
		type: 'post',
	}).done(function(data) {
		console.log("좋아요 요청 성공");
	}).fail(function(req, error) {
		console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
	});
}


/*모달관련 js*/

function showModal(index) {
	
	feed = feeds[index];
	console.log('data-index: ', index)
	
	imagepath = feed["list_fi_src"][0];

	maxHeight = $(window).height() - 100;

	if ($('.carouselGallery-wrapper').length === 0) {
		if (typeof imagepath !== undefined) {
			var modalHtml = '';
			modalHtml = "<div class='carouselGallery-wrapper'>";

			modalHtml += "<div class='carouselGallery-modal'>";


			modalHtml += "<div class='container'>";
			modalHtml += "<i class='far fa-times-circle'></i>";
			modalHtml += "<div class='carouselGallery-scrollbox' style='max-height:" + maxHeight + "px'>";
			modalHtml += "<div class='carouselGallery-modal-image'>";
			modalHtml += "<img src='/upload/feed/" + feed["fb_no"] + '/' + feed["list_fi_src"][0] + "' alt='" + feed["list_fi_src"][0] + "'>";
			modalHtml += "</div>";

			modalHtml += "<div class='carouselGallery-modal-text'>";

			modalHtml += "<div class='header'>";
			modalHtml += "<a href='/memberProfile/" + feed["nick"] + "'><img alt='"+feed["nick"]+"' src='/upload/profile/" + feed["nick"] + ".jpg' class='img-circle pull-left'><span>" + feed["nick"] + "</a></div>";

			modalHtml += "<div class='body'>";
			modalHtml += "<div class='content'><a href='/memberProfile/" + feed["nick"] + "'><img alt='" + feed["nick"] + "' src='/upload/profile/" + feed["nick"] + ".jpg' class='img-circle pull-left'>";
			modalHtml += "<p>" + feed["nick"] +"</a>"+ feed["fb_content"] + "</p></div>";

			// 모달 댓글 출력 파트
			modalHtml += "<div class='comments'>";
			$.each(feed["list_f_comment"], function(i, comment) {
				modalHtml += "<div class='content'><a href='/memberProfile/" + comment["nick"] + "'><img alt='"+comment+"' src='/upload/profile/" + comment["nick"] + ".jpg' class='img-circle pull-left'>";
				modalHtml += "<p>" + comment["nick"] + "</a>" + comment["fc_content"] + "</p>";
				modalHtml += "</div>";
			});
			modalHtml += "</div></div>";

			modalHtml += "<div class='footer'>";
			modalHtml += "<ul class='list-inline'>"
			
			
			// 모달 좋아요 파트
			console.log(feed['list_f_likeMember']);
			
			var temp = 'far';
		
			for(var i = 0; i < feed['list_f_likeMember'].length; i++){
				if(feed['list_f_likeMember'][i]['nick'] === nick){
					temp = 'fas';
					break;	
				}
			}
			
			modalHtml += "<li><a href='javascript:void(0);' onclick='likeProcess(1)'><i class='"+temp+" fa-heart' data-index='"+index+"'></i></a></li>";
			modalHtml += "<li><a href='#'><i class='far fa-envelope'></i></a></li>";
			modalHtml += "<li class='pull-right'><a href='javascript:void(0);'><i class='fas fa-bars'></i></a></li></ul>";

			modalHtml += "<div class='show-like'><a href='javascript:void(0);'><i class='far fa-heart'></i> 좋아요 <span class='likeCount'>" + feed["list_f_likeMember"].length + "</span>개</a></div>";

			
			// 모달 댓글 입력 파트
			modalHtml += "<div class='add-comment'>";
			modalHtml += "<i class='far fa-comments'></i>";
			modalHtml += "<input type='text' name='comment' class='comment' data-flag='1' placeholder='댓글 달기..'/>";
			modalHtml += "<p class='pull-right' data-index='" + index + "'>게시</p>";
			modalHtml += '<input type="hidden" name="fb_no" value="' + feed["fb_no"] + '"></input></div>';

			modalHtml += "</div></div></div></div></div></div>";

			$('body').append(modalHtml).fadeIn(2500);
		}
	}
	else{
		// TODO : 데이터가 없을때 뿌려줄 이미지를 정해야함.
	}
	
	$('body').addClass('noscroll');
}

function initListenerOnDocument() {
	
	$(document).on('input','.comment', function() {
		if($(this).val().trim()=='') {
			$(this).next().css('cursor', 'default').css('font-weight','normal');
			$(this).next().attr('onclick', '');
		}
		else {
			$(this).next().css('cursor', 'pointer').css('font-weight','bold');
			$(this).next().attr('onclick', 'insertComment('+$(this).data('flag')+')');
		}
	});

	$(document).on('click', '.carouselGallery-modal .fa-times-circle', function(e) {
		removeModal();
	});
	
	document.onkeydown = function(evt) {
		evt = evt || window.event;
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


var removeModal = function() {
	$('body').find('.carouselGallery-wrapper').remove();
	$('body').removeClass('noscroll');
	$('body').css('position', 'static');
	$('body').animate({scrollTop: scrollTo}, 0);
};

// Avoid break on small devices
var carouselGalleryScrollMaxHeight = function() {
	if ($('.carouselGallery-scrollbox').length) {
		maxHeight = $(window).height() - 100;
		$('.carouselGallery-scrollbox').css('max-height', maxHeight + 'px');
	}
}

$(window).resize(function() { // set event on resize
	clearTimeout(this.id);
	this.id = setTimeout(carouselGalleryScrollMaxHeight, 100);
});