<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  
<div class='micro' itemscope itemtype="http://schema.org/Product">
  <span itemprop="brand"><?php echo $manufacturer; ?></span>
  <span itemprop="name"><?php echo $image_title; ?></span>
  <img itemprop="image" src="<?php echo $thumb; ?>" alt="Купить <?php echo $heading_title; ?>" />
  <span itemprop="description"><?php echo $description; ?></span>
  Артикул: <span itemprop="mpn"><?php echo $model; ?></span>
  <span itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
    <span itemprop="ratingValue">4.4</span> из 5, основываясь на <span itemprop="reviewCount">89
      </span> отзывов
  </span>
  <span itemprop="offers" itemscope itemtype="http://schema.org/Offer">
    <meta itemprop="priceCurrency" content="RUB" />
    руб.<span itemprop="price"><?php echo $price; ?></span>
   
    <span itemprop="seller" itemscope itemtype="http://schema.org/Organization">
      <span itemprop="name">Мастер Корзин</span>
    </span>
    Condition: <link intemprop="itemCondition" href="http://schema.org/UsedCondition"/>Previously owned,
      in excellent conditio
    <link itemprop="availability" href="http://schema.org/InStock"/>В наличии!Заказать сейчас!
    </span>
  
</div>
  <div class="row"><?php echo $column_left; ?>
    
    <div id="content" class="col-sm-12"><?php echo $content_top; ?>
    <div class="clearfix">
      <div class="product-main-wrap clearfix">
        <div class="main-product-box col-sm-9">
          <div class="row">
            <div class="col-sm-5">
              <?php if ($thumb || $images) { ?>
                <div class="main-product-image">
                  <div class="markss-box">
                    <?php if($top_sale == 1) { ?>
                      <div class="marks top-mark">
                        <span>Топ продаж</span>
                      </div>
                    <?php } ?>
                    <?php if($new == 1) { ?>
                      <div class="marks new-mark">
                        <span>Новинка</span>
                      </div>
                    <?php } ?>
                  </div>
                  <?php if ($thumb) { ?>
                    <div>
                      <a class="" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" data-fancybox='image' data-caption='<?php echo $heading_title; ?>'>
                        <img src="<?php echo $thumb; ?>" title="<?php echo $image_title; ?>" alt="Купить <?php echo $image_title; ?>" class='img-responsive' />
                      </a>
                    </div>
                  <?php } ?>
                </div>
                <?php if ($images) { ?>
                <div class="additional-images-box">
                  <div class="additional-carousel-wrap">
                    <div class="product-additional-slider">
                      <?php foreach ($images as $image) { ?>
                      <div class="additional-item">
                        <a class="" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" data-fancybox='image' data-caption='<?php echo $heading_title; ?>'>
                          <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="Купить <?php echo $heading_title; ?>" class='img-responsive' />
                        </a>
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <?php } ?>
              <?php } ?>
            </div>
            
            <div class="col-sm-7">
              <h1 class='title-h1 title-h1'><?php echo $heading_title; ?></h1>
              
              <ul class="list-unstyled">
                <?php if ($manufacturer) { ?>
                <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                <?php } ?>
                <li class='product-property property-articul'><span class="prop-name">Артикул:</span> <span class='my-blue'><?php echo $model; ?></span></li>
                <li class='product-property property-bascet-content'>
                  <span class="prop-name what-inside">Состав корзины: </span>
                  <p>
                    <?php echo $basket_content; ?>
                  </p>
                </li>
              </ul>
              <div class="quick-caption">
                <p class='qu-hovered-btns-box'>
                  <div class="hovered-btns-box q-wrapper">
                    <?php if ($price) { ?>
                      <p class="price">
                        <?php echo $price; ?>
                      </p>
                    <?php } ?>
                    <div class="quantity-category-box">
                      <div class="quanty-cart-box">
                        <div class="quantity-pick-box">
                          <div class='minus'><i class="fa fa-caret-down" aria-hidden="true"></i></div>
                          <input type="text" name="quantity" id="quantity<?php echo $product_id; ?>" value="1" size="1" class="quantity-input" />
                          <div class='plus'><i class="fa fa-caret-up" aria-hidden="true"></i></div>
                        </div>
                      </div>
                    </div>
                    <div class="buy-btns-category-box">
                      <div class="cat-add-btn" data-id="<?php echo $product_id; ?>">
                         <span class="cat-add-btn-text">Добавить в корзину</span>
                         <span class="cat-add-btn-img"><img src='/catalog/view/theme/default/image/cart-add-icon.png' alt="Купить <?php echo $heading_title; ?>"></span>
                      </div>
                      <div class="quick-buy-category">
                        <span class="qu-buy-btn-img"><img src='/catalog/view/theme/default/image/quick-b-icon.png' alt="Купить <?php echo $heading_title; ?>"></span>
                        <a class="qu-buy-btn" data-id="<?php echo $product_id; ?>">Купить в один клик</a>
                      </div>
                    </div>
                  </div>
                </p>
              </div>
              <div class="share-box">
                <span class='share-title'>
                  Поделиться с друзьями:
                </span>
                <span>
                  <script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
                  <script src="//yastatic.net/share2/share.js"></script>
                  <div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,gplus,twitter"></div>
                </span>
              </div>
            </div>
            
            
                
            <div class="col-sm-12">
              <div class="description-product-wrap product-specific-item">
                <h3 class='title-h3'>
                  <?php echo $tab_description; ?>
                </h3>
                <div id="tab-description">
                  <?php echo $description; ?>
                </div>
              </div>
              <div class="review-product-wrap clearfix product-specific-item">
                
                <div class="col-sm-8">
                  <div class="row">
                    <div id="review"><?php echo $review; ?></div>
                    <?php if ($review_status) { ?>
                    <div id="tab-review">
                      <form class="form-horizontal" id="form-review">
                        <h3 class='title-h3'>
                          Отзыв о товаре
                        </h3>
                        <?php if ($review_guest) { ?>
                        <div class="form-group required">
                          <div class="col-sm-6">
                            <input type="hidden" name="rating" value="" id="input-rating"/>
                            <input type="text" name="name" value="" id="input-name" class="form-control" placeholder='<?php echo $entry_name; ?>'/>
                          </div>
                          <div class="col-sm-6">
                            <input type="email" name="email" value="" id="input-email" class="form-control" placeholder='Ваш e-mail'/>
                          </div>
                        </div>
                        <div class="form-group required">
                          <div class="col-sm-12">
                            <textarea name="text" rows="5" id="input-review" placeholder='<?php echo $entry_review; ?>' class="form-control"></textarea>
                          </div>
                        </div>
                        <div class="form-group required">
                          <div class="col-sm-12">
                            <div class="reviews-box-product-page">
                              <span>Оцените товар</span>
                              <div class="stars-box">
                                 <ul class="starts-list">
                                   <li class='star-item active'>
                                     <a><i class="material-icons">star_rate</i></a>
                                   </li>
                                   <li class='star-item active'>
                                     <a><i class="material-icons">star_rate</i></a>
                                   </li>
                                   <li class='star-item active'>
                                     <a><i class="material-icons">star_rate</i></a>
                                   </li>
                                   <li class='star-item active'>
                                     <a><i class="material-icons">star_rate</i></a>
                                   </li>
                                   <li class='star-item'>
                                     <a><i class="material-icons">star_rate</i></a>
                                   </li>
                                 </ul>
                               </div>
                             </div>
                            </div>
                          </div>
                        
                        <?php echo $captcha; ?>
                        <div class="buttons clearfix">
                          <div class="pull-left">
                            <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="main-btn"><?php echo $button_continue; ?></button>
                          </div>
                        </div>
                        <?php } else { ?>
                        <?php echo $text_login; ?>
                        <?php } ?>
                      </form>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
          </div><!--row-->
        </div>
        
        <div class="col-sm-3">
          <div class="info-box">
            <div class="delivery-info-box">
                <h4 class="blue-title-info title-h4">
                  <span>
                    <img src='/catalog/view/theme/default/image/deli-icon.png' alt="Купить <?php echo $heading_title; ?>">
                  </span>
                  <span>
                    Доставка:
                  </span>
                </h4>
                <p class="info-inner-title">
                  Москва
                </p>
                <p class="info-inner-text">
                  Москва: Доставка по Москве новогодних подарков 2300 р.
                </p>
                <p class="info-inner-text">
                  Мос.обл.: по договоренности
                </p>
                
                <p class="info-inner-title">
                  По России:
                </p>
                <p class="info-inner-text">
                  Доставка по России производится через транспортные компании (при помощи вашей транспортной компании или вы сможете воспользоваться услугами наших транспортных партнеров)
                </p>
                <p class="info-inner-text">
                  Доставка подарков на сумму от 180000 рублей по Москве в пределах МКАД в одну точку – бесплатно!
                </p>
              </div>
              
              <div class="payment-info-box">
                <h4 class="blue-title-info title-h4">
                  <span>
                    <img src='/catalog/view/theme/default/image/pay-icon.png' alt="Купить <?php echo $heading_title; ?>">
                  </span>
                  <span>
                    Оплата:
                  </span>
                </h4>
                <p class="info-inner-text">
                  Наличные вы сможете оплатить товар у нас в офисе, также возможна оплата через Сбербанк.
                </p>
                <p class="info-inner-text">
                  Безнал - для юридических лиц и ИП.
                </p>
              </div>
            
          </div>
        </div>
        
        
      </div>
      <?php if ($products) { ?>
      
      <div class="row">
        <div class="clearfix">
          <h3 class='title-my title-h3'><?php echo $text_related; ?></h3>
            <div class="clearfix">
              <div class="slide-home-page">
              <?php foreach ($products as $product) { ?>
              <div class="product-layout col-xs-12">
                <div class="product-thumb transition">
                  <div class="markss-box">
                    <?php if($product['top_sale'] == 1) { ?>
                      <div class="marks top-mark">
                        <span>Топ продаж</span>
                      </div>
                    <?php } ?>
                    <?php if($product['new'] == 1) { ?>
                      <div class="marks new-mark">
                        <span>Новинка</span>
                      </div>
                    <?php } ?>
                  </div>
                  <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                  <div class="caption">
                    <h4 class='title-h4'><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                    
                    <?php if ($product['price']) { ?>
                    <p class="price">
                      <?php echo $product['price']; ?>
                    </p>
                    <?php } ?>
                  </div>
                  <div class="cat-add-btn-holder q-wrapper">
                    <div class="cat-add-btn" data-id="<?php echo $product['product_id']; ?>">
                       <input type="hidden" name="quantity" value='1' />
                       <span class="cat-add-btn-text"><?php echo $button_cart; ?></span>
                       <span class="cat-add-btn-img"><img src='/catalog/view/theme/default/image/cart-add-icon.png' alt="Купить <?php echo $heading_title; ?>"></span>
                    </div>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div></div>
    <?php echo $column_right; ?></div>
</div>


<script>
  $('.slide-home-page').owlCarousel({
		items: 4,
		autoPlay: false,
		singleItem: false,
		navigation: true,
		navigationText: ['<span class="carousel-control-s car-left-control"></span>', '<span class="carousel-control-s car-right-control"></span>'],
		pagination: false
	});
</script>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

//$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>
