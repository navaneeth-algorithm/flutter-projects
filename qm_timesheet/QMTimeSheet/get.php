 <?php
  
  require_once("dbConnectRemote.php");
	
  $result = 0;
  if(isset($_POST["type"])){
        if($_POST["type"]=='Employee'){
          $PhNo = $_POST['phonenumber'];
          $password = $_POST['password'];
          $shaPassword = sha1($password);
          $sql = "SELECT * FROM Employee where MobileNumber='".$PhNo."' and Password='".$shaPassword."'";
        //$sql = "SELECT * FROM Client where RespPersonPhNo='7349045236' and RespPersonPassword='123'";
          $queryResult = mysqli_query($dbcon, $sql) or die(mysqli_error($dbcon));
          $result = array();
        //$row = mysqli_fetch_assoc($queryResult);
        //while($fetchData=$queryResult->fetch_assoc(){
        //	$result[] = $fetchData;
        //}
        while($row = mysqli_fetch_assoc($queryResult)) {
          $result[]=$row;
        }
    }
    elseif($_POST["type"]=='Attendance'){


          $entry = $_POST['entry'];
          $employeeid = $_POST['employeeid'];
          $currentdate = $_POST['currentDate'];
          $currentTime = $_POST['currentTime'];
          if($entry==1)
          {
            $sql = "SELECT COUNT(Id) as InCount FROM Attendance where `EmployeeId`=".$employeeid." AND `Dates` = "."'".$currentdate."'"."AND `Type`=1";
          }
          else{
            $sql = "SELECT COUNT(Id) as OutCount FROM Attendance where `EmployeeId`=".$employeeid." AND `Dates` = "."'".$currentdate."'"."AND `Type`=2";
          }

          $queryResult = mysqli_query($dbcon, $sql) or die(mysqli_error($dbcon));
          $result = array();
          while($row = mysqli_fetch_assoc($queryResult)) {
            $result[]=$row;
          }
    }
    else if($_POST["type"]=="other")
    {
      $result = "Good Work";
    }
  }
  
  echo json_encode($result);
  ?>
