<?php
	require_once("tpl.class.php");
	require_once("db.php");
	//查询主题
		$db = new DB();
		$sql = "select * from c_theme order by id desc;";
		$res = $db->execute($sql);
		$smarty->assign("resu",$res);
//展示
	$smarty->display("index.tpl");
?>