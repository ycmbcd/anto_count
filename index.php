<?php
	require_once("tpl.class.php");
	require_once("db.php");
	//查询主题
		$db = new DB();
		$sql = "select * from c_theme order by id desc;";
		$res = $db->execute($sql);
		$smarty->assign("resu",$res);
	//参赛
	if(isset($_POST['this_theme'])){
		$this_theme = $_POST['this_theme'];
		$this_theme = $_POST['this_theme'];
		//开始上传文件功能
if(@$_POST['submit']=="yes")

 //由文件上传导致的错误,终止程序执行 ，重新上传
 if ($_FILES['uimg']['error'] > 0) 
    {echo "<script>alert('上传错误！');history.go(-1);</script>";}else
//移动上传文件到uploads目录

   {
     move_uploaded_file($_FILES['myfile']['tmp_name'], "./uploads/.csv");//移动文件到指定文件夹uploads；
    echo "<script>alert('上传成功！');window.location='insert.php';</script>";
   }  
}
		/*$db = new DB();
		$sql = "insert into c_theme (theme) values ('{$new_theme}');";
		$res = $db->execute($sql);*/
		echo "<script>alert(1)</script>";
		return false;
	}
//展示
	$smarty->display("index.tpl");
?>