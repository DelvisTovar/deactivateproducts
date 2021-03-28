<?php 
if (!defined('_PS_VERSION_')) {
	exit;
}

class Deactivateproducts extends Module
{
	
	public function __construct()
	{
		$this->name = 'deactivateproducts';
		$this->tab = 'dashboard';
		$this->version = '1.0.0';
		$this->author = 'Delvis Tovar';
		$this->ps_versions_compliancy = array('min' => '1.6' , 'max' => _PS_VERSION_);
		$this->displayName = 'Desactivar productos';
		$this->description = 'Desactivar productos, sin stock o sin imagenes';
		parent::__construct();
	}

	public function install()
	{
	 	return (parent::install());
	}

	public function uninstall()
	{
		return (parent::uninstall());
	}

	public function getContent()
	{
		return $this->display(__FILE__,'configure.tpl');
	}
}

?>