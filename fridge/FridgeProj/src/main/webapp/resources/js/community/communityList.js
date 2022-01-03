
var nick = $("input[name=nick]").val();
nick = nick.length == 0 ? "Kil_dong" : nick;
console.log(nick);

$.ajax({
	url: "/community/feeds/" + nick,
	dataType: 'json'
}).done(function(data) {
	printFeed(data);
}).fail(function(req, error) {
	console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
});

$('.comment').on('input', function() {
	console.log(this)
});

function insertComment(flag) {

	var e = $(event.target);
	$.ajax({
		url: "/community/comment/",
		data: { fb_no: e.next().val(), fc_content: e.prev().val(), "nick": nick },
		dataType: 'json',
		type: 'post',
	}).done(function(data) {
		console.log($('ul'));
		console.log(data);
	}).fail(function(req, error) {

		console.log();
		console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
	});

	feeds[e.data('index')][list_f_comment]
	if (flag == 0) {
		$('ul.comments:eq(' + e.data('index') + ') li:eq(2)').remove();
		var commentString = "";
		commentString += '<li><h4 class="pull-left"><a href="#">' + nick + '</a></h4><p>';
		commentString += e.prev().val();
		commentString += '</li>';
		$('ul.comments:eq(' + e.data('index') + ')').prepend(commentString);
		e.prev().val("");
		e.prev().focus();
	}
	else {
		var commentString = "";

		commentString += "<div class='content'><img alt='' src='/upload/profile/" + nick + ".jpg' class='img-circle pull-left'>";
		commentString += "<p><a href='" + "" + "'>" + nick + "</a>" + e.prev().val() + "</p>";
		commentString += "</div>";

		$('div.comments').prepend(commentString);
		e.prev().val("");
		e.prev().focus();
	}
}

function likeProcess() {
	//<i class="fas fa-heart"></i>
	var e = $(event.target);
	
	var flag;
	var index = e.data('index');
	var likeCount = parseInt($('.likeCount:eq(' + index + ')').html());

	console.log(feeds[e.data('index')]);
	
	if (e.hasClass('far')) {
		e.removeClass('far');
		e.addClass('fas');
		$('.likeCount:eq(' +index + ')').html(likeCount + 1);
		feeds[index]['list_f_likeMember'].push(nick);
		flag = 0;
	}
	else {
		e.removeClass('fas');
		e.addClass('far');
		$('.likeCount:eq(' + index + ')').html(likeCount - 1);
		feeds[e.data('index')]['list_f_likeMember'].splice($.inArray(nick, feeds[e.data('index')]['list_f_likeMember']), 1);
		flag = 1;
	}
	console.log(feeds[index]['fb_no']);
	console.log(nick);
	console.log(flag);
	$.ajax({
		url: "/community/like/",
		data: { fb_no: feeds[index]['fb_no'], "nick": nick, "flag":flag },
		dataType: 'json',
		type: 'post',
	}).done(function(data) {
		console.log(data);
	}).fail(function(req, error) {
		console.log();
		console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
	});
	console.log(feeds[e.data('index')]);

}

function likeProcessInModal(){
	console.log(modalData);
	var e = $(event.target);
	var index = e.data('index');
	var mainHeart = $('li i.fa-heart:eq('+index+')');
	console.log(mainHeart);
	var flag;
	var likeCount = parseInt($('.carouselGallery-modal-text .likeCount').html());
	
	console.log(e.data('index'));
	
	if (e.hasClass('far')) {
		e.removeClass('far');
		e.addClass('fas');
		mainHeart.removeClass('far');
		mainHeart.addClass('fas');
		$('.carouselGallery-modal-text .likeCount').html(likeCount + 1);
		$('.likeCount:eq(' + e.data('index') + ')').html(likeCount + 1);
		modalData['list_f_likeMember'].push(nick);
		flag = 0;
	}
	else {
		e.removeClass('fas');
		e.addClass('far');
		mainHeart.removeClass('fas');
		mainHeart.addClass('far');
		$('.carouselGallery-modal-text .likeCount').html(likeCount - 1);
		$('.likeCount:eq(' + e.data('index') + ')').html(likeCount - 1);
		modalData['list_f_likeMember'].splice($.inArray(nick, modalData['list_f_likeMember']), 1);
		flag = 1;
	}
	$.ajax({
		url: "/community/like/",
		data: { fb_no: feeds[index]['fb_no'], "nick": nick, "flag":flag },
		dataType: 'json',
		type: 'post',
	}).done(function(data) {
		console.log(data);
	}).fail(function(req, error) {
		console.log();
		console.log('응답코드:%s,에러 메시지:%s,error:%s', req.status, req.responseText, error);
	});
}


var feeds = Array();

function printFeed(data) {
	console.log("printFeed함수 호출");
	$.each(data, function(i, feed) {
		feeds.push(feed);
		console.log("feed 인덱스: ", feeds.length);

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
		//<i class="fas fa-heart"></i>
		
		var temp = 'far';
		
		console.log('이게 무슨값이니',feed['list_f_likeMember']);
		for(var i = 0; i < feed['list_f_likeMember'].length; i++){
			if(feed['list_f_likeMember'][i]['nick'] === nick){
				temp = 'fas';
				break;	
			}
		}
		
		console.log(temp);
		
		feedString += '<li><a href="javascript:void(0);" onclick="likeProcess()"><i class="'+temp+' fa-heart" data-index="' + (feeds.length - 1) + '"></i></a></li>';
		feedString += '<li><a href="javascript:void(0);" onclick="callModal()"><i class="far fa-clone" data-index="' + (feeds.length - 1) + '"></i></a></li>';
		feedString += '<li class="pull-right"><a href="' + '' + '"><i class="fas fa-bars"></i></a></li></ul></div>';

		feedString += '<div class="legend">';
		feedString += '<h3><a href="' + '' + '"><i class="far fa-heart"></i> 좋아요 <span class="likeCount">' + feed["list_f_likeMember"].length + '</span>개</a></h3>';
		feedString += '<h4 class="pull-left"><a href="' + '' + '">' + '' + '</a></h4>';
		feedString += '<p>' + feed["fb_content"] + '</p></div>';

		feedString += '<ul class="comments list-unstyled">';
		$.each(feed["list_f_comment"], function(i, comment) {
			if (i > 2)
				return;
			console.log("댓글인덱스:", i);

			feedString += '<li><h4 class="pull-left"><a href="#">' + comment["nick"] + '</a></h4><p>';
			feedString += comment["fc_content"];
			feedString += '</li>';

		});

		feedString += '</ul>';

		feedString += '<div class="add-comment">';
		feedString += '<i class="far fa-comments"></i>';
		feedString += '<input type="text" name="comment" class="comment" placeholder="댓글 달기.."></input>';
		feedString += '<p class="pull-right" data-index="' + (feeds.length - 1) + '" onclick="insertComment(0);">게시</p>';
		feedString += '<input type="hidden" name="fb_no" value="' + feed["fb_no"] + '"></input></div>';

		feedString += '</footer></section>';

		$('.feedify').append(feedString);
	});
	console.log(feeds);
}

/*모달관련 js*/

function callModal(what) {
	showModal(feeds[$(event.target).data('index')], $(event.target).data('index'));
}

var modalData;

showModal = function(feed, index) {
	modalData = feed;
	
	console.log("showModal함수");
	console.log(feed);
	console.log(index);
	imagepath = feed["list_fi_src"][0];

	maxHeight = $(window).height() - 100;

	if ($('.carouselGallery-wrapper').length === 0) {
		if (typeof imagepath !== 'undefined') {
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
			modalHtml += "<a href='" + "" + "'><img alt='' src='/upload/profile/" + feed["nick"] + ".jpg' class='img-circle pull-left'><span>" + feed["nick"] + "</a></div>";

			modalHtml += "<div class='body'>";
			modalHtml += "<div class='content'><img alt='" + feed["nick"] + "' src='/upload/profile/" + feed["nick"] + ".jpg' class='img-circle pull-left'>";
			modalHtml += "<p><a href='" + '' + "'>" + feed["nick"] + "</a>" + feed["fb_content"] + "</p></div>";

			modalHtml += "<div class='comments'>";
			$.each(feed["list_f_comment"], function(i, comment) {
				modalHtml += "<div class='content'><img alt='' src='/upload/profile/" + comment["nick"] + ".jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + "" + "'>" + comment["nick"] + "</a>" + comment["fc_content"] + "</p>";
				modalHtml += "</div>";
			});
			modalHtml += "</div></div>";

			modalHtml += "<div class='footer'>";
			modalHtml += "<ul class='list-inline'>"
			console.log(feed['list_f_likeMember']);
			
			var temp = 'far';
		
			console.log('이게 무슨값이니',feed['list_f_likeMember']);
			for(var i = 0; i < feed['list_f_likeMember'].length; i++){
				if(feed['list_f_likeMember'][i]['nick'] === nick){
					temp = 'fas';
					break;	
				}
			}
			
			modalHtml += "<li><a href='javascript:void(0);' onclick='likeProcessInModal()'><i class='"+temp+" fa-heart' data-index='"+index+"'></i></a></li>";
			modalHtml += "<li><a href='#'><i class='far fa-envelope'></i></a></li>";
			modalHtml += "<li class='pull-right'><a href='#'><i class='fas fa-bars'></i></a></li></ul>";

			modalHtml += "<div class='show-like'><a href='#'><i class='far fa-heart'></i> 좋아요 <span class='likeCount'>" + feed["list_f_likeMember"].length + "</span>개</a></div>";

			modalHtml += "<div class='add-comment'>";
			modalHtml += "<i class='far fa-comments'></i>";
			modalHtml += "<input type='text' name='comment' class='comment' placeholder='댓글 달기..'/>";
			modalHtml += "<p class='pull-right' onclick='insertComment();'>게시</p>";
			modalHtml += '<input type="hidden" name="fb_no" value="' + feed["fb_no"] + '"></input></div>';

			modalHtml += "</div></div></div></div></div></div>";

			$('body').append(modalHtml).fadeIn(2500);
		}
	}
};

$('body').on('click', '.carouselGallery-wrapper', function(e) {
	if ($(e.target).hasClass('.carouselGallery-wrapper')) {
		removeModal();
	}
});

$('body').on('click', '.carouselGallery-modal .fa-times-circle',
	function(e) {
		removeModal();
	});

var removeModal = function() {
	$('body').find('.carouselGallery-wrapper').remove();
	$('body').removeClass('noscroll');
	$('body').css('position', 'static');
	$('body').animate({
		scrollTop: scrollTo
	}, 0);
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
	clearTimeout(this.id);
	this.id = setTimeout(carouselGalleryScrollMaxHeight, 100);
});

document.onkeydown = function(evt) {
	evt = evt || window.event;
	if (evt.keyCode == 27) {
		removeModal();
	}
};