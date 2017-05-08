<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
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
            <h1 class='title-h1'>Отзывы</h1>
            <form class="form-horizontal" id="form-review">
                <?php if ($review_status) { ?>
                <div id="review"></div>
                <?php if ($review_guest) { ?>
                <h2 class='title-h2'>Оставте свой отзыв</h2>
                <div class="form-group required">
                    <div class="col-sm-12">
                        <label class="control-label" for="input-name">Ваше имя:</label>
                        <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control"/>
                    </div>
                </div>
                <div class="form-group required">
                    <div class="col-sm-12">
                        <label class="control-label" for="input-review">Текст отзыва:</label>
                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>

                        <div class="help-block"><?php echo $text_note; ?></div>
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
                    <!--<div class="col-sm-12">
                        <label class="control-label"><?php echo $entry_rating; ?></label>
                        &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                        <input type="radio" name="rating" value="1" />
                        &nbsp;
                        <input type="radio" name="rating" value="2" />
                        &nbsp;
                        <input type="radio" name="rating" value="3" />
                        &nbsp;
                        <input type="radio" name="rating" value="4" />
                        &nbsp;
                        <input type="radio" name="rating" value="5" />
                        &nbsp;<?php echo $entry_good; ?>
                    </div>-->
                </div>
                <?php if (isset($site_key) && $site_key) { ?>
                <div class="form-group">
                    <div class="col-sm-12">
                        <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                    </div>
                </div>
                <?php } elseif(isset($captcha) && $captcha){ ?>
                <?php echo $captcha; ?>
                <?php } ?>
                <div class="buttons clearfix">
                    <div class="pull-right">
                        <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>"
                                class="main-btn">Продолжить</button>
                    </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
                <?php } ?>
            </form>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>

    <script type="text/javascript"><!--
        $('#review').delegate('.pagination a', 'click', function (e) {
            e.preventDefault();
            $('#review').load(this.href);
        });

        $('#review').load('<?php echo html_entity_decode($review); ?>');

        $('#button-review').on('click', function () {
            $.ajax({
                url: '<?php echo html_entity_decode($write); ?>',
                type: 'post',
                dataType: 'json',
                data:  $("#form-review").serialize(),
                beforeSend: function () {
                    if ($("textarea").is("#g-recaptcha-response")) {
                        grecaptcha.reset();
                    }
                    $('#button-review').button('loading');
                },
                complete: function () {
                    $('#button-review').button('reset');
                },
                success: function (json) {
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
        //--></script>
</div>
<?php echo $footer; ?>