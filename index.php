<?php
include("config.php");

// POST Method
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  // variables to be inserted into the table
  $email = $_POST['email'];
  $password = $_POST['password'];


  if ($email != "" && $password != "") {
    // sql query to be executed 
    $sql = "select * from users where email='$email'  and password = '$password'";
    $result = mysqli_query($conn, $sql);

    if ($result) {

      $count = mysqli_num_rows($result);
      //die;
      if ($count == 1) {
        $row =  mysqli_fetch_array($result);
        $Sno =  $row['Sno'];

        //session start security
        session_start();
        $_SESSION['Sno'] = $Sno;

        //redirect to insided
        header("Location: home.php");
      }
    }
  }
}


?>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <!-- <script defer src="./Script/login.js"></script> -->
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0
    }

    body {
      background-image: url(img/2.jpg);
      background-size: 100% auto;
      background-position: no-repeat;
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
      padding-bottom: 20px;
    }

    .error {
      color: red;
    }

    
  </style>
</head>

<body>

  <!-- Login Page -->
  <div class="container d-flex justify-content-center align-content-center">
    <div class="card  bg-light text-dark mb-15  w-50 mx-3 my-3 p-3 mt-5 ">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12 col-sm-12">
            <div class="col-lg-12 col-sm-12">
              <form action="" method="post" id="myForm">
                <div class="mb-3">
                  <h1 class="mb-5">Login Page</h1>
                  <label for="email" class="form-label">Email address <span style="color:red;">*</span></label>
                  <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
                  <b>
                    <span id="emailError" class="error"></span>
                  </b>
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">Password<span style="color:red;">*</span></label>
                  <input type="password" class="form-control" name="password" id="password">
                  
                  <b>
                    <span id="passwordError" class="error"></span>
                  </b>
                </div>
                <!-- <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Remember me</label>
              </div> -->
                <input type="submit" class="btn btn-primary" id="submit">
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
  document.getElementById('myForm').addEventListener('submit', function(event) {
    // Reset error messages
    document.getElementById('emailError').innerText = '';
    document.getElementById('passwordError').innerText = '';

    // Validate email
    var email = document.getElementById('email').value;
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      document.getElementById('emailError').innerText = 'Email is mandatory';
      event.preventDefault(); // Prevent form submission
    }

    // Validate password
    var password = document.getElementById('password').value;
    // Password must be at least 8 characters long
    if (password.length < 8) {
      document.getElementById('passwordError').innerText = 'Password must be at least 8 characters long';
      event.preventDefault(); // Prevent form submission
    }
    // alert('Login successful!'); // Replace this with your actual login logic
  });
</script>


</html>