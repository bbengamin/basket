<div class="home-products-box">
  <div class="container">
    <div class="clearfix">
      <h3 class='title-my title-h3'><?php echo $heading_title; ?></h3>
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
              <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="Купить <?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
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
                   <span class="cat-add-btn-img"><img src='/catalog/view/theme/default/image/cart-add-icon.png' alt="Купить <?php echo $product['name']; ?>"></span>
                </div>
              </div>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
  </div>
</div>
