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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
            <div class="article-title">
                <h3 class='title-h3'><?php echo $heading_title; ?></h3>
            </div>
            <div class="article-subtitle">
                <span class="article-date"><?php echo $date; ?></span>
                <span>
                  <script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
                  <script src="//yastatic.net/share2/share.js"></script>
                  <div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,gplus,twitter"></div>
                </span>
            </div>
            <div class="article-description">
                <p><?php echo $description; ?></p>
            </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<div class='hidden' itemscope itemtype="http://schema.org/NewsArticle">
  <meta itemscope itemprop="mainEntityOfPage"  itemType="https://schema.org/WebPage" itemid="https://google.com/article"/>
  <h2 itemprop="headline"><?php echo $heading_title; ?></h2>
  <h3 itemprop="author" itemscope itemtype="https://schema.org/Person">
    By <span itemprop="name">Мастер Корзин</span>
  </h3>
  <span itemprop="description"><?php echo $description; ?></span>
  <div itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
      <img src="<?php echo $image; ?>"/>
      <meta itemprop="url" content="<?php echo $image; ?>">
      <meta itemprop="width" content="39">
      <meta itemprop="height" content="36">
  </div>
  <div itemprop="publisher" itemscope itemtype="https://schema.org/Organization">
    <div itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
      <img src="<?php echo $image; ?>"/>
      <meta itemprop="url" content="<?php echo $image; ?>">
      <meta itemprop="width" content="39">
      <meta itemprop="height" content="36">
    </div>
    <meta itemprop="name" content="Мастер Корзин">
  </div>
  <meta itemprop="datePublished" content="<?php echo $date_m; ?>"/>
  <meta itemprop="dateModified" content="<?php echo $date_m; ?>"/>
</div>
<?php echo $footer; ?>
