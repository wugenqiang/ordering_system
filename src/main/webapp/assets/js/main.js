(function ($) {
	"use strict";

	
	/*----------  Menu sticky and scrol top  ----------*/

	var windows = $(window);
	var screenSize = windows.width();
	var sticky = $('.header-sticky');
	var menubarTop = $('.navigation-menu-top');
	var headerTop = $('.header-top');


	windows.on('scroll', function () {
		var scroll = windows.scrollTop();


		if (screenSize >= 991) {
			if (scroll < 300) {
				sticky.removeClass('is-sticky');

				menubarTop.removeClass('d-none');
				menubarTop.addClass('d-block');
				headerTop.removeClass('d-none');
				headerTop.addClass('d-block');
			} else {
				sticky.addClass('is-sticky');
				menubarTop.addClass('d-none');
				menubarTop.removeClass('d-block');
				headerTop.addClass('d-none');
				headerTop.removeClass('d-block');
			}
		}




		//code for scroll top

		if (scroll >= 400) {
			$('.scroll-top').fadeIn();
		} else {
			$('.scroll-top').fadeOut();
		}

	});




	/*---------- Scroll to top  ----------*/

	$('.scroll-top').on('click', function () {
		$('html,body').animate({
			scrollTop: 0
		}, 2000);
	});


	
	

	/*----------  currency and language dropdown  ----------*/

	$("#changeCurrency").on("click", function (event) {
		event.stopPropagation();
		$("#currencyList").slideToggle();
		$("#languageList, #accountList").slideUp("slow");
	});

	$("#changeLanguage").on("click", function (event) {
		event.stopPropagation();
		$("#languageList").slideToggle();
		$("#currencyList, #accountList").slideUp("slow");
	});

	$("#changeAccount").on("click", function (event) {
		event.stopPropagation();
		$("#accountList").slideToggle();
		$("#currencyList, #languageList").slideUp("slow");
	});

	$("#settings-icon").on("click", function (event) {
		event.stopPropagation();
		$("#languageList").slideToggle();
		$("#accountList").slideUp("slow");
		$("#cart-floating-box").slideUp("slow");
		
	});

	$("#user-icon").on("click", function (event) {
		event.stopPropagation();
		$("#accountList").slideToggle();
		$("#languageList").slideUp("slow");
		$("#cart-floating-box").slideUp("slow");
	});

	$("body:not(#changeLanguage)").on("click", function () {
		$("#languageList").slideUp("slow");
	});
	$("body:not(#changeCurrency)").on("click", function () {
		$("#currencyList").slideUp("slow");
	});
	$("body:not(#changeAccount)").on("click", function () {
		$("#accountList").slideUp("slow");
	});
	$("body:not(#settings-icon)").on("click", function () {
		$("#accountList").slideUp("slow");
	});
	$("body:not(#user-icon)").on("click", function () {
		$("#accountList").slideUp("slow");
	});

	/*----------    cart minibox toggle  ----------*/

	$("#cart-icon").on("click", function (event) {
		event.stopPropagation();
		$("#cart-floating-box").slideToggle();
		$("#accountList").slideUp("slow");
		$("#languageList").slideUp("slow");

	});

	$("body:not(#cart-icon)").on("click", function () {
		$("#cart-floating-box").slideUp("slow");
	});

	
	/*----------    Category menu  ----------*/


	/*-- Variables --*/
	var categoryToggleWrap = $('.category-toggle-wrap');
	var categoryToggle = $('.category-toggle');
	var categoryMenu = $('.category-menu');


	/*
	 *  Category Menu Default Close for Mobile & Tablet Device
	 *  And Open for Desktop Device and Above
	 */
	function categoryMenuToggle() {
		var screenSize = windows.width();
		if (screenSize >= 0) {
			categoryMenu.slideUp();
		} else {
			categoryMenu.slideDown();
		}

		
	}

	/*-- Category Menu Toggles --*/
	function categorySubMenuToggle() {
		var screenSize = windows.width();
		if (screenSize <= 991) {
			$('.category-menu .menu-item-has-children > a').prepend('<i class="expand menu-expand"></i>');
			$('.category-menu .menu-item-has-children ul').slideUp();
			//        $('.category-menu .menu-item-has-children i').on('click', function(e){
			//            e.preventDefault();
			//            $(this).toggleClass('expand');
			//            $(this).siblings('ul').css('transition', 'none').slideToggle();
			//        })
		} else {
			$('.category-menu .menu-item-has-children > a i').remove();
			$('.category-menu .menu-item-has-children ul').slideDown();
		}
	}
	categoryMenuToggle();
	windows.resize(categoryMenuToggle);
	categorySubMenuToggle();
	windows.resize(categorySubMenuToggle);

	categoryToggle.on('click', function () {
		categoryMenu.slideToggle();
	});

	/*-- Category Sub Menu --*/
	$('.category-menu').on('click', 'li a, li a .menu-expand', function (e) {
		var $a = $(this).hasClass('menu-expand') ? $(this).parent() : $(this);
		if ($a.parent().hasClass('menu-item-has-children')) {
			if ($a.attr('href') === '#' || $(this).hasClass('menu-expand')) {
				if ($a.siblings('ul:visible').length > 0) $a.siblings('ul').slideUp();
				else {
					$(this).parents('li').siblings('li').find('ul:visible').slideUp();
					$a.siblings('ul').slideDown();
				}
			}
		}
		if ($(this).hasClass('menu-expand') || $a.attr('href') === '#') {
			e.preventDefault();
			return false;
		}
	});

	/*-- Sidebar Category --*/
	var categoryChildren = $('.sidebar-category li .children');

	categoryChildren.slideUp();
	categoryChildren.parents('li').addClass('has-children');

	$('.sidebar-category').on('click', 'li.has-children > a', function (e) {

		if ($(this).parent().hasClass('has-children')) {
			if ($(this).siblings('ul:visible').length > 0) $(this).siblings('ul').slideUp();
			else {
				$(this).parents('li').siblings('li').find('ul:visible').slideUp();
				$(this).siblings('ul').slideDown();
			}
		}
		if ($(this).attr('href') === '#') {
			e.preventDefault();
			return false;
		}
	});



	/*----------  Category more toggle  ----------*/

	$(".category-menu li.hidden").hide();
	$("#more-btn").on('click', function (e) {

		e.preventDefault();
		$(".category-menu li.hidden").toggle(500);
		var htmlAfter = '... Less';
		var htmlBefore = '... More';


		if ($(this).html() == htmlBefore) {
			$(this).html(htmlAfter);
		} else {
			$(this).html(htmlBefore);
		}
	});





	/*----------   Mean menu active  ----------*/

	var mainMenuNav = $('.main-menu nav');
	mainMenuNav.meanmenu({
		meanScreenWidth: '991',
		meanMenuContainer: '.mobile-menu',
		meanMenuClose: '<span class="mean-menu-text">MENU</span> <span class="menu-close"></span>',
		meanMenuOpen: '<span class="mean-menu-text">MENU</span> <span class="menu-bar"></span>',
		meanRevealPosition: 'right',
		meanMenuCloseSize: '0',
	});


	/*----------   Mailchimp  ----------*/
	$('#mc-form').ajaxChimp({
		language: 'en',
		callback: mailChimpResponse,
		// ADD YOUR MAILCHIMP URL BELOW HERE!
		url: 'http://devitems.us11.list-manage.com/subscribe/post?u=6bbb9b6f5827bd842d9640c82&amp;id=05d85f18ef'

	});

	function mailChimpResponse(resp) {

		if (resp.result === 'success') {
			$('.mailchimp-success').html('' + resp.msg).fadeIn(900);
			$('.mailchimp-error').fadeOut(400);

		} else if (resp.result === 'error') {
			$('.mailchimp-error').html('' + resp.msg).fadeIn(900);
		}
	}


	/*----------   Quantity Counter  ----------*/

	$('.pro-qty').append('<a href="#" class="inc qty-btn">+</a>');
	$('.pro-qty').append('<a href="#" class= "dec qty-btn">-</a>');
	$('.qty-btn').on('click', function (e) {
		e.preventDefault();
		var $button = $(this);
		var oldValue = $button.parent().find('input').val();
		if ($button.hasClass('inc')) {
			var newVal = parseFloat(oldValue) + 1;
		} else {
			// Don't allow decrementing below zero
			if (oldValue > 0) {
				var newVal = parseFloat(oldValue) - 1;
			} else {
				newVal = 0;
			}
		}
		$button.parent().find('input').val(newVal);
	});


	/*----------   Nice Select  ----------*/

	$('.nice-select').niceSelect();

	/*----------   Payment method select  ----------*/

	$('[name="payment-method"]').on('click', function () {

		var $value = $(this).attr('value');

		$('.single-method p').slideUp();
		$('[data-method="' + $value + '"]').slideDown();

	});



	/*----------   Shipping form toggle  ----------*/

	$('[data-shipping]').on('click', function () {
		if ($('[data-shipping]:checked').length > 0) {
			$('#shipping-form').slideDown();
		} else {
			$('#shipping-form').slideUp();
		}
	});

	/*----------   search overlay  ----------*/

	$('#search-overlay-active-button').on('click', function(e){
		e.preventDefault();
		$('#search-overlay').fadeIn();
	});	

	$('#search-overlay-close').on('click', function(e){
		e.preventDefault();
		$('#search-overlay').fadeOut();
	});

	/*----------   Brand logo slider   ----------*/


	$('.brand-logo-slider-container').each(function () {
		var $this = $(this);
		var $row = $this.attr("data-row") ? parseInt($this.attr("data-row"), 10) : 1;
		$this.slick({
			infinite: true,
			arrows: false,
			dots: false,
			slidesToShow: 5,
			slidesToScroll: 1,
			speed: 900,
			autoplay: true,
			rows: $row,
			prevArrow: '<button class="slick-prev"><i class="lnr lnr-chevron-left"></i></button>',
			nextArrow: '<button class="slick-next"><i class="lnr lnr-chevron-right"></i></button>',
			responsive: [{
				breakpoint: 1499,
				settings: {
					slidesToShow: 5,
				}
			},
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 5,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 4,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 575,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 479,
				settings: {
					slidesToShow: 1,
				}
			}
		]
		});
	});

	/*----------  Hero slider active  ----------*/

	var heroSlider = $('.hero-slider, .slider-style-2, .slider-style-3');
	heroSlider.slick({
		arrows: true,
		autoplay: true,
		autoplaySpeed: 7000,
		dots: false,
		pauseOnFocus: false,
		pauseOnHover: false,
		fade: true,
		infinite: true,
		slidesToShow: 1,
		prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-chevron-left"></i></button>',
		nextArrow: '<button type="button" class="slick-next"><i class="fa fa-chevron-right"></i></button>',
		responsive: [{
			breakpoint: 1499,
			settings: {
				slidesToShow: 1,
			}
		},
		{
			breakpoint: 1199,
			settings: {
				slidesToShow: 1,
			}
		},
		{
			breakpoint: 991,
			settings: {
				slidesToShow: 1,
			}
		},
		{
			breakpoint: 767,
			settings: {
				slidesToShow: 1,
				dots: true
			}
		},
		{
			breakpoint: 575,
			settings: {
				slidesToShow: 1,
				dots: true
			}
		},
		{
			breakpoint: 479,
			settings: {
				slidesToShow: 1,
				dots: true
			}
		}
	]
	});

	
	/*----------  tab product slider  ----------*/
	
	$('.tab-product-slider').each(function () {
		var $this = $(this);
		var $row = $this.attr("data-row") ? parseInt($this.attr("data-row"), 10) : 1;
		$this.slick({
			infinite: true,
			arrows: true,
			dots: false,
			slidesToShow: 5,
			slidesToScroll: 1,
			autoplay: false,
			rows: $row,
			prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
			nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
			responsive: [{
				breakpoint: 1499,
				settings: {
					slidesToShow: 5,
				}
			},
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 4,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 575,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 479,
				settings: {
					slidesToShow: 1,
				}
			}
		]
		});
	});

	
	/*----------  banner slider  ----------*/
	
	$('.banner-slider').each(function () {
		var $this = $(this);
		var $row = $this.attr("data-row") ? parseInt($this.attr("data-row"), 10) : 1;
		$this.slick({
			infinite: true,
			arrows: true,
			dots: false,
			slidesToShow: 4,
			slidesToScroll: 1,
			autoplay: false,
			rows: $row,
			prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
			nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
			responsive: [{
				breakpoint: 1499,
				settings: {
					slidesToShow: 4,
				}
			},
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 575,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 479,
				settings: {
					slidesToShow: 1,
				}
			}
		]
		});
	});
	
	/*----------  vertical banner slider  ----------*/
	
	$('.vertical-banner-slider').each(function () {
		var $this = $(this);
		var $row = $this.attr("data-row") ? parseInt($this.attr("data-row"), 10) : 1;
		$this.slick({
			infinite: true,
			arrows: true,
			dots: false,
			slidesToShow: 3,
			slidesToScroll: 1,
			autoplay: false,
			rows: $row,
			prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
			nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
			responsive: [{
				breakpoint: 1499,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 1,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 575,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 479,
				settings: {
					slidesToShow: 1,
				}
			}
		]
		});
	});


	
	/*----------  blog post slider  ----------*/
	
	$('.blog-post-slider-container').each(function () {
		var $this = $(this);
		var $row = $this.attr("data-row") ? parseInt($this.attr("data-row"), 10) : 1;
		$this.slick({
			infinite: true,
			arrows: true,
			dots: false,
			slidesToShow: 3,
			slidesToScroll: 1,
			autoplay: false,
			rows: $row,
			prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
			nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
			responsive: [{
				breakpoint: 1499,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 1,
				}
			},
			{
				breakpoint: 575,
				settings: {
					slidesToShow: 1,
				}
			},
			{
				breakpoint: 479,
				settings: {
					slidesToShow: 1,
				}
			}
		]
		});
	});


	
	/*----------  featured category slider  ----------*/
	
	$('.featured-category-slider').each(function () {
		var $this = $(this);
		var $row = $this.attr("data-row") ? parseInt($this.attr("data-row"), 10) : 1;
		$this.slick({
			infinite: true,
			arrows: false,
			dots: false,
			slidesToShow: 7,
			slidesToScroll: 1,
			autoplay: false,
			rows: $row,
			prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
			nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
			responsive: [{
				breakpoint: 1499,
				settings: {
					slidesToShow: 7,
				}
			},
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 6,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 5,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 4,
				}
			},
			{
				breakpoint: 575,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 479,
				settings: {
					slidesToShow: 2,
				}
			}
		]
		});
	});


	
	
	/*----------  instagram image slider  ----------*/


	// User Changeable Access
	var activeId = $("#instafeed"),
	myTemplate = '<div class="instagram-item"><a href="{{link}}" target="_blank" id="{{id}}"><img src="{{image}}" /></a></div>';

	if (activeId.length) {
		var userID = activeId.attr('data-userid'),
			accessTokenID = activeId.attr('data-accesstoken'),

			userFeed = new Instafeed({
				get: 'user',
				userId: userID,
				accessToken: accessTokenID,
				resolution: 'standard_resolution',
				template: myTemplate,
				sortBy: 'least-recent',
				limit: 15,
				links: false
			});
		userFeed.run();
	}
	
			
	jQuery(window).on('load', function () {
		var instagramFeed = $(".instagram-carousel");
		instagramFeed.slick({
			slidesToShow: 10,
			slidesToScroll: 1,
			autoplay: false,
			dots: false,
			arrows: false,
			prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
			nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
			responsive: [{
				breakpoint: 1499,
				settings: {
					slidesToShow: 10,
				}
			},
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 8,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 6,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 4,
				}
			},
			{
				breakpoint: 575,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 479,
				settings: {
					slidesToShow: 2,
				}
			}
		]
		})
	});


	/*----------  product tabstyle three image gallery  ----------*/
	
	$('.fl3-small-image-slider, .quickview-small-image-slider').slick({
		prevArrow: '<i class="fa fa-angle-left slick-prev"></i>',
		nextArrow: '<i class="fa fa-angle-right slick-next"></i>',
		arrows: true,
		dots: false,
		slidesToShow: 4,
		responsive: [
			{
				breakpoint: 1499,
				settings: {
					slidesToShow: 4,
				}
			},
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 3,
					arrows: false
				}
			},
			{
				breakpoint: 575,
				settings: {
					slidesToShow: 3,
					arrows: false
				}
			},
			{
				breakpoint: 479,
				settings: {
					slidesToShow: 2,
					arrows: false
				}
			}
		]
	});

	/*----------  Product tabstyle image gallery active  ----------*/

	$('.pts-small-image-slider').slick({
		prevArrow: '<i class="fa fa-angle-up slick-prev"></i>',
		nextArrow: '<i class="fa fa-angle-down slick-next"></i>',
		slidesToShow: 3,
		vertical: true,
		infinite: true,
		responsive: [
			{
				breakpoint: 1499,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 575,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 479,
				settings: {
					prevArrow: '<i class="fa fa-angle-left slick-prev"></i>',
					nextArrow: '<i class="fa fa-angle-right slick-next"></i>',
					vertical:false,
					slidesToShow: 2,
					arrows: false
				}
			}
		]
	});
	



	$('.modal').on('shown.bs.modal', function (e) {
		$('.small-image-slider').resize();
		$('.small-image-slider').slick('setPosition');
		
	})

	$('.small-image-slider a').on('click', function (e) {
		e.preventDefault();

		var $thisParent = $(this).closest('.product-image-slider');
		var $href = $(this).attr('href');
		$thisParent.find('.small-image-slider a').removeClass('active');
		$(this).addClass('active');

		$thisParent.find('.product-large-image-list .tab-pane').removeClass('active show');
		$thisParent.find('.product-large-image-list ' + $href).addClass('active show');

	});


	
	/*----------  paraxify active  ----------*/
	
	var parallaxActive = '.section-bg-1', myParaxify;
	if (parallaxActive.length) {
		myParaxify = paraxify(parallaxActive, {
			speed: 5,
			boost: 1
		});
	}

	
	/*----------  magnific popup  ----------*/
	
	var imagePopup = $('.big-image-popup');
	imagePopup.magnificPopup({
		type: 'image',
		gallery: {
			enabled: true
		}
	});

	/*----------  sticky sidebar   ----------*/


	$('.single-product-details-sticky').stickySidebar({
		topSpacing: 90,
		bottomSpacing: -90,
		minWidth: 768
		});
	 /*----------  single product image slider  ----------*/
	  
	  
	 $('.single-product-image-gallery-slider').each(function () {
		var $this = $(this);
		var $row = $this.attr("data-row") ? parseInt($this.attr("data-row"), 10) : 1;
		$this.slick({
			infinite: true,
			arrows: true,
			dots: false,
			slidesToShow: 3,
			slidesToScroll: 1,
			rows: $row,
			prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
			nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
			responsive: [
			{
				breakpoint: 1499,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 1199,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 3,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 575,
				settings: {
					slidesToShow: 2,
				}
			},
			{
				breakpoint: 479,
				settings: {
					slidesToShow: 1,
				}
			}
		]
		});
	});


	
	/*----------  price range  ----------*/
	
	$('#price-range').slider({
		range: true,
		min: 0,
		max: 2000,
		values: [ 25, 970 ],
		slide: function( event, ui ) {
			$('#price-amount').val( 'Price: ' + '$' + ui.values[ 0 ] + ' - $' + ui.values[ 1 ] );
		}
	});
	$('#price-amount').val( 'Price: ' + '$' + $('#price-range').slider( 'values', 0 ) +
		' - $' + $('#price-range').slider('values', 1 ) ); 


	
	/*----------  product view mode  ----------*/
	
	$('.view-mode-icons a').on('click', function (e) {
		e.preventDefault();

		var shopProductWrap = $('.shop-product-wrap');
		var viewMode = $(this).data('target');

		$('.view-mode-icons a').removeClass('active');
		$(this).addClass('active');
		shopProductWrap.removeClass('grid list').addClass(viewMode);
	});


		/*----------  blog image gallery slider  ----------*/
	
		var blogPostSlider = $('.blog-image-gallery');
		blogPostSlider.slick({
			prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-chevron-left"></i></button>',
			nextArrow: '<button type="button" class="slick-next"><i class="fa fa-chevron-right"></i></button>',
			arrows: true,
			autoplay: true,
			autoplaySpeed: 4000,
			dots: false,
			pauseOnFocus: false,
			pauseOnHover: false,
			infinite: true,
			slidesToShow: 1
		});



})(jQuery);	