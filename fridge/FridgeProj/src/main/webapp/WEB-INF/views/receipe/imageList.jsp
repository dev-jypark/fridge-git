<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- UIkit CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.2.0/css/uikit.min.css">
	<!-- UIkit JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.2.0/js/uikit.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.2.0/js/uikit-icons.min.js"></script>
	<!-- cropzee.js -->
	<script src="https://cdn.jsdelivr.net/gh/BossBele/cropzee@v2.0/dist/cropzee.js" defer></script>
	<!-- google code-prettify -->
	<script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/google/code-prettify@master/styles/sunburst.css">
	<!-- fonts -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Reenie+Beanie">
	<!-- jQuery throttle-debounce -->
	<script src="https://cdn.jsdelivr.net/gh/cowboy/jquery-throttle-debounce/jquery.ba-throttle-debounce.js" defer></script>
	<!-- sanitize.css -->
	<link href="https://unpkg.com/sanitize.css" rel="stylesheet">
	
<input type="hidden" name="nick" value="${nick }">
<script type="text/javascript">

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
	
	</script>
<div class="container">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<fieldset>
				<legend>영수증사진입력</legend>
				<form action="<c:url value="/receipe/reciptList.do"/>" method="post" enctype="multipart/form-data" >
					<div>
					<input type="text" name="nick" size="50""/>
					</div>
					<div>
						<label for="input" class="image-previewer" data-cropzee="input"></label>
						<input id="input" name="imgsrc" type="file" accept="image/*">
						<button onclick="alert(cropzeeGetImage('input'))">Get Image (as blob / data-url)</button>
					</div>
					<div>
					<input type="submit" value="영수증입력" />
					<input type="button" id="btn1" value="영수증입력" />
					</div>
				</form>
			</fieldset>
		</div>
	</div>
</div>
<script>
$('#btn1').on('click', function(){
    var form = {
            name: "jamong",
            age: 23
    }
    $.ajax({
        url: " /receipe/reciptList.do",
        type: "POST",
        data: JSON.stringify(form),
        contentType: "application/json; charset=utf-8;",
        dataType: "json",
        success: function(data){
            for(var i=0; i<data.length; i++){
                $('#result').append(data[i] + "<br>");
            }
        },
        error: function(){
            alert("restController err");
        }
    });
});
</script>
  