$(function() {
	$('#foo1').carouFredSel({
		scroll: 1000
	});

	$('#foo2').carouFredSel({
		scroll	: 1000,
		circular: false,
		infinite: false,
		auto	: false,
		scroll	: {
			items	: 'page'
		},
		prev 	: {	
			button	: '#foo2_prev',
			key		: 'left'
		},
		next 	: { 
			button	: '#foo2_next',
			key		: 'right'
		},
		pagination: '#foo2_pag'
	});
	$('#testimonials').carouFredSel({
		direction	: 'up',
		items		: {
			visible		: 1,
			start		: 'random'
		},
		height		: 250,
		align		: 'center',
		auto		: 5000
	});
});