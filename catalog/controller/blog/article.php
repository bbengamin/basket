<?php
class ControllerBlogArticle extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('blog/article');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

        $data['breadcrumbs'][] = array(
            'text' => $this->config->get('easy_blog_home_page_meta_title'),
            'href' => $this->url->link('blog/blog')
        );


		if (isset($this->request->get['search'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('blog/search', $url)
			);
		}

		if (isset($this->request->get['article_id'])) {
			$article_id = (int)$this->request->get['article_id'];
		} else {
			$article_id = 0;
		}

		$this->load->model('blog/article');
		$this->load->model('tool/image');

		$article_info = $this->model_blog_article->getArticle($article_id);

		if ($article_info) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $article_info['name'],
				'href' => $this->url->link('blog/article', $url . '&article_id=' . $this->request->get['article_id'])
			);

			//$this->document->setTitle($article_info['meta_title']);
			if($article_info['meta_title']){
				$this->document->setTitle($article_info['meta_title']);
			}else{
				preg_match_all("/\{(.+?)\}/", $article_info['template_title'], $array_title);
				$template_title = $article_info['template_title'];
				foreach ($array_title[0] as $index => $value) {
					$template_title = str_replace($value, $article_info[$array_title[1][$index]], $template_title);
				}
				$this->document->setTitle($template_title);
			}
			
			//$this->document->setDescription($article_info['meta_description']);
			if($article_info['meta_description']){
				$this->document->setTitle($article_info['meta_description']);
			}else{
				preg_match_all("/\{(.+?)\}/", $article_info['template_description'], $array_description);
				$template_description = $article_info['template_description'];
				foreach ($array_description[0] as $index => $value) {
					$template_description = str_replace($value, $article_info[$array_description[1][$index]], $template_description);
				}
				$this->document->setTitle($template_description);
			}
			
			$this->document->setKeywords($article_info['meta_keyword']);
			$this->document->addLink($this->url->link('blog/article', 'article_id=' . $this->request->get['article_id']), 'canonical');

			//$data['heading_title'] = $article_info['name'];
			if ($article_info['h1']) {
				$data['heading_title'] = $article_info['h1'];
			} else {
				preg_match_all("/\{(.+?)\}/", $article_info['template_h1'], $array_h1);
				$template_h1 = $article_info['template_h1'];
				foreach ($array_h1[0] as $index => $value) {
					$template_h1 = str_replace($value, $article_info[$array_h1[1][$index]], $template_h1);
				}
				$data['heading_title'] = $template_h1;
			}
			
            $data['image'] = $this->model_tool_image->resize("no_image.png", $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
            $data['date_m'] = date("Y-m-dTH:i:s +3", strtotime($article_info['date_modified']));
            $data['date'] = date($this->language->get('date_format_short'), strtotime($article_info['date_modified']));
			$data['article_id'] = (int)$this->request->get['article_id'];

			$data['description'] = html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8');

			/*preg_match_all("/\{(.+?)\}/", $article_info['template_title'], $array_title);
			$template_title = $article_info['template_title'];
			foreach ($array_title[0] as $index => $value) {
				$template_title = str_replace($value, $article_info[$array_title[1][$index]], $template_title);
			}
			
			preg_match_all("/\{(.+?)\}/", $article_info['template_description'], $array_description);
			$template_description = $article_info['template_description'];
			foreach ($array_description[0] as $index => $value) {
				$template_description = str_replace($value, $article_info[$array_description[1][$index]], $template_description);
			}
			
			preg_match_all("/\{(.+?)\}/", $article_info['template_h1'], $array_h1);
			$template_h1 = $article_info['template_h1'];
			foreach ($array_h1[0] as $index => $value) {
				$template_h1 = str_replace($value, $article_info[$array_h1[1][$index]], $template_h1);
			}*/

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/article.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/blog/article.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/blog/article.tpl', $data));
			}
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('blog/article', $url . '&article_id=' . $article_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}

}
