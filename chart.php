<?php
	require_once("tpl.class.php");
	require_once("db.php");
	//查询主题
		$db = new DB();
		$sql = "select * from c_theme order by id desc;";
		$res = $db->execute($sql);
		$smarty->assign("resu",$res);
	//投票
	if(isset($_GET['change_chart'])){
		$s_theme=$_GET['change_chart'];
		$db = new DB();
		$sql = "select * from c_uploads where c_theme='{$s_theme}';";
		$res = $db->execute($sql);
		echo json_encode($res);
		return false;
	}
//展示
	$smarty->display("chart.tpl");
?>