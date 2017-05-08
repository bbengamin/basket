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
      <h2 class='title-h2'><?php echo $name; ?></h2>
      <?php if ($articles) { ?>

        <?php foreach ($articles as $article) { ?>
          <div class="panel panel-default">
              <div class="panel-body">
                <div class="article-layout article-list col-xs-12">
                  <div class="article-intro">
                    <div>
                        <h3><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h3>
                        <p><?php echo $article['date_modified']; ?></p>
                        <p><?php echo $article['intro_text']; ?></p>
                    </div>
                  </div>
                  <div class="buttons">
                        <div class="pull-right"><a href="<?php echo $article['href']; ?>" class="btn btn-primary"><?php echo $button_read_more; ?></a></div>
                  </div>
                </div>
              </div>
              <div class='hidden' itemscope itemtype="http://schema.org/NewsArticle">
                <meta itemscope itemprop="mainEntityOfPage"  itemType="https://schema.org/WebPage" itemid="https://google.com/article"/>
                <h2 itemprop="headline"><?php echo $heading_title; ?></h2>
                <h3 itemprop="author" itemscope itemtype="https://schema.org/Person">
                  By <span itemprop="name">Мастер Корзин</span>
                </h3>
                <span itemprop="description"><?php echo $article['intro_text']; ?></span>
                <div itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
                    <img src="<?php echo $article['image']; ?>"/>
                    <meta itemprop="url" content="<?php echo $article['image']; ?>">
                    <meta itemprop="width" content="39">
                    <meta itemprop="height" content="36">
                </div>
                <div itemprop="publisher" itemscope itemtype="https://schema.org/Organization">
                  <div itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
                    <img src="<?php echo $article['image']; ?>"/>
                    <meta itemprop="url" content="<?php echo $article['image']; ?>">
                    <meta itemprop="width" content="39">
                    <meta itemprop="height" content="36">
                  </div>
                  <meta itemprop="name" content="Мастер Корзин">
                </div>
                <meta itemprop="datePublished" content="<?php echo $article['date_m']; ?>"/>
                <meta itemprop="dateModified" content="<?php echo $article['date_m']; ?>"/>
              </div>
          </div>
        <?php } ?>

      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
