//////////////// Modern Style ////////////////////

// left slider
jQuery.fn.leftSlideStyle = function(backcolor, buttonText){

    var element = $(this);

    var boxHeight = $(element).height();
    var boxWidth = $(element).width();

    $(this).append("<div class='box-container-left-style' style='height:"+ boxHeight +"px; width: "+ boxWidth +"px; background:"+ backcolor +"'><button class='btn-style' onclick='recipe1()'>"+ buttonText +"</button><div>");

    $(this).css({"position": "relative", "overflow": "hidden"});

    $(this).mouseenter(function(e){
        e.preventDefault();
            $(".box-container-left-style").css({"right": 0});
    });

    $(this).mouseleave(function(e){
        e.preventDefault();
            $(".box-container-left-style").css({"right": 100 + "%"});
    });
};

// down slider
jQuery.fn.downSlideStyle = function(backcolor,buttonText){

    var element = $(this);

    var boxHeight = $(element).height();
    var boxWidth = $(element).width();

    $(this).append("<div class='box-container-down-style' style='height:"+ boxHeight +"px; width: "+ boxWidth +"px; background:"+ backcolor +"'><button class='btn-style' onclick='recipe2()'>"+ buttonText +"</button><div>");

    $(this).css({"position": "relative", "overflow": "hidden"});

    $(this).mouseenter(function(e){
        e.preventDefault();
            $(".box-container-down-style").css({"bottom": 0});
    });

    $(this).mouseleave(function(e){
        e.preventDefault();
            $(".box-container-down-style").css({"bottom": 100 + "%"});
    });
};

// right slider
jQuery.fn.rightSlideStyle = function(backcolor,buttonText){

    var element = $(this);

    var boxHeight = $(element).height();
    var boxWidth = $(element).width();

    $(this).css({"position": "relative", "overflow": "hidden"});

    $(this).append("<div class='box-container-right-style' style='height:"+ boxHeight +"px; width: "+ boxWidth +"px; background:"+ backcolor +"'><button class='btn-style' onclick='recipe3()'>"+ buttonText +"</button><div>");

    $(this).mouseenter(function(e){
        e.preventDefault();
            $(".box-container-right-style").css({"left": 0});
    });

    $(this).mouseleave(function(e){
        e.preventDefault();
            $(".box-container-right-style").css({"left": 100+"%"});
    });
};

// bottom slider
jQuery.fn.upSlideStyle = function(backcolor,buttonText){

    var element = $(this);

    var boxHeight = $(element).height();
    var boxWidth = $(element).width();

    $(this).css({"position": "relative","overflow": "hidden"});

    $(this).append("<div class='box-container-up-style' style='height:"+ boxHeight +"px; width: "+ boxWidth +"px; background:"+ backcolor +"'><button class='btn-style' onclick='recipe4()'>"+ buttonText +"</button><div>");
    $(this).mouseenter(function(e){
        e.preventDefault();
            $(".box-container-up-style").css({"top": 0,"background-size": 200+"%"});
    });

    $(this).mouseleave(function(e){
        e.preventDefault();
            $(".box-container-up-style").css({"top": 100+"%"});
    });
    
};

// 함수로 주소를 지정하여서 위에 append 부분에 넣으면 이동이됩니다.
function recipe1(){
    location.href="http://localhost:9080/recipedetailOne.do";
}
function recipe2(){
    location.href="http://localhost:9080/recipedetailTwo.do";
}
function recipe3(){
    location.href="http://localhost:9080/recipedetailThr.do";
}
function recipe4(){
    location.href="http://localhost:9080/recipedetailFou.do";
}
