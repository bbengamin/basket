<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb"> 
  <?php foreach ($breadcrumbs as $breadcrumb) { ?> 
    <li itemscope itemtype="<?php echo $breadcrumb['href']; ?>" class="bread-crumb-item"> 
    <a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"> 
    <span itemprop="title"><?php echo $breadcrumb['text']; ?></span> 
    </a> 
    </li> 
  <?php } ?> 
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php if($categories) { ?>
      <?php foreach($categories as $category) { ?>
      <div class='categoty-list-item'>
        <img src="<?php echo $category['image']; ?>"alt='<?php echo $heading_title; ?>' title='<?php echo $heading_title; ?>'>
        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      </div>
      <?php } ?>
      <?php } ?>
      
      <?php if ($products) { ?>
      
      <div class="clearfix">
        <div class="filter-sort-box"> 
          <div class="filter-sort-box-item sort-box-item-from-to">
            <span class='sort-title'>Сортировка:</span>
            <div class="sort-inner-box">
              <?php foreach ($sorts as $key => $ss) { ?>
                <a href="<?php echo $ss['href']; ?>" class="<?php echo ($key == $sort . '-' . $order) ? 'active': ''; ?> sort-item">
                  <?php echo $ss['text']; ?>
                </a>
              <?php } ?>
            </div>
          </div>
          <div class="filter-sort-box-item sort-box-item-filter">
            <span class='sort-title'>Цена:</span>
            <?php echo $content_top; ?>
          </div>
          <div class="filter-sort-box-item sort-box-item-select">
              <span class='sort-title'>Показать товаров:</span>
              <select id="input-limit" class="form-control" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
          </div>
          <div class="filter-sort-box-item sort-box-item-views">
            <div class="btn-group hidden-xs">
              <button type="button" id="grid-view" class="" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
              <button type="button" id="list-view" class="" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            </div>
          </div>
        </div>
      </div>
      <br />
      <h1><?php echo $heading_title; ?></h1>
      <div class="row category-product">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout  product-list col-xs-12">
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
            <div class="image">
              <a href="<?php echo $product['href']; ?>">
                <img src="<?php echo $product['thumb']; ?>" alt="Купить <?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
              </a>
              <a class="quick-view" data-id="<?php echo $product['product_id']; ?>" data-toggle="modal">Быстрый просмотр</a>
            </div>
            <div class="no-hover-caption">
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php echo $product['price']; ?>
                </p>
                <?php } ?>
              </div>
              <div class="cat-add-btn-holder">
                <div class="cat-add-btn" onclick="cart.add('<?php echo $product['product_id']; ?>');">
                   <span class="cat-add-btn-text"><?php echo $button_cart; ?></span>
                   <span class="cat-add-btn-img"><img src='/catalog/view/theme/default/image/cart-add-icon.png' alt="Купить <?php echo $product['name']; ?>"></span>
                </div>
              </div>
            </div>
            
            <div class="hover-caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <span class='what-inside'>Состав корзины:</span>
              <p class='hover-description'>
                <?php echo $product['basket_content']; ?>
              </p>
              <?php if ($product['price']) { ?>
                <p class="price">
                  <?php echo $product['price']; ?>
                </p>
              <?php } ?>
              <div class="hovered-btns-box q-wrapper">
                <div class="quantity-category-box">
                  <div class="quanty-cart-box">
                    <div class="quantity-pick-box">
                      <div class='minus'><i class="fa fa-caret-down" aria-hidden="true"></i></div>
                      <input type="text" name="quantity" id="quantity<?php echo $product['product_id']; ?>" value="<?php echo $product['minimum']; ?>" size="1" class="quantity-input" />
                      <div class='plus'><i class="fa fa-caret-up" aria-hidden="true"></i></div>
                    </div>
                  </div>
                </div>
                <div class="buy-btns-category-box">
                  <div class="cat-add-btn" data-id="<?php echo $product['product_id']; ?>">
                     <span class="cat-add-btn-text"><?php echo $button_cart; ?></span>
                     <span class="cat-add-btn-img"><img src='/catalog/view/theme/default/image/cart-add-icon.png' alt="Купить <?php echo $product['name']; ?>"></span>
                  </div>
                  <div class="quick-buy-category">
                    <span class="qu-buy-btn-img"><img src='/catalog/view/theme/default/image/quick-b-icon.png' alt="Купить <?php echo $product['name']; ?>"></span>
                    <a class="qu-buy-btn" data-id="<?php echo $product['product_id']; ?>">Купить в один клик</a>
                  </div>
                </div>
              </div>
              
              
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row" id='pagi'>
        <div class="pagination-box"><?php echo $pagination; ?></div>
        
      </div>
      <?php if($show_info) { ?>
      <div class='row'><?php echo $description; ?></div>
      <?php } ?>
      
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
    
    


<!-- Modal quick-views -->
<div id="modal-quick-views" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        
        <div id="quick-view-body-box">
        
        </div>
        
      </div>
    </div>
  </div>
</div>
    

</div>
<?php echo $footer; ?>
