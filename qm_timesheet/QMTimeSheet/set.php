<?php
  
  require_once("dbConnectRemote.php");
  if($_POST["type"]=='Attendance'){


    $entry = $_POST['entry'];
    $employeeid = $_POST['employeeid'];

    $currentdate = $_POST['currentDate'];

    $currenttime = $_POST['currentTime'];


    $sql ="INSERT INTO `Attendance`(`EmployeeId`,`Dates`,`Time`,`Type`) VALUES ($employeeid,'$currentdate','$currenttime',$entry)";



    //$sql = "SELECT * FROM Attendance where `EmployeeId`=".$employeeid." and `Type`=".$entry." and `Dates` ='".$currentdate."'";
    $queryResult = mysqli_query($dbcon, $sql) or die(mysqli_error($dbcon));
    
    $result["errorsuccess"] = $queryResult;
    echo json_encode($result);
    //$result = array();
    //while($row = mysqli_fetch_assoc($queryResult)) {
      //$result[]=$row;
    //}
}

?>
