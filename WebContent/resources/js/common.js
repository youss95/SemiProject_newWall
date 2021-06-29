$(function(){
	menuOpen();
	lnbNavOpen();
});

function menuOpen(){
	$(".header .has").on("mouseenter", function(){
		$(".s_menu_bg").addClass("on");
		$(this).children('.s_menu').css('display','flex');
	});
	$(".s_menu_bg").on("mouseleave", function(){
		$(this).removeClass("on");		
		$(".header .has .s_menu").hide();
	});
	$(".header .has .s_menu").on("mouseenter", function(){	
		$(this).css('display','flex');;
	});
	$(".header .has").on("mouseleave", function(){
		$(".s_menu_bg").removeClass("on");		
		$(".header .has .s_menu").hide();
	});
}

function lnbNavOpen(){
	let lnb_link = $(".lnb .depth1");
	lnb_link.on("click", function(){
		$(this).toggleClass("on");
		$(this).children("ul").slideToggle();
		$(this).siblings().removeClass("on");
		$(this).siblings().children("ul").slideUp();
	});

}