<?php include("session.php");?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Data with Modal</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal_feedback">
            Add Data
        </button>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal_feedback" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Data</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="dataForm">
                        <div class="form-group">
                            <label for="data">Name:</label>
                            <input type="text" class="form-control" id="u_name" name="u_name">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="script.js"></script>
</body>
<script>
  $(document).ready(function(){
    $('#dataForm').submit(function(e){
        e.preventDefault();
        $.ajax({
            url: 'ajax_insert_data.php',
            type: 'POST',
            data: $(this).serialize(),
            success: function(response){
                // Optionally, you can perform actions after successful insertion
                console.log("Data inserted successfully!");
                $('#exampleModal_feedback').modal('hide');
            },
            error: function(xhr, status, error) {
                // Optionally, handle errors here
                console.error(xhr.responseText);
            }
        });
    });
});

</script>
</html>
