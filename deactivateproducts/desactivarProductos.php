<?php
if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {

    include(dirname(__FILE__).'/../../config/config.inc.php');
    include(dirname(__FILE__).'/../../init.php');

	if ($_POST['caso'] == 1) {
    	$query = Db::getInstance()->Execute('UPDATE '._DB_PREFIX_.'product_shop as p SET p.active=0 
    		WHERE (SELECT count(id_product)=0 FROM '._DB_PREFIX_.'image as i WHERE i.id_product=p.id_product)');
	} else{
		$query = Db::getInstance()->Execute('UPDATE '._DB_PREFIX_.'product_shop as ps JOIN '._DB_PREFIX_.'stock_available
                as sa ON sa.quantity=0 AND id_product_attribute=0 SET active=0 WHERE ps.id_product=sa.id_product');
	}

	if ($query) {
		$total = Db::getInstance()->numRows();
		echo $total;
	}

}
?>