$(document).ready(function() {
	var $hero = $('.hero');
	$(window).on('scroll', function() {
		var scrollTop = $(window).scrollTop();
		var bgPosition = scrollTop * 4;
		if (bgPosition > 0) {
			$hero.css('background-position-y', -bgPosition)
		}
	})
});