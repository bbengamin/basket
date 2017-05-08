
<footer>
  <div class="main-menu-wrap">
    <div class="container">
      <nav id="menu-footer" class="navbar">
        <div class="navbar-header"><span id="category-footer" class="visible-xs">Меню</span>
          <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <li><a href="/katalog">Каталог товаров</a></li>
            <li><a href="about_company">О компании</a></li>
            <li><a href="/delivery">Доставка</a></li>
            <li><a href="/payment">Оплата</a></li>
            <li><a href="/contact">Контакты</a></li>
            <li><a href="/to_corporative_clients">Корпоративным клиентам</a></li>
            <li><a href="/price_list">Прайс лист</a></li>
            <li><a href="/blog">Новости</a></li>
            <li><a href="/sitemap">Карта сайта</a></li>
            <li><a href="/account">Личный кабинет</a></li>
            <li><a href="/testimonial">Отзывы</a></li>
          </ul>
        </div>
      </nav>
    </div>
</div>
<div class="footer-items-box">
  <div class="container">
    <div class="footer-items-wrap">
      <div class="footer-item contact-item">
        <h3 class='title-h3'>Контактная информация</h3>
        <p><?php echo $comment; ?></p>
        <p>Телефон: <span><?php echo $telephone; ?></span> многоканальный</p>
        <p>Почта: <span><?php echo $email; ?></span></p>
        <p><span><?php echo $address; ?></span></p>
        <p>График работы:</p>
        <p><?php echo $officeHours; ?></p>
      </div>
      <div class="footer-item vidget-item">
        <div id="ok_group_widget"></div>
        <script>
        !function (d, id, did, st) {
          var js = d.createElement("script");
          js.src = "https://connect.ok.ru/connect.js";
          js.onload = js.onreadystatechange = function () {
          if (!this.readyState || this.readyState == "loaded" || this.readyState == "complete") {
            if (!this.executed) {
              this.executed = true;
              setTimeout(function () {
                OK.CONNECT.insertGroupWidget(id,did,st);
              }, 0);
            }
          }}
          d.documentElement.appendChild(js);
        }(document,"ok_group_widget","54524045820141",'{"width":250,"height":285}');
        </script>
        <!--<img src='/catalog/view/theme/default/image/ok-vidget.jpg' alt='Мастер корзин'>-->
      </div>
      <div class="footer-item vidget-item">
        <img src='/catalog/view/theme/default/image/fb-vidget.jpg' alt='Мастер корзин'>
      </div>
      <div class="footer-item vidget-item">
        <script type="text/javascript" src="//vk.com/js/api/openapi.js?145"></script>

        <!-- VK Widget -->
        <div id="vk_groups"></div>
        <script type="text/javascript">
        VK.Widgets.Group("vk_groups", {mode: 3}, 146176209);
        </script>
        <!--<img src='/catalog/view/theme/default/image/vk-vidget.jpg' alt='Мастер корзин'>-->
      </div>
    </div>
  </div>
</div>

<div class='hidden' itemscope itemtype="http://schema.org/Organization">
  <span itemprop="name"><?php echo $config_copyright; ?></span>
    <div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
    Адрес:
    <span itemprop="streetAddress"><?php echo $address; ?></span>
    <span itemprop="addressLocality">Москва</span>
  </div>
  Телефон:<span itemprop="telephone"><?php echo $telephone; ?></span>
  Электронная почта: <span itemprop="email"><?php echo $email; ?></span> <br/>
</div>

<div class="footer-down-cprt-box">
  <div class="container">
    <div class="footer-cprt-wrap">
      <div class="footer-cprt-item">
        <img src='/catalog/view/theme/default/image/footer-logo.png'  alt='Мастер корзин'>
        <span><?php echo $config_copyright; ?></span>
      </div>
      <div class="footer-cprt-item">
        <a href='#'>
          <img src='/catalog/view/theme/default/image/des-cprt.png' alt='Мастер корзин'>
        </a>
      </div>
    </div>
  </div>
</div>
</footer>

<!-- Modal callback -->
<div id="modal-callback" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 class='title-h3'>Обратный звонок</h3>
        <form id="call-back-form" class="site-forms">
          <div class="input-field">
            <input type='text' name='name' placeholder='Ваше имя' required>
          </div>
          <div class="input-field">
            <input type='tel' name='phone' placeholder='Ваш телефон' required>
          </div>
          <div class="input-field">
            <input type='email' name='email' placeholder='Ваш e-mail' required>
          </div>
          <div class="input-field">
            <button type='submit' id='call-back-submit'>Отправить</button>
          </div>
        </form>
        <h3 class='thanks-text title-h3'>Спасибо, мы свяжемся с Вами в ближайшее время</h3>
      </div>
    </div>
  </div>
</div>


<!-- Modal quick-buy -->
<div id="modal-quick-buy" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 class='title-h3'>Покупка в один клик</h3>
        <form id="quick-buy-form" class="site-forms">
          <div class="input-field">
            <input type='hidden' name='product_id' >
            <input type='text' name='name' placeholder='Ваше имя' required>
          </div>
          <div class="input-field">
            <input type='tel' name='phone' placeholder='Ваш телефон' required>
          </div>
          <div class="input-field">
            <input type='email' name='email' placeholder='Ваш e-mail' required>
          </div>
          <div class="input-field">
            <button type='submit' id='quick-buy-submit'>Заказать</button>
          </div>
        </form>
        <h3 class='thanks-text title-h3'>Спасибо за заказ, мы свяжемся с Вами в ближайшее время</h3>
      </div>
    </div>
  </div>
</div>
<div id="scrollup">
  <i class="material-icons">keyboard_arrow_up</i>
</div>
<script>
  $("#scrollup").mouseover(function () {
        $(this).animate({opacity: 0.65}, 300)
    }).mouseout(function () {
        $(this).animate({opacity: 1}, 300)
    }).click(function () {
        return $("body,html").animate({scrollTop: 0}, 800), !1
    }), $(window).scroll(function () {
        $(document).scrollTop() > 300 ? jQuery("#scrollup").fadeIn("fast") : jQuery("#scrollup").fadeOut("fast")
    });
</script>
</body></html>