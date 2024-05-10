<?php
include("session.php");
$tablename = "transactions";
$tablekey = "tansid";
$pagename = "income.php";

// Search DATA
if (isset($_GET['fromdate']))
    $fromdate = $_GET['fromdate'];
else
    $fromdate = "";

if (isset($_GET['todate']))
    $todate = $_GET['todate'];
else
    $todate = "";

if (isset($_GET['category']))
    $category = $_GET['category'];
else
    $category = "";


$cond = " where type = 1 ";
if ($fromdate != "" && $todate != "") {
    $cond .= " and cdate between '$fromdate' and '$todate'";
}

if ($category != "") {
    $cond .= " and category = '$category'";
}


?>


<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Income</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<style>
    h1 {
        text-align: center;
        padding-bottom: 50px;
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


<body>
    <?php include("header.php"); ?>

    <!-- As a heading -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <div class="my-3">
                    <nav class="navbar fw-bold justify-content-center mb-5 fs-4" style="background-color: hsl(92, 88%, 65%);">
                        INCOME REPORT
                    </nav>
                    <form class="row g-3" id="myForm" action="" method="get">
                        <div class="form-group mt-3 mb-2">
                            <div class="row">
                                <div class="col-lg-3 col-sm-3 ps-3">
                                    <label class="fw-bolder" for="datepicker">Date: From</label>
                                    <input type="date" class="form-control" id="fromdate" name="fromdate" value="<?php echo $fromdate; ?>">
                                    <b>
                                        <div id="fromdateError" class="formerror"></div>
                                    </b>
                                </div>
                                <div class="col-lg-3 col-sm-3 ps-3">
                                    <label class="fw-bolder " for="datepicker">Date: To</label>
                                    <input type="date" class="form-control" id="todate" name="todate" value="<?php echo $todate; ?>">
                                    <b>
                                        <div id="todateError" class="formerror"></div>
                                    </b>
                                </div>
                                <div class="col-lg-2 col-sm-2">
                                    <label class="fw-bolder" for="category">Category:</label>
                                    <select class="form-select w-100" id="category" name="category" aria-label="Default select example">
                                        <option value="" selected>All Categories</option>
                                        <option value="Salary">Salary</option>
                                        <option value="Business">Business</option>
                                        <option value="Foods">Foods</option>
                                        <option value="Shopping">Shopping</option>
                                        <option value="Loan">Loan</option>
                                        <option value="Debt">Debt</option>
                                        <option value="Gift">Gift</option>
                                        <option value="Others">Others</option>
                                    </select>
                                    <b>
                                        <div id="categoryError" class="formerror"></div>
                                    </b>
                                    <script type="text/javascript">
                                        document.getElementById('category').value = '<?php echo $category; ?>';
                                    </script>
                                </div>
                                <div class="col-lg-2 col-sm-2 mt-4 mb-4 ps-3">
                                    <input type="submit" class="btn btn-warning w-100" value="Search">
                                </div>
                                <div class="col-lg-2 col-sm-2 mt-4 mb-4">
                                    <a class="btn btn-danger w-100" href="income.php">Reset</a>
                                </div>
                            </div>
                        </div>
                    </form>
                    <table class="table table-success table-striped my-3 ps-3">
                        <tbody>
                            <thead>
                                <tr>
                                    <th scope="col">S.No.</th>
                                    <th scope="col">Label</th>
                                    <th scope="col">Categories</th>
                                    <th scope="col">Payment Mode</th>
                                    <th scope="col">Date</th>
                                    <th scope="col" class='text-end'>Amount</th>
                                    <th scope="col">Edit</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                        </tbody>
                        <!-- code for Table -->
                        <?php
                        $sql = "SELECT * FROM `transactions` $cond";
                        $result = mysqli_query($conn, $sql);
                        $tansid = 0;
                        $nettotal = 0;
                        while ($row = mysqli_fetch_assoc($result)) {
                            $tansid = $tansid + 1;
                            $nettotal += $row["amount"];

                            echo " <tr>
                            <th scope='row'>" . $tansid . "</th>
                            <td>" . $row["label"] . "</td>
                            <td>" . $row["category"] . "</td>
                            <td>" . $row["paymentMode"] . "</td>
                            <td>" . $row["cdate"] . "</td>
                            <td class='text-end'>" . $row["amount"] . "</td>

                            <td><a href='home.php?tansid=$row[tansid]' class='btn btn-sm btn-primary'>Edit</a></td>
                             <td><a class='btn btn-sm btn-danger' onclick='delete_record($row[tansid]);'>Delete</a></td>
                            </tr>";
                        }
                        ?>

                        <tr>
                            <td colspan="5">Total Amount</td>
                            <td class="text-end"><?php echo $nettotal; ?></td>
                            <td></td>
                            <td></td>
                        </tr>

                    </table>

                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
    document.getElementById('myForm').addEventListener('submit', function(event) {
        // Reset error messages
        document.getElementById('fromdateError').innerText = '';
        document.getElementById('todateError').innerText = '';
        document.getElementById('categoryError').innerText = '';


        // Validate email
        var fromdate = document.getElementById('fromdate').value;
        var todate = document.getElementById('todate').value;
        var category = document.getElementById('category').value;


        if (fromdate == "") {
            document.getElementById('fromdateError').innerText = 'Please enter the FromDate field';
            event.preventDefault(); // Prevent form submission
        }
        if (todate == "") {
            document.getElementById('todateError').innerText = 'Please enter the ToDate field';
            event.preventDefault(); // Prevent form submission
        }
        if (category == "") {
            document.getElementById('categoryError').innerText = 'Please enter the Category field';
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