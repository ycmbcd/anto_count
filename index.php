<?php
	//开启session
	session_start();
	require_once("tpl.class.php");
	require_once("db.php");
	@$name=$_SESSION['name'];
	if($name==""){
		
	}else{
		$smarty->assign("anto_name",$name);
	}
	//查询主题
		$db = new DB();
		$sql = "select * from c_theme order by id desc;";
		$res = $db->execute($sql);
		$smarty->assign("resu",$res);
		$smarty->assign("key_theme","请选择投票主题...");
	//注册
	if(isset($_GET['regist'])){
		$name=$_GET['regist'];
		$pwd=$_GET['pwd'];
		$re_pwd=$_GET['re_pwd'];
		$db = new DB();
		$sql = "insert into user_count(name,pwd,re_pwd,piao) values('{$name}','{$pwd}','{$re_pwd}','0');";
		$res = $db->execute($sql);
		echo "ok";
		return false;
	}
	//登录
	if(isset($_GET['login'])){
		$name=$_GET['login'];
		$pwd=$_GET['pwd'];
		$db = new DB();
		$sql = "select * from user_count where name='{$name}' and pwd='{$pwd}';";
		$res = $db->execute($sql);
		if(empty($res)){
			echo 0;
			return false;
		}else{
			$_SESSION['name'] = $name;
			echo "ok";
			return false;
			//写入日志！！！
		}
	}
	//默认无作品
		$smarty->assign("pic_cool",0);
	//默认显示主题
		$db = new DB();
		$sql = "select * from c_theme order by id desc;";
		$res = $db->execute($sql);
		$smarty->assign("re_theme",$res);
	//切换主题
	if(isset($_GET['change_theme'])){
		$c_theme=$_GET['change_theme'];
		$db = new DB();
		$sql = "select * from c_uploads where c_theme='{$c_theme}' order by id desc;";
		$res = $db->execute($sql);
		$smarty->assign("pic_cool",$res);
		$smarty->assign("key_theme",$c_theme);
		if($name==""){
			$smarty->display("index.tpl");
			return false;
		}else{
			//选出已经投票过的
			$db = new DB();
			$sql = "select * from user_count where name='{$name}';";
			$res = $db->execute($sql);
			foreach($res as $value);
		    $piao = $value['piao'];
		    $smarty->assign("piao",$piao);
		    $smarty->display("index.tpl");
			return false;
		}
	}
	//投票
	if(isset($_GET['add_num'])){
		if($name==""){
			return false;
		}else{
			$id=$_GET['add_num'];
			$db = new DB();
			$sql = "select * from user_count where name='{$name}';";
			$res = $db->execute($sql);
			foreach($res as $value);
			$piao = $value['piao'];
			//查看剩余票数
			$arr_piao = explode(",", $piao); 
		 	$aa = count($arr_piao);
		 	//查询每个人总票数
		 	$db = new DB();
			$sql = "select * from piao;";
			$res = $db->execute($sql);
			foreach($res as $value);
			$all_piao = $value['all_piao'];
			if($all_piao < $aa){
				echo "nopiao";
				return false;
			}else{
				//可以投票
				$hasnt = strpos($piao,$id);
				if($hasnt==""){
					$db = new DB();
					$sql = "update c_uploads set c_num=c_num+1 where id='{$id}';";
					$res = $db->execute($sql);
					$db = new DB();
					$piao = $piao.",".$id;
					$db = new DB();
					$sql = "update user_count set piao='{$piao}' where name='{$name}';";
					$res = $db->execute($sql);
					echo "ok";
				}else{
					echo "hasding";
				}
				return false;
			}
		}
	}
	//选数
	if(isset($_GET['select_num'])){
		$id = $_GET['select_num'];
		$db = new DB();
		$sql = "select c_num from c_uploads where id='{$id}';";
		$res = $db->execute($sql);
		foreach($res as $value);
		$c_num = $value['c_num'];
		echo $c_num;
		return false;
	}
	//参赛
if(isset($_POST['this_theme'])){
if($name==""){
			echo "<script>alert('请登录！');history.go(-1);</script>";
			return false;
}else{
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
		$sql = "insert into c_uploads (c_pic,c_num,c_theme,c_who) values ('{$pic_name}','0','{$this_theme}','{$name}');";
		$res = $db->execute($sql);
    	echo "<script>alert('上传成功，请刷新！');history.go(-1);</script>";
   }  
		
		return false;
	}
}
	//退出系统
	if(isset($_GET['logout'])){
		echo "<script>window.location='index.php';</script>";
		session_destroy();
		return false;
	}
//展示
	$smarty->display("index.tpl");
?>