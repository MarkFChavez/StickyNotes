$(document).ready(function() {

	$(".note").on('mouseover', function() {
		$(".note").css({"opacity":"0.5"});
		$(this).css({"opacity":"1.0"});
		$(this).find('.note-creator').show();
	}).on('mouseout', function() {
		$(".note").css({"opacity":"1.0"});
		$(this).find('.note-creator').hide();
	});

});