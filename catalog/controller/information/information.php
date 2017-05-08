<?php
class ControllerInformationInformation extends Controller {
	public function index() {
		$this->load->language('information/information');

		$this->load->model('catalog/information');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			
			//$this->document->setTitle($information_info['meta_title']);
			if($information_info['meta_title']){
				$this->document->setTitle($information_info['meta_title']);
			}else{
				preg_match_all("/\{(.+?)\}/", $information_info['template_title'], $array_title);
				$template_title = $information_info['template_title'];
				foreach ($array_title[0] as $index => $value) {
					$template_title = str_replace($value, $product_info[$array_title[1][$index]], $template_title);
				}
				$this->document->setTitle($template_title);
			}
			
			
			//$this->document->setDescription($information_info['meta_description']);
			if($information_info['meta_description']){
				$this->document->setTitle($information_info['meta_description']);
			}else{
				preg_match_all("/\{(.+?)\}/", $information_info['template_description'], $array_description);
				$template_description = $information_info['template_description'];
				foreach ($array_description[0] as $index => $value) {
					$template_description = str_replace($value, $product_info[$array_description[1][$index]], $template_description);
				}
				$this->document->setTitle($template_description);
			}
			
			$this->document->setKeywords($information_info['meta_keyword']);

			$data['breadcrumbs'][] = array(
				'text' => $information_info['title'],
				'href' => $this->url->link('information/information', 'information_id=' .  $information_id)
			);

			//$data['heading_title'] = $information_info['title'];
			if ($information_info['h1']) {
				$data['heading_title'] = $information_info['h1'];
			} else {
				preg_match_all("/\{(.+?)\}/", $information_info['template_h1'], $array_h1);
				$template_h1 = $information_info['template_h1'];
				foreach ($array_h1[0] as $index => $value) {
					$template_h1 = str_replace($value, $product_info[$array_h1[1][$index]], $template_h1);
				}
				$data['heading_title'] = $template_h1;
			}

			$data['button_continue'] = $this->language->get('button_continue');

			$data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			
			/*preg_match_all("/\{(.+?)\}/", $information_info['template_title'], $array_title);
			$template_title = $information_info['template_title'];
			foreach ($array_title[0] as $index => $value) {
				$template_title = str_replace($value, $information_info[$array_title[1][$index]], $template_title);
			}
			
			preg_match_all("/\{(.+?)\}/", $information_info['template_description'], $array_description);
			$template_description = $information_info['template_description'];
			foreach ($array_description[0] as $index => $value) {
				$template_description = str_replace($value, $information_info[$array_description[1][$index]], $template_description);
			}
			
			preg_match_all("/\{(.+?)\}/", $information_info['template_h1'], $array_h1);
			$template_h1 = $information_info['template_h1'];
			foreach ($array_h1[0] as $index => $value) {
				$template_h1 = str_replace($value, $information_info[$array_h1[1][$index]], $template_h1);
			}*/

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/information.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/information.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/information.tpl', $data));
			}
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('information/information', 'information_id=' . $information_id)
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

	public function agree() {
		$this->load->model('catalog/information');

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$output = '';

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
		}

		$this->response->setOutput($output);
	}
}