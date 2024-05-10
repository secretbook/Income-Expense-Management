<?php
include("session.php");
$tablename = "rem";
$tablekey = "rem_id";
$pagename = "reminder.php";


// Edit/Update Data
if (isset($_GET['rem_id']))
  $rem_id = $_GET['rem_id'];
else
  $rem_id = 0;



if ($rem_id > 0) {
  $sql = "select * from rem where rem_id='$rem_id'";
  $res = mysqli_query($conn, $sql);
  $row = mysqli_fetch_array($res);

  $rem_start =  $row['rem_start'];
  $rem_end  = $row['rem_end'];
  $rem_desc = $row['rem_desc'];
  $btnvalue = "UPDATE RECORD";
} else {
  $btnvalue = "ADD NEW RECORD";
  $rem_start = "";
  $rem_end  = "";
  $rem_desc = "";
}


if ($_SERVER['REQUEST_METHOD'] == 'POST') {

  // variables to be inserted into the table
  $rem_start = $_POST['rem_start'];
  $rem_end = $_POST['rem_end'];
  $rem_desc = $_POST['rem_desc'];
  $rem_id = $_POST['rem_id'];

  if ($rem_start != "" && $rem_desc != "") {

    if ($rem_id == 0) {
      $sql = "insert into rem set
        rem_start = '$rem_start',
        rem_end = '$rem_end',
        rem_desc = '$rem_desc'";
      $result = mysqli_query($conn, $sql);
       // Clear input field variables after successful insertion
      //  $rem_start = "";
      //  $rem_end = "";
      //  $rem_desc = "";
      //  $rem_id = 0;
    } else {
      $sql = "update rem set
        rem_start = '$rem_start',
        rem_end = '$rem_end',
        rem_desc = '$rem_desc'
        where rem_id='$rem_id'";
      $result = mysqli_query($conn, $sql);
      
    }
  }
  echo "<script>location='$pagename'</script>";
}
?>


<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Reminder</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<style>
  body {
    background-color: lightblue;
  }

  ul {
    gap: 25px;
  }

  li a.active {
    background-color: rgb(245, 243, 118);
    color: white;
  }

  li a:hover:not(.active) {
    background-color: #f42828;
    color: white;
  }

  h1 {
    text-align: center;
    padding-bottom: 10px;
  }

  card-content {
    display: flex;
    justify-content: center;
    text-align: center;
    width: 50px;
  }

  .tab-content {
    margin: 50px;
    text-align: center;
  }

  .formerror {
    color: red;
  }
</style>

<body>
  <?php include("header.php"); ?>

  <!-- Container -->
  <div class="container d-flex justify-content-center align-content-center">
    <div class="card bg-body-secondary w-50 mx-3 my-3 p-3 mt-5 ">
      <div class="card-body">
        <h1 class="">Reminder</h1><br />
        <!-- Form -->
        <form id="form" action="" method="post">
          <div class="mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-lg-12 col-sm-12">
                <div class="">
                  <label class="fw-bolder" for="datepicker">Date: From</label>
                  <input type="date" class="form-control" id="fromdate" name="rem_start" value="<?php echo $rem_start; ?>">
                  <b>
                    <div id="fromdateError" class="formerror"></div>
                  </b>
                </div><br />
                <!-- </div> -->
                <!-- <div class="col-6 "> -->
                <div>
                  <label class="fw-bolder" for="datepicker">Date: To</label>
                  <input type="date" class="form-control" id="todate" name="rem_end" value="<?php echo $rem_end; ?>">
                  <b>
                    <div id="todateError" class="formerror"></div>
                  </b>
                </div><br />
                <div>
                  <label class="fw-bolder" for="textarea">Description</label>
                  <textarea class="form-control" id="desc" name="rem_desc" rows="3"><?php echo $rem_desc; ?></textarea>
                  <b>
                    <div id="descError" class="formerror"></div>
                  </b>
                </div>
              </div class="col-lg-12 col-sm-12">
              <input type="hidden" name="rem_id" value="<?php echo $rem_id ?>">
              <input type="submit" class="btn btn-primary width=100%" value="<?php echo $btnvalue; ?>">
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- table content -->
  <div class="tab-content">
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">No.</th>
          <th scope="col">Date: Start</th>
          <th scope="col">Date: End</th>
          <th scope="col">Description</th>
          <th scope="col">Edit</th>
          <th scope="col">Delete</th>
        </tr>
      </thead>
      <tbody>
        <!-- code for Table -->
        <?php
        // $sql = "SELECT * FROM `rem` order by rem_id desc";  // data showing in descending order in table
        // Show data into table
        $sql = "SELECT * FROM `rem` ";
        $result = mysqli_query($conn, $sql);
        $rem_id = 0;
        while ($row = mysqli_fetch_assoc($result)) {
          $rem_id = $rem_id + 1;
          echo "<tr>
          <th scope='row'>" . $rem_id . "</th>
          <td>" . $row["rem_start"] . "</td>
          <td>" . $row["rem_end"] . "</td>
          <td>" . $row["rem_desc"] . "</td>
          <td><a href='reminder.php?rem_id=$row[rem_id]' class='btn btn-sm btn-primary'>Edit</a></td>
          <td><a class='btn btn-sm btn-danger' onclick='delete_record($row[rem_id]);'  >Delete</a></td>
        </tr>
        ";
        }
        ?>
      </tbody>
    </table>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
  </script>
</body>
<script type="text/javascript">
  document.getElementById('form').addEventListener('submit', function(event) {
    // Reset error messages
    document.getElementById('fromdateError').innerText = '';
    document.getElementById('todateError').innerText = '';
    document.getElementById('descError').innerText = '';


    // Validate 
    var fromdate = document.getElementById('fromdate').value;
    var todate = document.getElementById('todate').value;
    var desc = document.getElementById('desc').value;


    if (fromdate == "") {
      document.getElementById('fromdateError').innerText = 'Please enter the fromdate field';
      event.preventDefault(); // Prevent form submission
    }
    if (todate == "") {
      document.getElementById('todateError').innerText = 'Please enter the todate field';
      event.preventDefault(); // Prevent form submission
    }
    if (desc == "") {
      document.getElementById('descError').innerText = 'Please enter the description field';
      event.preventDefault(); // Prevent form submission
    }
  });

  // ajax delete code
  function delete_record(keyvalue) {

var tablename = "<?php echo $tablename; ?>";
var tablekey = "<?php echo $tablekey; ?>";

var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        //document.getElementById("demo").innerHTML = this.responseText;
        // alert(this.responseText);
        alert("Data deleted successfully ?");
        location = '<?php echo $pagename; ?>';
    }
};

xhttp.open("GET", "ajax_delete_record.php?keyvalue=" + keyvalue + "&tablename=" + tablename + "&tablekey=" + tablekey, true);
xhttp.send();

}
</script>

</html>