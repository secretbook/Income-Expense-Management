<?php
include("session.php");
$tablename = "lists";
$tablekey = "todo_id";
$pagename = "todo.php";

// Edit/Update Data
if (isset($_GET['todo_id']))
    $todo_id = $_GET['todo_id'];
else
    $todo_id = 0;

if ($todo_id > 0) {
    $sql = "select * from lists where todo_id = '$todo_id'";
    $res = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($res);
    // print_r($row);
    $todo_text = $row['todo_text'];
    $todo_status = $row['todo_status'];
    $todo_mobile = $row['todo_mobile'];
    $btnvalue = "UPDATE RECORD";
} else {
    $btnvalue = "ADD NEW RECORD";
    $todo_text = "";
    $todo_status = "";
    $todo_mobile = "";
}



// POST Method
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $todo_text = $_POST['todo_text'];
    $todo_status = $_POST['todo_status'];
    $todo_mobile = $_POST['todo_mobile'];

    if ($todo_id == 0) {
        $sql = "insert into lists set
        todo_text = '$todo_text',
        todo_status = '$todo_status',
        todo_mobile = '$todo_mobile'";
        $res = mysqli_query($conn, $sql);
    } else {
        $sql = "update lists set
        todo_text = '$todo_text',
        todo_status = '$todo_status',
        todo_mobile = '$todo_mobile'
        where todo_id='$todo_id'";
        // echo "update lists set
        // todo_text = '$todo_text',
        // todo_status = '$todo_status'
        // where todo_id='$todo_id'"; exit;
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>ToDo</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            background-color: rgb(175, 210, 241);
        }

        h1 {
            text-align: center;
            padding-bottom: 50px;
        }

        .tab-content {
            margin-top: 80px;
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

        .formerror {
            color: red;
        }
    </style>
</head>

<body>
    <?php include("header.php"); ?>

    <!-- Card -->
    <div class="container d-flex justify-content-center align-content-center mt-5 border-radius-rounded shadow">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12 col-sm-12">
                        <h1 class="">ToDo App</h1>
                    </div>
                </div>
                <form id="myForm" action="" method="post">
                    <div class="row justify-content-center">
                        <div class="col-lg-3 col-sm-3">
                            <input type="text" id="text" name="todo_text" class="form-control border-danger-subtle " placeholder="Enter a task here" value="<?php echo $todo_text; ?>" />
                            <b>
                                <div id="textError" class="formerror"></div>
                            </b>
                        </div>
                        <div class="col-lg-3 col-sm-3">
                            <select class="form-select w-20 border-success-subtle" id="status" name="todo_status" aria-label="Default select example">
                                <option value="" selected>Status</option>
                                <option value="In progress">In progess</option>
                                <option value="Completed">Completed</option>
                                <option value="Not required">Not required</option>
                            </select>
                            <script type="text/javascript">
                                document.getElementById("status").value = "<?php echo $todo_status; ?>";
                            </script>
                            <b>
                                <div id="statusError" class="formerror"></div>
                            </b>
                        </div>
                        <div class="col-lg-3 col-sm-3">
                            <input type="text" id="todo_mobile" name="todo_mobile" class="form-control border-danger-subtle " placeholder="Enter a Mobile here" value="<?php echo $todo_mobile; ?>" />
                            <b>
                                <div id="textError" class="formerror"></div>
                            </b>
                        </div>
                        <div class="col-lg-3 col-sm-3">
                            <input type="hidden" name="todo_id" value="<?php echo $todo_id ?>">
                            <input type="submit" class="btn btn-warning w-100" value="<?php echo $btnvalue ?>">
                        </div>
                    </div>
                </form>

                <!-- Table -->
                <div class="tab-content">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">SNo.</th>
                                <th scope="col">Todo item</th>
                                <th scope="col">Status</th>
                                <th scope="col">Mobile</th>
                                <th scope="col">Edit</th>
                                <th scope="col">Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $sql = "SELECT * FROM `lists`";
                            $result = mysqli_query($conn, $sql);
                            $todo_id = 0;
                            while ($row = mysqli_fetch_assoc($result)) {
                                $todo_id = $todo_id + 1;
                                echo "<tr>
                                <th scope='row'>" . $todo_id . "</th>
                                <td>" . $row["todo_text"] . "</td>
                                <td>" . $row["todo_status"] . "</td>
                                <td>" . $row["todo_mobile"] . "</td>
                                <td> <a href='todo.php?todo_id=$row[todo_id]' class='btn btn-primary'>Edit</a></td>
                               <td><a type='button' class='btn btn-danger' onclick='delete_record($row[todo_id]);'>Delete</a></td>
                            </tr>
                            ";
                            }

                            ?>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>
</body>
<script type="text/javascript">
    document.getElementById('myForm').addEventListener('submit', function(event) {
        // Reset error messages
        document.getElementById('textError').innerText = '';
        document.getElementById('statusError').innerText = '';
        // document.getElementById('gettaskError').innerText = '';

        // Validate email
        var text = document.getElementById('text').value;
        var status = document.getElementById('status').value;
        // var gettask = document.getElementById('gettask').value;

        if (text == "") {
            document.getElementById('textError').innerText = 'Please enter the field';
            event.preventDefault(); // Prevent form submission
        }
        if (status == "") {
            document.getElementById('statusError').innerText = 'Please enter the field';
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