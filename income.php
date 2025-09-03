<?php
    include "session.php";
    $tablename = "transactions";
    $tablekey  = "tansid";
    $pagename  = "income.php";

    // Search DATA
    if (isset($_GET['fromdate'])) {
        $fromdate = $_GET['fromdate'];
    } else {
        $fromdate = "";
    }

    if (isset($_GET['todate'])) {
        $todate = $_GET['todate'];
    } else {
        $todate = "";
    }

    if (isset($_GET['category'])) {
        $category = $_GET['category'];
    } else {
        $category = "";
    }

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
    <?php include "header.php"; ?>

    <!-- As a heading -->
<div class="container my-4">
  <div class="row">
    <div class="col-12">

      <!-- Page Title -->
      <nav class="navbar fw-bold justify-content-center fs-4 mb-4 shadow-sm rounded"
           style="background-color: hsl(92, 88%, 65%);">
        INCOME REPORT
      </nav>

      <!-- Filter Form -->
      <form class="row g-3" id="myForm" action="" method="get">
        <div class="col-md-3">
          <label for="fromdate" class="form-label fw-bold">Date: From</label>
          <input type="date" class="form-control" id="fromdate" name="fromdate"
                 value="<?php echo $fromdate; ?>">
          <div id="fromdateError" class="formerror fw-bold text-danger small"></div>
        </div>

        <div class="col-md-3">
          <label for="todate" class="form-label fw-bold">Date: To</label>
          <input type="date" class="form-control" id="todate" name="todate"
                 value="<?php echo $todate; ?>">
          <div id="todateError" class="formerror fw-bold text-danger small"></div>
        </div>

        <div class="col-md-2">
          <label for="category" class="form-label fw-bold">Category</label>
          <select class="form-select" id="category" name="category">
            <option value="">All Categories</option>
            <option value="Salary">Salary</option>
            <option value="Business">Business</option>
            <option value="Foods">Foods</option>
            <option value="Shopping">Shopping</option>
            <option value="Loan">Loan</option>
            <option value="Debt">Debt</option>
            <option value="Gift">Gift</option>
            <option value="Others">Others</option>
          </select>
          <script>
            document.getElementById("category").value = "<?php echo $category; ?>";
          </script>
          <div id="categoryError" class="formerror fw-bold text-danger small"></div>
        </div>

        <div class="col-md-2 d-flex align-items-end">
          <button type="submit" class="btn btn-warning w-100">Search</button>
        </div>

        <div class="col-md-2 d-flex align-items-end">
          <a class="btn btn-danger w-100" href="income.php">Reset</a>
        </div>
      </form>

      <!-- Data Table -->
      <div class="table-responsive mt-4">
        <table class="table table-success table-striped align-middle">
          <thead class="table-dark">
            <tr>
              <th scope="col">S.No.</th>
              <th scope="col">Label</th>
              <th scope="col">Category</th>
              <th scope="col">Payment Mode</th>
              <th scope="col">Date</th>
              <th scope="col" class="text-end">Amount</th>
              <th scope="col">Edit</th>
              <th scope="col">Delete</th>
            </tr>
          </thead>
          <tbody>
            <?php
                $sql = "SELECT * FROM `transactions` $cond ORDER BY cdate DESC";
                $result   = mysqli_query($conn, $sql);
                $tansid   = 0;
                $nettotal = 0;

                while ($row = mysqli_fetch_assoc($result)) {
                    $tansid++;
                    $nettotal += $row["amount"];
                    // ✅ Format the date to DD-MM-YYYY
                    $formattedDate = date("d-m-Y", strtotime($row['cdate']));
                    echo "
                <tr>
                  <th scope='row'>{$tansid}</th>
                  <td>{$row['label']}</td>
                  <td>{$row['category']}</td>
                  <td>{$row['paymentMode']}</td>
                  <td>{$formattedDate}</td>
                  <td class='text-end'>" . number_format($row['amount']) . "</td>
                  <td><a href='home.php?tansid={$row['tansid']}' class='btn btn-sm btn-primary'>Edit</a></td>
                  <td><button class='btn btn-sm btn-danger' onclick='delete_record({$row['tansid']});'>Delete</button></td>
                </tr>
              ";
                }
            ?>
            <tr class="fw-bold">
              <td colspan="5" class="text-end">Total Amount</td>
              <td class="text-end"><?php echo number_format($nettotal, 2); ?></td>
              <td colspan="2"></td>
            </tr>
          </tbody>
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