<?php
    include "config.php";

    // POST Method
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // variables to be inserted into the table
        $email    = $_POST['email'];
        $password = $_POST['password'];

        if ($email != "" && $password != "") {
            // sql query to be executed
            $sql    = "select * from users where email='$email'  and password = '$password'";
            $result = mysqli_query($conn, $sql);

            if ($result) {

                $count = mysqli_num_rows($result);
                //die;
                if ($count == 1) {
                    $row = mysqli_fetch_array($result);
                    $Sno = $row['Sno'];

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
    body {
      background: #f8f9fa url("img/2.jpg") no-repeat center center / cover;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .card {
      border-radius: 1rem;
      box-shadow: 0px 6px 25px rgba(0, 0, 0, 0.2);
      background: rgba(255, 255, 255, 0.9); /* semi-transparent white */
      backdrop-filter: blur(6px); /* adds a nice glass effect */
    }
    .form-label span {
      color: red;
    }
    .error {
      color: red;
      font-size: 0.9rem;
    }
  </style>

</head>

<body>

  <!-- Login Page -->
    <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-5 col-md-7 col-sm-10">
        <div class="card bg-white p-4">
          <div class="card-body">
            <h2 class="text-center mb-4">Login</h2>
            <form action="" method="post" id="myForm">

              <!-- Email -->
              <div class="mb-3">
                <label for="email" class="form-label">Email address <span>*</span></label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email">
                <span id="emailError" class="error"></span>
              </div>

              <!-- Password -->
              <div class="mb-3">
                <label for="password" class="form-label">Password <span>*</span></label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password">
                <span id="passwordError" class="error"></span>
              </div>

              <!-- Submit -->
              <div class="d-grid">
                <button type="submit" class="btn btn-primary">Login</button>
              </div>

              <!-- Extra -->
              <div class="text-center mt-3">
                <small class="text-muted">Don’t have an account? <a href="#">Register</a></small>
              </div>

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
