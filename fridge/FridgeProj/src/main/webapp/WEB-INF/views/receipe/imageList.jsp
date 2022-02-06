<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
	<!-- UIkit JS --> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.2.0/js/uikit.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.2.0/js/uikit-icons.min.js"></script> 

	<!-- google code-prettify --> 
	<script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script> 
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/google/code-prettify@master/styles/sunburst.css"> 
	<!-- jQuery throttle-debounce --> 
	<script src="https://cdn.jsdelivr.net/gh/cowboy/jquery-throttle-debounce/jquery.ba-throttle-debounce.js" defer></script> 
	<!-- sanitize.css --> 
	<link href="https://unpkg.com/sanitize.css" rel="stylesheet">
	
	<!-- css(외부라이브러리) -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
	<!-- 내가만든 css,js -->
	<link rel="stylesheet" type="text/css"
		href="../resources/css/fridgelist/fridgelist.css" />
	<script src="../resources/js/fridgelist/fridgelist.js"></script>
	<!-- js(외부라이브러리) -->
	<script src="http://momentjs.com/downloads/moment-timezone-with-data.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
	</head>
<body>

	 
	 
<!-- <script type="text/javascript"> 
 
$(document).ready(function(){ 
	$("#input").cropzee(); 
    $.each($("input[name='enable']"), function(){ 
   		if ($(this).is(":checked")) { 
   			$(this).closest("div.uk-position-relative").find("textarea").removeAttr("disabled"); 
   		} else { 
    		$(this).closest("div.uk-position-relative").find("textarea").attr("disabled", "disabled"); 
    	} 
    }); 
    $("input, select, textarea").on( "keyup change", $.debounce(300, function() { 
    	destroyPlugin($("#input")); 
	    $.each($("input[name='enable']"), function(){ 
	   		if ($(this).is(":checked")) { 
	   			$(this).closest("div.uk-position-relative").find("textarea").removeAttr("disabled"); 
	   		} else { 
	    		$(this).closest("div.uk-position-relative").find("textarea").attr("disabled", "disabled"); 
	    	} 
        }); 
	    var aspectRatio = ""; 
	    $.each($("input[name='aspectRatio']"), function(){ 
            aspectRatio += $(this).val(); 
        }); 
	    var maxSize = []; 
	    $.each($("input[name='maxSize'], select[name='maxSize']"), function(){ 
            maxSize.push($(this).val()); 
        }); 
        var minSize = []; 
	    $.each($("input[name='minSize'], select[name='minSize']"), function(){ 
            minSize.push($(this).val()); 
        }); 
        var startSize = []; 
	    $.each($("input[name='startSize'], select[name='startSize']"), function(){ 
            startSize.push($(this).val()); 
        }); 
	    var allowedInputs = []; 
        $.each($("input[name='allowedInputs']:checked"), function(){ 
            allowedInputs.push($(this).val()); 
        }); 
        var imageExtension = ""; 
        $.each($("input[name='imageExtension']:checked"), function(){ 
            imageExtension += $(this).val(); 
        }); 
        var returnImageMode = ""; 
        $.each($("input[name='returnImageMode']:checked"), function(){ 
            returnImageMode += $(this).val(); 
        }); 
        var modalAnimation = ""; 
        $.each($("select[name='modalAnimation']"), function(){ 
            modalAnimation += $(this).val(); 
        }); 
        var onCropStart = null; 
        $.each($("textarea[name='onCropStart']"), function(){ 
        	if (!$(this).is(":disabled")) { 
        		onCropStart = $(this).val(); 
        	} 
        }); 
        var onCropMove = null; 
        $.each($("textarea[name='onCropMove']"), function(){ 
            if (!$(this).is(":disabled")) { 
                onCropMove = $(this).val(); 
            } 
        }); 
        var onCropEnd = null; 
        $.each($("textarea[name='onCropEnd']"), function(){ 
            if (!$(this).is(":disabled")) { 
                onCropEnd = $(this).val(); 
            } 
        }); 
        var onInitialize = null; 
        $.each($("textarea[name='onInitialize']"), function(){ 
        	if (!$(this).is(":disabled")) { 
                onInitialize = $(this).val(); 
            } 
        }); 
        window.options = { 
        	aspectRatio: aspectRatio, 
	        maxSize: maxSize, 
	        minSize: minSize, 
	        startSize: startSize, 
	        onCropStart: onCropStart, 
	        onCropMove: onCropMove, 
	        onCropEnd: onCropEnd, 
	        onInitialize: onInitialize, 
	        modalAnimation: modalAnimation, 
	        allowedInputs: allowedInputs, 
	        imageExtension: imageExtension, 
	        returnImageMode: returnImageMode, 
        } 
	    // alert(JSON.stringify(options));	 
	    $("#input").cropzee(options); 
	})); 
}); 
	var destroyPlugin = function($elem, eventNamespace) { 
		var isInstantiated  = !! $.data($elem.get(0)); 
		if (isInstantiated) { 
			$.removeData($elem.get(0)); 
			$elem.off(eventNamespace); 
			$elem.unbind('.' + eventNamespace); 
		} 
	}; 
	 
</script> -->
<form action="<c:url value="/receipe/reciptList.do"/>" method="post" enctype="multipart/form-data" > 
	<!-- 상단구역 시작 -->
	<section class="sectionedit"></section>
	<!-- 상단구역 끝 -->
	<!-- 내용 시작 -->
	<div class="commerce-cart-wrap">
		<div class="commerce-cart row">
			<!-- 추가등록 시작 -->
			<div class="commerce-cart__content">
				<div data-sticky-enabled="false" data-sticky-disabled="false"
					data-sticky-always="false" data-sticky-ignore="false"
					data-direction="top" data-offset="0"
					class="sticky-container commerce-cart__header-wrap"
					style="position: sticky; top: 0px;">
					<div class="sticky-child commerce-cart__header"
						style="position: relative;">
						<!-- 재료 추가 등록 -->
						<!-- <span class="commerce-cart__header__right"> 
						<input type="button" class="addform"
							value="+ 추가등록">
						</span> -->
						<div class="commerce-cart__header__right">
							<div class="button">
								<label for="input" class="image-previewer" data-cropzee="input" style="cursor:pointer;font-size:1em;"> CLICK HERE!</label> 
							</div>	
							<input id="input" name="imgsrc" type="file" accept="image/*" onchange="readURL(this);" style="display: none;"> 
						</div>
					</div>
				</div>
				<!-- 추가등록 끝 -->
				<ul class="commerce-cart__content__group-list ">
					<li class="commerce-cart__content__group-item">
						<article class="commerce-cart__group">
							<h1 class="commerce-cart__group__header">영수증으로 등록하기</h1>
							<ul class="commerce-cart__group__item-list">
								<li class="commerce-cart__group__item">

									<section class="commerce-cart__delivery-group-copy"
										id="important_content">
										<ul class="commerce-cart__delivery-group__product-list">
											<li class="commerce-cart__delivery-group__product-item" id="hereDouble">
												<!-- 여러개입력하기 -->
												
													
												<section class="carted-product-image">
													<!-- nick -->
													<input type="hidden" name="nick" value="${nick}">
													<!-- 사진입력 버튼 -->

													<div class="imgpreview">
														<img class="imgpreview_size" id="preview"/>
													</div>
												</section>
											</li>
										</ul>
									</section> 
								</li>
								<!-- 취소 & 확인 --> 
								<footer class="commerce-cart__delivery-group__footer">
										<div class="okCancle">
											<button type="button" class="btn btn-default" onclick="location.href ='/app/fridge/fridgeList.do';">취소</button>
											<input type="submit" class="btn btn-default" style="background-color: #c3eee6; color: white;" value="입력" />
										</div>
									</footer>
							</ul>
						</article>
					</li>
				</ul>
			</div>
		</div>
	</div>
</form> 
 
<script>
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}
</script> 
