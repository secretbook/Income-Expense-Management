<?php
include("session.php");
$tablename = "demo";
$tablekey = "demo_id";
$pagename = "test1.php";



// Edit/Update Data
if (isset($_GET['demo_id']))
  $demo_id = $_GET['demo_id'];
else
  $demo_id = 0;

if (isset($_GET['todo_id']))
  $todo_id = $_GET['todo_id'];
else
  $todo_id = "";



$description = "";
$btnvalue = "Cancelled";
// if ($demo_id > 0) {
//   $sql = "select * from demo where demo_id = '$demo_id'";
//   $res = mysqli_query($conn, $sql);
//   $row = mysqli_fetch_array($res);

//   $todo_id = $row['todo_id'];
//   $description = $row['description'];
//   $btnvalue = "UPDATE RECORD";
// } else {
//   $btnvalue = "ADD NEW RECORD";
//   $todo_id = "";
// $description = "";
// }

// METHOD for creating data into table
// if ($_SERVER['REQUEST_METHOD'] == 'POST') {
//   $todo_id = $_POST['todo_id'];
//   $description = $_POST['description'];

//   if ($demo_id > 0) {
//     $sql = "insert into demo set
//             description = '$description',is_cancelled = 'cancelled'
//             where todo_id='$todo_id'";
//     $res = mysqli_query($conn, $sql);
//   } else {
//     if ($demo_id > 0) {
//     $sql = "update demo set
//         description = '$description',is_cancelled = 'cancelled'
//         where todo_id='$todo_id'";
//     $res = mysqli_query($conn, $sql);
//     }
//   }
//   echo "<script>location='$pagename'</script>";
// }

// METHOD for creating data into table
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $todo_id = $_POST['todo_id'];
  $description = $_POST['description'];

  if ($demo_id > 0) {
    // Update existing record
    $sql = "UPDATE demo SET
     
            description = '$description', 
            is_cancelled = 'cancelled'
            WHERE demo_id='$demo_id' and todo_id='$todo_id'";
    $res = mysqli_query($conn, $sql);

    // Check if the query was successful
    if ($res) {
      echo "<script>alert('Record updated successfully');</script>";
      echo "<script>location='$pagename'</script>";
    } else {
      echo "<script>alert('Error updating record: " . mysqli_error($conn) . "');</script>";
    }
  }
}
?>



<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>demo</title>
  <!-- <Script defer src="./Script/demo.js"></Script> -->
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
                  <select class="form-select" name="todo_id" id="todo_id" aria-label="Default select example" onchange="getData(this.value);">
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
                  <label class="fw-bolder" for="description">Todo description</label>
                  <textarea class="form-control" id="description" name="description"><?php echo $description; ?></textarea>
                  <b>
                    <div id="descriptionError" class="formerror"></div>
                  </b>
                </div><br />

              </div>
              <input type="hidden" name="demo_id" value="<?php echo $demo_id ?>">
              <!-- <input type="submit" class="btn btn-primary width=100%" value="<?php echo $btnvalue ?>"> -->
              <td><a href='test1.php?todo_id=' type="submit" class='btn btn-sm btn-primary'>Cancelled</a></td>
            </div>
          </div>
        </form>
      </div>

    </div>
  </div>

  <!-- code for Table -->


</body>


<script type="text/javascript">
  function getData(todo_id) {
    // if($todo_id>0)
    location = "test1.php?todo_id=" + todo_id;
    //  else
    //  location = "test1.php";
  }
</script>


<script type="text/javascript">
  document.getElementById('form').addEventListener('submit', function(event) {
    // Reset error messages

    document.getElementById('todo_idError').innerText = '';
    document.getElementById('description').innerText = '';

    // Validate 
    var todo_id = document.getElementById('todo_id').value;
    var description = document.getElementById('description').value;


    if (todo_id == "") {
      document.getElementById('todo_idError').innerText = 'Please enter the field';
      event.preventDefault(); // Prevent form submission
    }
    if (description == "") {
      document.getElementById('descriptionError').innerText = 'Please enther the field';
    }
  });

  // ajax delete code
  function delete_record(keyvalue) {

    var tablename = "<?php echo $tablename; ?>";
    var tablekey = "<?php echo $tablekey; ?>";

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.description == 200) {
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