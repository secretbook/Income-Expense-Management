<?php
include("session.php");
$tablename = "demo";
$tablekey = "demo_id";
$pagename = "demo3.php";



// Edit/Update Data
if (isset($_GET['demo_id']))
  $demo_id = $_GET['demo_id'];
else
  $demo_id = 0;

if (isset($_GET['todo_id']))
  $todo_id = $_GET['todo_id'];
else
  $todo_id = "";

if ($demo_id > 0) {
  $sql = "select * from demo where demo_id = '$demo_id'";
  $res = mysqli_query($conn, $sql);
  $row = mysqli_fetch_array($res);

  $todo_id = $row['todo_id'];
  $status = $row['status'];
  $btnvalue = "UPDATE RECORD";
} else {
  $btnvalue = "ADD NEW RECORD";
  $todo_id = "";
  $status = "";
}

// METHOD for creating data into table
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $todo_id = $_POST['todo_id'];
  $status = $_POST['status'];

  if ($demo_id == 0) {
    $sql = "insert into demo set
            todo_id = '$todo_id',status = '$status'";
    $res = mysqli_query($conn, $sql);
  } else {
    $sql = "update demo set
        todo_id = '$todo_id', status = '$status'
        where demo_id='$demo_id'";
    $res = mysqli_query($conn, $sql);
  }
  echo "<script>location='$pagename'</script>";
}
?>



<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>demo</title>
  <Script defer src="./Script/demo.js"></Script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

  <!-- Form -->
  <div class="container d-flex justify-content-center align-content-center">
    <div class="card bg-body-secondary w-50 mx-3 my-3 p-3 mt-5 ">
      <div class="card-body">
        <h1 class="">Get One Filter</h1><br />
        <form id="form" action="" method="post">
          <div class="mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-lg-12 col-sm-12">
                <div>
                  <label class="fw-bolder" for="textarea">Todo Heading</label>
                  <select class="form-select" name="todo_id" id="todo_id" aria-label="Default select example">
                    <option value="" selected>--Todo Heading--</option>
                    <?php
                    // Fetch data from the 'todo' table
                    $sql = "SELECT * FROM `lists`";
                    $result = mysqli_query($conn, $sql);

                    // Loop through the results to generate options
                    while ($row = mysqli_fetch_assoc($result)) {
                      // Generate an option for each row in the 'todo' table
                      // Check if this option matches the todo_id of the record being edited
                      $selected = ($row['todo_id'] == $todo_id) ? "selected" : "";
                      echo "<option value='" . $row['todo_id'] . "' $selected>" . $row['todo_text'] . "</option>";
                    }
                    ?>
                  </select>
                  <b>
                    <div id="todo_idError" class="formerror"></div>
                  </b>
                </div><br />
                <div>
                  <label class="fw-bolder" for="status">Todo Status</label>
                  <input type="text" class="form-control" id="status" name="status" value="<?php echo $status; ?>">
                  <b>
                    <div id="statusError" class="formerror"></div>
                  </b>
                </div><br />
                
              </div>
              <input type="hidden" name="demo_id" value="<?php echo $demo_id ?>">
              <input type="submit" class="btn btn-primary width=100%" value="<?php echo $btnvalue ?>">
            </div>
          </div>
        </form>
      </div>

    </div>
  </div>

  <!-- code for Table -->
  <div class="tab-content">
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">No.</th>
          <th scope="col">Todo Heading</th>
          <th scope="col">Status</th>
          <th scope="col">Edit</th>
          <th scope="col">Delete</th>
        </tr>
      </thead>
      <tbody>
        <?php
        // <!-- code for Table -->
        $sql = "SELECT * FROM `demo`";
        $result = mysqli_query($conn, $sql);
        $demo_id = 0;
        while ($row = mysqli_fetch_assoc($result)) {
          $demo_id = $demo_id + 1;
          // Fetch todo_text from the 'lists' table using todo_id from the 'demo' table
          $todo_sql = "SELECT todo_text FROM `lists` WHERE todo_id = '" . $row['todo_id'] . "'";
          $todo_result = mysqli_query($conn, $todo_sql);
          $todo_row = mysqli_fetch_assoc($todo_result);
          // Display the todo_text in the table
          echo " <tr>
                    <th scope='row'>" . $demo_id . "</th>
                    <td>" . $todo_row['todo_text'] . "</td>
                    <td>" . $row['status'] . "</td>
                    <td><a href='demo.php?demo_id=$row[demo_id]' class='btn btn-sm btn-primary'>Edit</a></td>
                    <td><a class='btn btn-sm btn-danger' onclick='delete_record($row[demo_id]);'>Delete</a></td>
                </tr>
                ";
        }
        ?>
      </tbody>
    </table>
  </div>

</body>

<!-- <script type="text/javascript">
  function getData(todo_id) {
    // Make an AJAX request to fetch status and mobile based on the selected todo_id
    $.ajax({
      type: 'POST',
      url: 'fetch_data.php', // PHP script to fetch status and mobile based on todo_id
      data: {
        todo_id: todo_id
      },
      success: function(response) {
        alert(response);
        // Parse the JSON response
        var data = JSON.parse(response);
        
        // Update the status field with the fetched status
        $('#status').val(data.todo_status);
        
        // Update the mobile field with the fetched mobile number
        $('#mobile').val(data.todo_mobile);
      }
    });
  }
</script> -->
<script type="text/javascript">
  function getData(todo_id) {
    // Make an AJAX request to fetch status based on the selected todo_id
    $.ajax({
      type: 'POST',
      url: 'ajax_fetch_status.php', // PHP script to fetch status based on todo_id
      data: {
        todo_id: todo_id
      },
      success: function(response) {
        // Update the status field with the fetched data
        $('#status').val(response);
      }
    });
  }
</script>


<script type="text/javascript">
  document.getElementById('form').addEventListener('submit', function(event) {
    // Reset error messages

    document.getElementById('todo_idError').innerText = '';
    document.getElementById('status').innerText = '';

    // Validate 
    var todo_id = document.getElementById('todo_id').value;
    var status = document.getElementById('status').value;


    if (todo_id == "") {
      document.getElementById('todo_idError').innerText = 'Please enter the field';
      event.preventDefault(); // Prevent form submission
    }
    if (status == "") {
      document.getElementById('statusError').innerText = 'Please enther the field';
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