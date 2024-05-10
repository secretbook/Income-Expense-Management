 <?php
    include("session.php");

    // Update Data
    if (isset($_GET['tansid']))
        $tansid = $_GET['tansid'];
    else
        $tansid = 0;


    if ($tansid > 0) {
        $sql = "select * from transactions where tansid='$tansid'";
        $res = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($res);

        $type = $row['type'];
        $label = $row['label'];
        $amount = $row['amount'];
        $category = $row['category'];
        $paymentMode = $row['paymentMode'];
        $cdate = $row['cdate'];
        $btnvalue = "UPDATE RECORD";
    } else {
        $btnvalue = "ADD NEW RECORD";
        $type = "";
        $label = "";
        $amount = "";
        $category = "";
        $paymentMode = "";
        $cdate = "";
    }




    // FOR showing msg on alert
    if (isset($_GET['msg']))
        $msg = $_GET['msg'];
    else
        $msg = "";



    function getsum_of_income($conn)
    {
        $total_income = 0;
        $sql = "select sum(amount) as income from transactions where type='1'";
        $result = mysqli_query($conn, $sql);
        $row =  mysqli_fetch_array($result);
        $total_income =  $row['income'];
        return $total_income;
    }



    function getsum_of_expanse($conn)
    {
        $total_expanse = 0;
        $sql = "select sum(amount) as expanse from transactions where type='0'";
        $result = mysqli_query($conn, $sql);
        $row =  mysqli_fetch_array($result);
        $total_expanse =  $row['expanse'];
        return $total_expanse;
    }

    $total_income = getsum_of_income($conn);
    $total_expanse = getsum_of_expanse($conn);
    $balance = $total_income - $total_expanse;



    // POST Method
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // variables to be inserted into the table
        $type = $_POST['type'];
        $label = $_POST['label'];
        $amount = $_POST['amount'];
        $category = $_POST['category'];
        $paymentMode = $_POST['paymentMode'];
        $cdate = $_POST['cdate'];
        $tansid = $_POST['tansid'];

        if ($type != "" && $amount != "") {



            if ($tansid == 0) {
                // sql query to be executed 
                $sql = "insert into transactions set 
              type='$type',
              label = '$label',
              amount = '$amount',
              category = '$category',
              paymentMode = '$paymentMode',
              cdate = '$cdate'";
                $result = mysqli_query($conn, $sql);
                header("Location: home.php?msg=success");
                //with this jump to that page
                //    header("Location: {$_SERVER['PHP_SELF']}?msg=success");
            } else {
                $sql = "update transactions set 
              type='$type',
              label = '$label',
              amount = '$amount',
              category = '$category',
              paymentMode = '$paymentMode',
              cdate = '$cdate'
              where tansid = '$tansid'";
                $result = mysqli_query($conn, $sql);

                if ($type == 1)
                    header("Location: income.php?msg=updated");
                else
                    header("Location: expanse.php?msg=updated");
            }
        }
    }



    ?>
 <!doctype html>
 <html lang="en">

 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Home Page</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

     <style>
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
             padding-bottom: 20px;
         }

         .formerror {
             color: red;
         }
     </style>

 </head>

 <body>

     <?php include("header.php"); ?>

     <!-- Container -->
     <div class="card container my-2 bg-light w-50 text-dark p-3 justify-content-center col-md-6 align-content-center ">
         <div class="card-body p-1">
             <div class="card mt-2 w-100 col-md-6 ">
                 <div class="card-body text-light bg-primary">
                     <div class="row mb-3 ">
                         <div class="col-lg-12 col-sm-12">
                             <h6 class="text-center mt-3">TOTAL BALANCE</h6>
                             <h1 class="text-center mb-3">₹<?php echo number_format($balance, 2); ?></h1>
                         </div>
                         <div class="col-lg-7 col-sm-7 text-center">
                             <h6 class="mb-1">INCOME</h6>
                             <span><b class="text-info">+₹<?php echo number_format($total_income, 2); ?></b></span>
                         </div>
                         <div class="col-lg-5 col-sm-5">
                             <h6 class="mb-1">EXPANSE</h6>
                             <span><b class="text-warning">-₹<?php echo number_format($total_expanse, 2); ?></b></span>
                         </div>
                     </div>
                 </div>
             </div>


             <!-- Form -->
             <form class="row g-3" id="myForm" name="myForm" action="" method="post">
                 <div class="form-group mt-3 mb-2">
                     <label for="label" class="col-form-label fw-bolder fs-6">ADD TRANSACTION:</label>
                     <div class="row mb-1">
                         <div class="col-lg-12 col-sm-12">
                             <div class="btn-group w-100" role="group" aria-label="Basic radio toggle button group">
                                 <input type="radio" class="btn-check" name="type" id="expanse" autocomplete="off" checked value="0">
                                 <label class="btn btn-outline-danger fw-bolder" for="expanse">EXPANSE</label>
                                 <input type="radio" class="btn-check" name="type" id="income" autocomplete="off" value="1">
                                 <label class="btn btn-outline-danger fw-bolder" for="income">INCOME</label>

                                 <?php if ($type == 1) { ?>
                                     <script type="text/javascript">
                                         document.getElementById("income").checked = true;
                                     </script>
                                 <?php } else { ?>

                                     <script type="text/javascript">
                                         document.getElementById("expanse").checked = true;
                                     </script>
                                 <?php } ?>

                             </div>
                         </div>
                     </div>
                     <label for="label" class="col-form-label fw-bolder">Label:</label>
                     <div class="input-group">
                         <input type="text" class="form-control w-100 mb-2" id="label" name="label" placeholder="Enter Label" value="<?php echo $label; ?>">
                         <b>
                             <div id="labelError" class="formerror"></div>
                         </b>
                     </div>
                     <div class="row">
                         <div class="col-lg-6 col-sm-6 ">
                             <label class="fw-bolder" for="amount">Amount:</label>
                             <div class="input-group">
                                 <input type="number" class="form-control" id="amount" name="amount" placeholder="Enter Amount" value="<?php echo $amount; ?>">
                             </div>
                             <b>
                                 <div id="amountError" class="formerror"></div>
                             </b>
                         </div>
                         <div class="col-lg-6 col-sm-6 ">
                             <label class="fw-bolder" for="category">Category:</label>
                             <select class="form-select" id="category" name="category" aria-label="Default select example">
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
                             <script type="text/javascript">
                                 document.getElementById("category").value = "<?php echo $category; ?>";
                             </script>
                             <b>
                                 <div id="categoryError" class="formerror"></div>
                             </b>
                         </div>
                     </div><br />
                     <div class="row ">
                         <div class="col-lg-6 col-sm-6 ">
                             <label class="fw-bolder" for="amount">PaymentMode:</label>
                             <select class="form-select w-20" id="paymentMode" name="paymentMode" aria-label="Default select example">
                                 <option value="" selected>Payment Mode</option>
                                 <option value="Cash">Cash</option>
                                 <option value="Bank">Bank</option>
                                 <option value="Cheque">Cheque</option>
                             </select>
                             <script type="text/javascript">
                                 document.getElementById("paymentMode").value = "<?php echo $paymentMode; ?>";
                             </script>
                             <b>
                                 <div id="paymentModeError" class="formerror"></div>
                             </b>
                         </div>
                         <div class="col-lg-6 col-sm-6">
                             <label class="fw-bolder" for="datepicker">Date:</label>
                             <input type="date" name="cdate" class="form-control" id="datepicker" value="<?php echo $cdate; ?>">
                             <b>
                                 <div id="dateError" class="formerror"></div>
                             </b>
                         </div>
                     </div><br />
                 </div>
                 <div class="col-lg-12 col-sm-12 mt-1 ">
                     <input type="hidden" name="tansid" value="<?php echo $tansid; ?>">
                     <input type="submit" class="btn btn-primary w-100 mt-3" value="<?php echo $btnvalue; ?>">
                 </div>
             </form>
         </div>
     </div>


 </body>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
 <script type="text/javascript">
     document.getElementById('myForm').addEventListener('submit', function(event) {
         // Reset error messages
         document.getElementById('labelError').innerText = '';
         document.getElementById('amountError').innerText = '';
         document.getElementById('categoryError').innerText = '';
         document.getElementById('paymentModeError').innerText = '';
         document.getElementById('dateError').innerText = '';


         // Validate 
         var label = document.getElementById('label').value;
         var amount = document.getElementById('amount').value;
         var category = document.getElementById('category').value;
         var paymentMode = document.getElementById('paymentMode').value;
         var datepicker = document.getElementById('datepicker').value;


         if (label == "") {
             document.getElementById('labelError').innerText = 'Please enter the label field';
             event.preventDefault(); // Prevent form submission
         }
         if (amount == "") {
             document.getElementById('amountError').innerText = 'Please enter the amount field';
             event.preventDefault(); // Prevent form submission
         }
         if (category == "") {
             document.getElementById('categoryError').innerText = 'Please enter the category field';
             event.preventDefault(); // Prevent form submission
         }
         if (paymentMode == "") {
             document.getElementById('paymentModeError').innerText = 'Please enter the payment field';
             event.preventDefault(); // Prevent form submission
         }
         if (datepicker == "") {
             document.getElementById('dateError').innerText = 'Please enter the date field';
             event.preventDefault(); // Prevent form submission
         }


     });
 </script>

 <script type="text/javascript">
     //Swal.fire("sfddsafdsads!");
     <?php
        if ($msg == "success") { ?>


         Swal.fire({
             title: "Saved Success?",
             text: "Data saved successfully?",
             icon: "success"
             // });
         }).then(() => {
             window.location.href = 'home.php'; // with this redirect to home.php after saved
         });
     <?php } ?>
 </script>

 </html>