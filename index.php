<?php
	require_once("tpl.class.php");
	require_once("db.php");
	//查询主题
		$db = new DB();
		$sql = "select * from c_theme order by id desc;";
		$res = $db->execute($sql);
		$smarty->assign("resu",$res);
		$smarty->assign("key_theme","请选择投票主题...");
	//查询作品
		$db = new DB();
		$sql = "select * from c_uploads order by id desc;";
		$res = $db->execute($sql);
		$smarty->assign("pic_cool",$res);
	if(isset($_GET['change_theme'])){
		$c_theme=$_GET['change_theme'];
		$db = new DB();
		$sql = "select * from c_uploads where c_theme='{$c_theme}' order by id desc;";
		$res = $db->execute($sql);
		$smarty->assign("pic_cool",$res);
		$smarty->assign("key_theme",$c_theme);
		$smarty->display("index.tpl");
		return false;
	}
	//投票
	if(isset($_GET['add_num'])){
		$id=$_GET['add_num'];
		$db = new DB();
		$sql = "update c_uploads set c_num=c_num+1 where id='{$id}';";
		$res = $db->execute($sql);
		echo "ok";
		return false;
	}
	//参赛
	if(isset($_POST['this_theme'])){
		$this_theme = $_POST['this_theme'];
//生成图片名
	$rans = rand("100","999");
	$now=time();
	$pic_name=$now.$rans;
	$uimg=$_FILES['uimg'];
	$ext=explode('.',$uimg['name']);
	$extName=end($ext);

 //由文件上传导致的错误,终止程序执行 ，重新上传
 if ($_FILES['uimg']['error'] > 0) 
    {echo "<script>alert('上传错误！');history.go(-1);</script>";}else
//移动上传文件到uploads目录
   {
     	move_uploaded_file($_FILES['uimg']['tmp_name'], "./uploads/".$pic_name.".".$extName);//移动文件到指定文件夹uploads；
    	$pic_name=$pic_name.".".$extName;
    	$db = new DB();
		$sql = "insert into c_uploads (c_pic,c_num,c_theme) values ('{$pic_name}','0','{$this_theme}');";
		$res = $db->execute($sql);
    	echo "<script>alert('上传成功！');history.go(-1);</script>";
   }  
		
		return false;
	}
//展示
	$smarty->display("index.tpl");
?>