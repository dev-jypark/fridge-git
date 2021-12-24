
jQuery(function($) {

	var updateArrows = function() {
		$('.carouselGallery-right').removeClass('disabled');
		$('.carouselGallery-left').removeClass('disabled');
		var curIndex = $('.carouselGallery-carousel.active').data(
			'index');
		updateArrows.nbrOfItems = updateArrows.nbrOfItems
			|| $('.carouselGallery-carousel').length - 1;

		curIndex === updateArrows.nbrOfItems
			&& $('.carouselGallery-right').addClass('disabled');
		curIndex === 0
			&& $('.carouselGallery-left').addClass('disabled');
	}
	/*
	$('.carouselGallery-carousel').on('click', function(e) {
				scrollTo = $('body').scrollTop();
				$('body').addClass('noscroll');
				$('body').css('position', 'fixed');
				$('carouselGallery-carousel')
						.removeClass('active');
				$(this).addClass('active');
				showModal($(this));
				updateArrows();
			});
	 */

	$('.gallery-item-info').on('click', function(e) {
		scrollTo = $('body').scrollTop();
		$('body').addClass('noscroll');
		$('body').css('position', 'fixed');
		$('carouselGallery-carousel').removeClass('active');
		$(this).prev().addClass('active');
		showModal($(this).prev());
		updateArrows();
	});

	$('body')
		.on(
			'click',
			'.carouselGallery-right, .carouselGallery-left',
			function(e) {
				if ($(this).hasClass('disabled'))
					return;
				var curIndex = $(
					'.carouselGallery-carousel.active')
					.data('index');
				var nextItemIndex = parseInt(curIndex + 1);
				if ($(this).hasClass('carouselGallery-left')) {
					nextItemIndex -= 2;
				}
				var nextItem = $('.carouselGallery-carousel[data-index='
					+ nextItemIndex + ']');
				// console.log(nextItemIndex);
				if (nextItem.length > 0) {
					$('.carouselGallery-carousel').removeClass(
						'active');
					$('body').find('.carouselGallery-wrapper')
						.remove();
					showModal($(nextItem.get(0)));
					nextItem.first().addClass('active');
				}
				updateArrows();
			});

	var modalHtml = '';

	showModal = function(that) {
		//   console.log(that);
		var username = that.data('username'), location = that
			.data('location'), imagetext = that.data('imagetext'), likes = that
				.data('likes'), imagepath = that.data('imagepath'), carouselGalleryUrl = that
					.data('url');
		postURL = that.data('posturl');

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
				modalHtml += "<img src='" + imagepath + "' alt='carouselGallery image'>";
				modalHtml += "</div>";

				modalHtml += "<div class='carouselGallery-modal-text'>";

				modalHtml += "<div class='header'><a href='" + postURL + "'><img alt='' src='../img/user-1.jpg' class='img-circle pull-left'><span>"+ username + "</a></div>";

				modalHtml += "<div class='body'>";

				modalHtml += "<div class='content'><img alt='' src='../img/user-1.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + username
					+ "</a>" + imagetext + "</p>";
				modalHtml += "</div>";

				modalHtml += "<div class='content'><img alt='' src='../img/user-2.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>"
					+ "test1234235" + "</a>아하하 댓글 1번입니다 아아하ㅏ</p>";
				modalHtml += "</div>";

				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";
				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";
				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";
				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";
				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";
				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";
				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";
				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";
				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";
				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";
				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";
				modalHtml += "<div class='content'><img alt='' src='../img/user-3.jpg' class='img-circle pull-left'>";
				modalHtml += "<p><a href='" + postURL + "'>" + "wow1234"
					+ "</a>아하하하 댓글 2번입니다아아아아</p>";
				modalHtml += "</div>";

				modalHtml += "</div>";

				modalHtml += "<div class='footer'>";
				modalHtml += "<ul class='list-inline'>"
				modalHtml += "<li><a href='#'><i class='far fa-heart'></i></a></li>";
				modalHtml += "<li><a href='#'><i class='far fa-envelope'></i></a></li>";
				modalHtml += "<li class='pull-right'><a href='#'><i class='fas fa-bars'></i></a></li></ul>";

				modalHtml += "<div class='show-like'><a href='#'><i class='far fa-heart'></i> 좋아요 51개</a></div>";

				modalHtml += "<div class='add-comment'>";
				modalHtml += "<form action=''>";
				modalHtml += "<i class='far fa-comments'></i>";
				modalHtml += "<input type='text' name='comment' class='comment' placeholder='댓글 달기..'/>";
				modalHtml += "<p class='pull-right'>게시</p>";
				modalHtml += "</form></div>";

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

});