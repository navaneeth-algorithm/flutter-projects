<?php
  
  require_once("dbConnectRemote.php");
	
  $result = 0;
  //$result = array("a"=>1,"b"=>4);
  //$json = file_get_contents('php://input');
  //$data = json_decode($json);
  if($_POST["check"]=="5")
  {
      $result = array("checkin"=>1,"checkout"=>2);
  }
  echo json_encode($result);
  ?>
