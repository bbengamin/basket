<div class="quick-view-product-box">
<div class="qick-view-img-box">
  <div class="clearfix">
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
              <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class='img-responsive' />
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
                <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class='img-responsive' />
              </a>
            </div>
            <?php } ?>
          </div>
        </div>
      </div>
      <?php } ?>
    <?php } ?>
  </div>
</div>
<div class="qick-view-description-box">
  <div class="quick-caption">
    <h4 class='title-h4'><a href="<?php echo $href; ?>"><?php echo $name; ?></a></h4>
    <p class='hover-description'><span>Артикул:</span><span class='art-value my-blue'><?php echo $model; ?></span></p>
    <span class='what-inside'>Состав корзины:</span>
    <p class='hover-description'>
      <?php echo $basket_content; ?>
    </p>
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
             <span class="cat-add-btn-img"><img src='/catalog/view/theme/default/image/cart-add-icon.png'></span>
          </div>
          <div class="quick-buy-category">
            <span class="qu-buy-btn-img"><img src='/catalog/view/theme/default/image/quick-b-icon.png'></span>
            <a class="qu-buy-btn" data-id="<?php echo $product_id; ?>">Купить в один клик</a>
          </div>
        </div>
      </div>
    </p>
    
  </div>
</div>
</div>
<div class="qiuck-description-box">
<h4 class='span-title title-h4'><span>Описание товара</span></h4>
<div class='description-quick-view'><?php echo $description; ?></div>
</div>
<div class="quick-view-btns-box">
<div class="quick-view-btns-inner">
  <div class="buy-reviews-category-box">
    <h4 class='span-title title-h4'><span>Отзыв о товаре</span></h4>
      <div class="quick-buy-category">
       <span>Оцените товар</span>
       <div class="stars-box">
         <ul class="starts-list">
           <li class='star-item active'>
             <a href='#'><i class="material-icons">star_rate</i></a>
           </li>
           <li class='star-item active'>
             <a href='#'><i class="material-icons">star_rate</i></a>
           </li>
           <li class='star-item active'>
             <a href='#'><i class="material-icons">star_rate</i></a>
           </li>
           <li class='star-item active'>
             <a href='#'><i class="material-icons">star_rate</i></a>
           </li>
           <li class='star-item'>
             <a href='#'><i class="material-icons">star_rate</i></a>
           </li>
         </ul>
       </div>
      </div>
      <div class="cat-add-btn">
         <a href='<?php echo $reviews; ?>'><span class="cat-add-btn-text">Написать отзыв о товаре</span></a>
      </div>
  </div>
</div>
</div>
<script type="text/javascript">
  $('.quick-view-product-box .product-additional-slider').owlCarousel({
		items: 3,
		autoPlay: 5000,
		singleItem: false,
		navigation: true,
		navigationText: ['<span class="carousel-control-s car-left-control"></span>', '<span class="carousel-control-s car-right-control"></span>'],
		pagination: false
	});
</script>