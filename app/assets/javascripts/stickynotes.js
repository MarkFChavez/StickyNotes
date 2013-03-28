$(document).ready(function() {

	$("#toggle-form").on('click', function(e) {
		e.preventDefault();
		$("#create-note form").find("input[type=text]").val('');
		$("#create-note form").find("textarea").val('');
		$(".validation-errors").hide();
		$("#create-note").toggle();
	});

	$(".note").on('mouseover', function() {
		$(".note").css({"opacity":"0.5"});
		$(this).css({"opacity":"1.0"});
		$(this).find('.note-creator').show();
	}).on('mouseout', function() {
		$(".note").css({"opacity":"1.0"});
		$(this).find('.note-creator').hide();
	});

	$("textarea").wysihtml5();

});