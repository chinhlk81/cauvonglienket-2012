﻿$(function() {
	var slide_duration = 1000;
	$('.view_scripts a').click(function() {
		var h = this.hash,
			t = $(this),
			s = $(h).parents('.scripts:first');

		t.parent().find('a').removeClass('selected');
		if ($(h).is(':hidden')) {
			t.addClass('selected');
			s.find('img.punt').show().css('left', $(this).position().left + 30);
		} else {
			s.find('img.punt').hide()
		}
		s.find('div.script:not('+h+')').slideUp(slide_duration);
		$(h).slideToggle(slide_duration);
		return false;
	});
	$('.scripts').prepend('<img class="punt" src="'+siteroot+'images/script_punt.png" alt="" width="30" height="16" />').find('img.punt').hide();
	$('.scripts .head a').click(function() {
		$(this).parents('.scripts:first').find('img.punt').hide()
			.end().find('div.script').slideUp(slide_duration)
			.end().prevAll('.transparent:first').find('.view_scripts a').removeClass('selected');
		return false;
	});
});