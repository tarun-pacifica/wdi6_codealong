$(document).ready(function() {
	// parallax effect
	var $hero = $('.hero');
	$(window).on('scroll', function() {
		var scrollTop = $(window).scrollTop();
		var bgPosition = scrollTop * 4;
		if (bgPosition > 0) {
			$hero.css('background-position-y', -bgPosition)
		}
	});

	// bubbles
	if (location.pathname !== '/about') {
		return
	};

	$(window).on('mousemove', function(e) {
		var size = Math.random() * 4;
		var $bubble = $('<div></div>');
		$bubble.addClass('bubble');
		$bubble.css({
			left: e.pageX,
			top: e.pageY,
			width: size + 'em',
			height: size + 'em'
		});

		$bubble.appendTo('body');
		setTimeout(function() {
			$bubble.animate({
				top: '-10em'
			}, 3000, function() {
				$bubble.remove();
			});

		}, 1000);
		console.log(e.pageX, e.pageY)
	})



});