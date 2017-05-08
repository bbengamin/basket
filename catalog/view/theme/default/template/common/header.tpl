<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />

<?php if($show_info) { ?>
  <?php if ($description) { ?>
  <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
  <meta name="keywords" content= "<?php echo $keywords; ?>" />
  <?php } ?>
<?php } ?>


<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/catalog/view/javascript/jquery.fancybox.min.js" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/catalog/view/theme/default/stylesheet/jquery.fancybox.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<link href="/favicon.ico" rel="icon">

<?php if($absolute_main) { ?>
  <link rel="canonical" href="<?php echo $absolute_main; ?>">
<?php } ?>

<?php if($next) { ?>
  <link rel="next" href="<?php echo $next; ?>">
<?php } ?>
<?php if($prev) { ?>
  <link rel="prev" href="<?php echo $prev; ?>">
<?php } ?>

</head>
<body class="<?php echo $class; ?>">
  <div id="mobile-overlay" onclick="closeNav()"></div>
  <div id="mobile-menu-box" class="sidenav" onclick="closeNav()">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><i class="material-icons">keyboard_tab</i></a>
    
  </div>

<div class="styck-header-box">  
<nav id="top">
  <div class="container">
    <div id="top-links">
      <span onclick="openNav()" class='opennav-btns'><i class="material-icons">menu</i> <span>Информация</span></span>
      <div class="top-menus top-menu-left">
        <ul class="list-unstyled">
          <li><a href='/about_company'>О компании</a></li>
          <li><a href='/delivery'>Доставка</a></li>
          <li><a href='/payment'>Оплата</a></li>
          <li><a href='/contact'>Контакты</a></li>
          <li><a href='to_corporative_clients'>Корпоративным клиентам</a></li>
          <li><a href='/price_list'>Прайс лист</a></li>
          <li><a href='/blog'>Новости</a></li>
        </ul>
      </div>
      <div class="top-menus top-menu-right">
        <ul class="list-unstyled">
          <?php if ($logged) { ?>
            <li><a href="/account"><i class="fa fa-user hidden-xs" aria-hidden="true"></i> <?php echo $text_account; ?></a></li>
            <li><a href="/logout"><i class="fa fa-sign-out hidden-xs" aria-hidden="true"></i> <?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="register"><i class="fa fa-key hidden-xs" aria-hidden="true"></i> <?php echo $text_register; ?></a></li>
            <li><a href="/login"><i class="fa fa-user hidden-xs" aria-hidden="true"></i> <?php echo $text_login; ?></a></li>
            <?php } ?>
        </ul>
      </div>
    </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-2">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="/">
            <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
            <span><?php echo $name; ?></span>
          </a>
          <?php } else { ?>
          <h1 class='title-h1'><a href="/"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5">
        <div class="head-contact-box">
          <div class="head-contact-item">
            <?php echo $officeHours; ?>
          </div>
          <div class="head-contact-item">
            <span>
              <a href='#' class='contact-item contact-item-phone'><?php echo $telephone; ?></a>
              <a href='#' class='my-blue contact-item contact-item-callback' data-toggle="modal" data-target="#modal-callback">Заказать обратный звонок</a>
            </span>
          </div>
          <div class="head-contact-item hidden-xs">
            <span class='contact-item contact-item-adress'><?php echo $address; ?></span>
          </div>
        </div>
      </div>
      <div class="col-sm-5 rght-head-scrolled-box">
        <?php echo $cart; ?>
        <?php echo $search; ?>
      </div>
    </div>
  </div>
</header>
</div>
<div class="main-menu-wrap">
  <?php if ($categories) { ?>
  <div class="container">
    <nav id="menu" class="navbar">
      <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
        <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
      </div>
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">
          <?php foreach ($categories as $category) { ?>
          <?php if ($category['children']) { ?>
          <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
            <div class="dropdown-menu">
              <div class="dropdown-inner">
                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                <ul class="list-unstyled">
                  <?php foreach ($children as $child) { ?>
                  <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                  <?php } ?>
                </ul>
                <?php } ?>
              </div>
              <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
          </li>
          <?php } else { ?>
          <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
      </div>
    </nav>
  </div>
  <?php } ?>
</div>