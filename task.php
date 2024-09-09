    <?php
    include("session.php");
    $tablename = "task";
    $tablekey = "task_id";
    $pagename = "task.php";



    // Edit/Update Data
    if (isset($_GET['task_id']))
        $task_id = $_GET['task_id'];
    else
        $task_id = 0;

    if ($task_id > 0) {
        // Edit --> Fetch Data
        $sql = "select * from task where task_id = '$task_id'";
        $res = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($res);

        $task_date = $row['task_date'];
        $task_stime = $row['task_stime'];
        $task_etime = $row['task_etime'];
        $task_desc = $row['task_desc'];
        $task_priority = $row['task_priority'];
        $btnvalue = "UPDATE RECORD";
    } else {
        $btnvalue = "ADD NEW RECORD";
        $task_date = "";
        $task_stime = "";
        $task_etime = "";
        $task_desc = "";
        $task_priority = "";
    }

    // Insert --> METHOD for creating data into table
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $task_date = $_POST['task_date'];
        $task_stime = $_POST['task_stime'];
        $task_etime = $_POST['task_etime'];
        $task_desc = $_POST['task_desc'];
        $task_priority = $_POST['task_priority'];

        if ($task_id == 0) {
            $sql = "insert into task set
            task_date = '$task_date',
            task_stime = '$task_stime',
            task_etime = '$task_etime',
            task_desc = '$task_desc',
            task_priority = '$task_priority'";
            $res = mysqli_query($conn, $sql);
        } else {
            // Update
            $sql = "update task set
        task_date = '$task_date',
        task_stime = '$task_stime',
        task_etime = '$task_etime',
        task_desc = '$task_desc',
        task_priority = '$task_priority'
        where task_id='$task_id'";
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
        <title>Task</title>
        <Script defer src="./Script/task.js"></Script>
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
                    <h1 class="">Task</h1><br />
                    <form id="form" action="" method="post">
                        <div class="mb-3">
                            <div class="row g-3 align-items-center">
                                <div class="col-lg-12 col-sm-12">
                                    <div>
                                        <label class="fw-bolder" for="datepicker">Date:</label>
                                        <input type="date" class="form-control" id="date" name="task_date" value="<?php echo $task_date; ?>">
                                        <b>
                                            <div id="dateError" class="formerror"></div>
                                        </b>
                                    </div><br />
                                    <div>
                                        <label class="fw-bolder" for="datepicker">Time:Start</label>
                                        <input type="time" class="form-control" id="fromtime" name="task_stime" value="<?php echo $task_stime; ?>">
                                        <b>
                                            <div id="fromtimeError" class="formerror"></div>
                                        </b>
                                    </div><br />
                                    <div>
                                        <label class="fw-bolder" for="datepicker">Time:End</label>
                                        <input type="time" class="form-control" id="totime" name="task_etime" value="<?php echo $task_etime; ?>">
                                        <b>
                                            <div id="totimeError" class="formerror"></div>
                                        </b>
                                    </div><br />
                                    <div>
                                        <label class="fw-bolder" for="textarea">Description:</label>
                                        <textarea class="form-control" id="desc" name="task_desc" rows="3"><?php echo $task_desc; ?></textarea>
                                        <b>
                                            <div id="descError" class="formerror"></div>
                                        </b>
                                    </div><br />
                                    <div>
                                        <label class="fw-bolder" for="textarea">Task Priority:</label>
                                        <select class="form-select" name="task_priority" id="taskpriority" aria-label="Default select example">
                                            <option value="" selected>Task Level</option>
                                            <option value="low">Low</option>
                                            <option value="medium">Medium</option>
                                            <option value="high">High</option>
                                        </select>
                                        <script type="text/javascript">
                                            document.getElementById("taskpriority").value = "<?php echo $task_priority ?>";
                                        </script>
                                        <b>
                                            <div id="taskpriorityError" class="formerror"></div>
                                        </b>

                                    </div>
                                </div>
                                <input type="hidden" name="task_id" value="<?php echo $task_id ?>">
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
                        <th scope="col">Date</th>
                        <th scope="col">TStart</th>
                        <th scope="col">TEnd</th>
                        <th scope="col">Description</th>
                        <th scope="col">Task Priority</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // <!-- code for fetching Data into Table -->
                    $sql = "SELECT * FROM `task`";
                    $result = mysqli_query($conn, $sql);
                    $task_id = 0;
                    while ($row = mysqli_fetch_assoc($result)) {
                        $task_id = $task_id + 1;
                        echo " <tr>
                    <th scope='row'>" . $task_id . "</th>
                    <td>" . $row["task_date"] . "</td>
                    <td>" . $row["task_stime"] . "</td>
                    <td>" . $row["task_etime"] . "</td>
                    <td>" . $row["task_desc"] . "</td>
                    <td>" . $row["task_priority"] . "</td>
                    <td><a href='task.php?task_id=$row[task_id]' class='btn btn-sm btn-primary'>Edit</a></td>
                    <td><a class='btn btn-sm btn-danger' onclick='delete_record($row[task_id]);'>Delete</a></td>
                </tr>
                ";
                    }
                    ?>
                </tbody>
            </table>
        </div>

    </body>
    <script type="text/javascript">
        document.getElementById('form').addEventListener('submit', function(event) {
            // Reset error messages
            document.getElementById('dateError').innerText = '';
            document.getElementById('fromtimeError').innerText = '';
            document.getElementById('totimeError').innerText = '';
            document.getElementById('descError').innerText = '';
            document.getElementById('taskpriorityError').innerText = '';


            // Validate 
            var date = document.getElementById('date').value;
            var fromtime = document.getElementById('fromtime').value;
            var totime = document.getElementById('totime').value;
            var desc = document.getElementById('desc').value;
            var taskpriority = document.getElementById('taskpriority').value;


            if (date == "") {
                document.getElementById('dateError').innerText = 'Please enter the field';
                event.preventDefault(); // Prevent form submission
            }
            if (fromtime == "") {
                document.getElementById('fromtimeError').innerText = 'Please enter the field';
                event.preventDefault(); // Prevent form submission
            }
            if (totime == "") {
                document.getElementById('totimeError').innerText = 'Please enter the field';
                event.preventDefault(); // Prevent form submission
            }
            if (desc == "") {
                document.getElementById('descError').innerText = 'Please enter the field';
                event.preventDefault(); // Prevent form submission
            }
            if (taskpriority == "") {
                document.getElementById('taskpriorityError').innerText = 'Please enter the field';
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