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
	//删除主题
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
	//发票
	if(isset($_POST['change_piao'])){
		$change_piao = $_POST['change_piao'];
		$db = new DB();
		$sql = "update piao set all_piao='{$change_piao}';";
		$res = $db->execute($sql);
		$db = new DB();
		$sql = "update user_count set piao='';";
		$res = $db->execute($sql);
		echo "ok";
		return false;
	}
//展示
	$smarty->display("system.tpl");
?>