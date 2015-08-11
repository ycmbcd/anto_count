<?php
	require_once("tpl.class.php");
	require_once("db.php");
	//查询主题
		$db = new DB();
		$sql = "select * from c_theme order by id desc;";
		$res = $db->execute($sql);
		$smarty->assign("resu",$res);
	//新建主题
	if(isset($_POST['new_theme'])){
		$new_theme = $_POST['new_theme'];
		$db = new DB();
		$sql = "insert into c_theme (theme) values ('{$new_theme}');";
		$res = $db->execute($sql);
		echo "ok";
		return false;
	}
	//新建主题
	if(isset($_POST['del_theme'])){
		$del_theme = $_POST['del_theme'];
		$db = new DB();
		$sql = "delete from c_theme where theme='{$del_theme}';";
		$res = $db->execute($sql);
		$db = new DB();
		$sql = "delete from c_uploads where c_theme='{$del_theme}';";
		$res = $db->execute($sql);
		echo "ok";
		return false;
	}
//展示
	$smarty->display("system.tpl");
?>