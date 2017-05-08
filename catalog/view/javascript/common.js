function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}




$(document).ready(function() {
	$(document).on('click','.transparent-overley', function(e) {
	    $(this).parent().empty();
	})
	var delayTimer;
	$('#search input[name=\'search\']').on('keyup', function(e) {
	    clearTimeout(delayTimer);
	    delayTimer = setTimeout(function() {
			var value = $('header input[name=\'search\']').val();
			var data = 'search=' + encodeURIComponent(value);
			
			$.ajax({
				url: 'index.php?route=product/search/liveSearch',
				type: 'get',
				data: data,
				dataType: 'html',
				success: function(html) {
					$('#live-search-result').html(html);
				}
			});
	    }, 500);
	});
	
	$('#buy-form').on('change', '.quantity-input',function() {
	    $.ajax({
	        url: 'index.php?route=checkout/buy/editMy',
	        type: 'post',
	        data: $(this),
	        dataType: 'json',
	        success: function(json) {
	            $('#buy-form').load('index.php?route=checkout/buy #buy-load');
	        }
	    });
	});
	
	$(document).on('click', '.minus', function () {
        var $input = $(this).parent().find('.quantity-input');
        var count = parseInt($input.val()) - 1;
        count = count < 1 ? 1 : count;
        $input.val(count);
        $input.change();
        return false;
    });
    $(window).on('scroll', function() {
		if($(window).scrollTop() >= 100){
	   		$('body').addClass('header-scrolled');
	   }else{
			$('body').removeClass('header-scrolled');   	
	   };
	});
	
	  $('.slide-home-page').owlCarousel({
	    items: 4,
	    autoPlay: false,
	    singleItem: false,
	    navigation: true,
	    navigationText: ['<span class="carousel-control-s car-left-control"></span>', '<span class="carousel-control-s car-right-control"></span>'],
	    pagination: false
	  });
    
    
    $(document).on('click', '.plus', function () {
        var $input = $(this).parent().find('.quantity-input');
        $input.val(parseInt($input.val()) + 1);
        $input.change();
        return false;
    });
    
    $(document).on('click', '.quick-view', function () {
    	var product_id = $(this).attr('data-id');
    	$.ajax({
			url: 'index.php?route=product/quickview',
			type: 'get',
			data: 'product_id=' + product_id ,
			dataType: 'html',
			success: function(data) {
				$('#quick-view-body-box').html(data);
				$('#modal-quick-views').modal('show');
				
			}
		});
    });
    	
    $('#call-back-form').on('submit', function(e){
		e.preventDefault();
		$form = $(this);
		
		$form.find('input').removeClass('red_error');
		$form.find('.error').detach();
	
		$.ajax({
			url: 'index.php?route=checkout/fast/callback',
			type: 'post',
			data: $form.find('input'),
			dataType: 'json',
			success: function(json) {
				if (json['error']) {
					$.each(json['error'], function(key, val) {
						$form.find('[name="' + key + '"]').after('<span class="error">' + val + '</span>');
                    });
				}

				if (json['success']) {
					$form.hide();
					$form.next().show();
				}
			}
		});

		return false;
	});
	
	$(document).on('click', '.qu-buy-btn', function(e) {
		e.preventDefault();
		
		var id = $(this).attr('data-id');
		$('#modal-quick-buy input[name="product_id"]').val(id);
	    $('#modal-quick-views').modal('hide');
	    $('#modal-quick-buy').modal('show');
	    
	    return false;
	});
	
	$('#quick-buy-form').on('submit',function(e){
		e.preventDefault();
		$form = $(this);
		
		$form.find('input').removeClass('red_error');
		$form.find('.error').detach();
		
		$.ajax({
			url: 'index.php?route=checkout/fast/fastorder',
			type: 'post',
			data: $form.find('input'),
			dataType: 'json',
			success: function(json) {
				if (json['error']) {
					$.each(json['error'], function(key, val) {
						$form.find('[name="' + key + '"]').after('<span class="error">' + val + '</span>');
                    });
				}

				if (json['success']) {
					$form.hide();
					$form.next().show();
				}
			}
		});

		return false;
	});
	
	$(document).on('click', '.cat-add-btn', function(e){
    	
		$btn = $(this);
		var product_id = $btn.attr('data-id');
		var quantity = $btn.parents('.q-wrapper').find('input[name="quantity"]').val();
		
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					
					if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
						location = 'index.php?route=checkout/cart';
					} else {
						$('#cart > ul').load('index.php?route=common/cart/info ul li');
					}
					$('#cart-total').html( json['total']);
					
					$('#modal-quick-views').modal('hide');
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			}
		});
	
    });
    
    $(document).bind({
        copy : function(e){
        	addLink();
        },
        cut : function(){
        	addLink();
        }
	});
	
	function addLink() {
	    var body_element = document.getElementsByTagName('body')[0];
	    var selection;
	    selection = window.getSelection();
	    var pagelink = "<br /><br /> Источник: <a href='"+document.location.href+"'>"+document.location.href+"</a><br />";
	    var copytext = selection + pagelink;
	    var newdiv = document.createElement('div');
	    newdiv.style.position='absolute';
	    newdiv.style.left='-99999px';
	    body_element.appendChild(newdiv);
	    newdiv.innerHTML = copytext;
	    if(selection.toString().length > 100){
	    	selection.selectAllChildren(newdiv);
	    }
	    window.setTimeout(function() {
	        body_element.removeChild(newdiv);
	    },0);
	}
	
	$(document).on('click', '.star-item', function(e){
		e.preventDefault();
		$(this).nextAll().removeClass('active');
		$(this).prevAll().addClass('active');
		$(this).addClass('active');
		
		$(this).parents().filter('form#form-review').find('#input-rating').val($(this).prevAll().length + 1);
		
		return false;
	})
	
	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();

		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});

	// Currency
	$('#currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('#currency input[name=\'code\']').attr('value', $(this).attr('name'));

		$('#currency').submit();
	});

	// Language
	$('#language a').on('click', function(e) {
		e.preventDefault();

		$('#language input[name=\'code\']').attr('value', $(this).attr('href'));

		$('#language').submit();
	});

	/* Search */
	$('.srch-btn').on('click', function() {
		url = $('base').attr('href') + 'search';

		var value = $('header input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('.srch-btn').trigger('click');
		}
	});

	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// Product List
	$('#list-view').click(function() {
		$('#content .product-grid > .clearfix').remove();
		$('#grid-view').removeClass('active');
		$(this).addClass('active')	;
		//$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');
		$('#content .row > .product-grid').attr('class', 'product-layout product-list col-xs-12');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		// What a shame bootstrap does not take into account dynamically loaded columns
		cols = $('#column-right, #column-left').length;
	$('#list-view').removeClass('active');
		$(this).addClass('active');
		if (cols == 2) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
		} else {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
		}

		 localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	} else {
		$('#grid-view').trigger('click');
	}

	// Checkout
	$(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			$('#collapse-checkout-option #button-login').trigger('click');
		}
	});

	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});
	
	//slides-product
	
	$('.product-additional-slider').owlCarousel({
		items: 3,
		autoPlay: 5000,
		singleItem: false,
		navigation: true,
		navigationText: ['<span class="carousel-control-s car-left-control"></span>', '<span class="carousel-control-s car-right-control"></span>'],
		pagination: false
	});
	
	 function filterfix(){
		var minpr = $('#mfilter-opts-price-min').val();
		var maxpr = $('#mfilter-opts-price-max').val();
	  	$('.ui-slider .ui-slider-handle:first').html("<span class='price-val price-val-min'>"+minpr+"</span>");
		$('.ui-slider .ui-slider-handle:last-child').html("<span class='price-val price-val-max'>"+maxpr+"</span>");
	}
	setTimeout(filterfix, 500);
	
	$('.top-menus ul').clone().appendTo('.sidenav');
});


/* Set the width of the side navigation to 250px */
function openNav() {
    document.getElementById("mobile-menu-box").style.left = "0";
    document.getElementById("mobile-overlay").style.left = "0";
}

/* Set the width of the side navigation to 0 */
function closeNav() {
    document.getElementById("mobile-menu-box").style.left = "-9999px";
    document.getElementById("mobile-overlay").style.left = "-9999px";
}



// Cart add remove functions
var cart = {
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
				$('#cart-total').html( json['total']);
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
				$('#cart-total').html( json['total']);
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				$('#wishlist-total span').html(json['total']);
				$('#wishlist-total').attr('title', json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'remove': function() {

	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#compare-total').html(json['total']);

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'remove': function() {

	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});

// Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();

			$.extend(this, option);

			$(this).attr('autocomplete', 'off');

			// Focus
			$(this).on('focus', function() {
				this.request();
			});

			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);
			});

			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}
			});

			// Click
			this.click = function(event) {
				event.preventDefault();

				value = $(event.target).parent().attr('data-value');

				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}

			// Show
			this.show = function() {
				var pos = $(this).position();

				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});

				$(this).siblings('ul.dropdown-menu').show();
			}

			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}

			// Request
			this.request = function() {
				clearTimeout(this.timer);

				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}

			// Response
			this.response = function(json) {
				html = '';

				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}

					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}

					// Get all the ones with a categories
					var category = new Array();

					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}

							category[json[i]['category']]['item'].push(json[i]);
						}
					}

					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}

				if (html) {
					this.show();
				} else {
					this.hide();
				}

				$(this).siblings('ul.dropdown-menu').html(html);
			}

			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));

		});
	}
})(window.jQuery);
