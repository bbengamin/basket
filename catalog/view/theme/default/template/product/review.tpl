<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<table class="table table-striped table-bordered">
  <tr>
    <td style="width: 50%;"><strong><?php echo $review['author']; ?> - <?php echo $review['email']; ?></strong></td>
    <td class="text-right"><?php echo $review['date_added']; ?></td>
  </tr>
  <tr>
    <td colspan="2"><p><?php echo $review['text']; ?></p>
      <?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($review['rating'] < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } ?>
      <?php } ?></td>
  </tr>
</table>

<div class='hidden' itemscope itemtype="http://schema.org/Review">
  <div itemprop="itemReviewed" itemscope itemtype="http://schema.org/Restaurant">
    <span itemprop="name"><?php echo $product_name; ?></span>
    <img itemprop="image" src="<?php echo $image; ?>" alt="Купить <?php echo $product_name; ?>"/>
  </div>
  <span itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
    <span itemprop="ratingValue"><?php echo $review['rating']; ?></span>
  </span> 
  <b><span itemprop="name">A good seafood place.</span>" </b>
  <span itemprop="author" itemscope itemtype="http://schema.org/Person">
    <span itemprop="name"><?php echo $review['author']; ?></span>
  </span>
  <span itemprop="reviewBody"><?php echo $review['text']; ?></span>
  <div itemprop="publisher" itemscope itemtype="http://schema.org/Organization">
    <meta itemprop="name" content="<?php echo $review['author']; ?>">
  </div>
</div>

<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>

