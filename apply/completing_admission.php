<?php
session_start();
// error_reporting(0);
include('../connect.php');
if (isset($_POST['submit'])) {
    // File upload configuration 
    $targetDir = "../upload/";
    $allowTypes = array('jpg', 'png', 'jpeg', 'pdf', 'JPG', 'PNG', 'JPEG', 'PDF');
    $statusMsg = $errorMsg = $insertValuesSQL = $errorUpload = $errorUploadType = '';
    $fileNames = array_filter($_FILES['files']['name']);
    if (!empty($fileNames)) {
        foreach ($_FILES['files']['name'] as $key => $val) {
            // File upload path 
            // $fileName = basename($_FILES['files']['name'][$key]);

            $temp = explode(".", $_FILES["files"]["name"][$key]);

            $newfilename = $_SESSION["uemail"] . '_' . $temp[0] . '.' . end($temp);
            $targetFilePath = $targetDir . $newfilename;

            // Check whether file type is valid 
            $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION);
            if (in_array($fileType, $allowTypes)) {
                // Upload file to server 
                if (move_uploaded_file($_FILES["files"]["tmp_name"][$key], $targetFilePath)) {
                    // Image db insert sql 
                    $insertValuesSQL .= "('" . $newfileNamefileName . "'),";
                    echo $insertValuesSQL;
                    echo $_SESSION["uemail"];
            
                } 
                
                else {
                    $errorUpload .= $_FILES['files']['name'][$key] . ' | ';
                }
            } else {
                $errorUploadType .= $_FILES['files']['name'][$key] . ' | ';
            }
        }

        // Error message 
        $errorUpload = !empty($errorUpload) ? 'Upload Error: ' . trim($errorUpload, ' | ') : '';
        $errorUploadType = !empty($errorUploadType) ? 'File Type Error: ' . trim($errorUploadType, ' | ') : '';
        $errorMsg = !empty($errorUpload) ? '<br/>' . $errorUpload . '<br/>' . $errorUploadType : '<br/>' . $errorUploadType;

        if (!empty($insertValuesSQL)) {
            $insertValuesSQL = trim($insertValuesSQL, ',');
            // Insert image file name into database 
           
            $insert =mysqli_query($conn,"INSERT INTO documents (file_name, document_owner) VALUES ('".$insertValuesSQL."','" .$_SESSION["uemail"]."')");
            if ($insert) {
                $statusMsg = "Files are uploaded successfully." . $errorMsg;
?>
                <script>
                    alert(<?php echo $statusMsg ?>);
                </script>
            <?php
                header('Location:completing_admission.php');
            } else {
                $statusMsg = "Sorry, there was an error uploading your file.";
            ?>
                <script>
                    alert(<?php echo $statusMsg ?>)
                </script>
            <?php
            }
        } else {
            $statusMsg = "Upload failed! " . $errorMsg;
            ?>
            <script>
                alert(<?php echo $statusMsg ?>)
            </script>
        <?php
        }
    } else {
        $statusMsg = 'Please select a file to upload.';
        ?>
        <script>
            alert(<?php echo $statusMsg ?>)
        </script>
<?php
    }
}
if (strlen($_SESSION['uemail']) == "") {
    header("Location: login.php");
} else {
}

$email = $_SESSION["uemail"];
//Get Date
date_default_timezone_set('Africa/Lagos');
$current_date = date('Y-m-d');


$sql = "select * from admission where email='$email'";
$result = $conn->query($sql);
$rowaccess = mysqli_fetch_array($result);

?>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Profile|Online Student Admission system</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
</head>

<body>
    <div id="wrapper">

        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element"> <span>
                                <img src="../<?php echo $rowaccess['photo'];  ?>" alt="image" width="142" height="153" class="img-circle" />
                            </span>


                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear"><span class="text-muted text-xs block"><?php echo $rowaccess['email'];  ?> <b class="caret"></b></span> </span> </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">

                                <li><a href="logout.php">Logout</a></li>
                            </ul>
                        </div>

                        <?php
                        include('sidebar.php');

                        ?>

                </ul>

            </div>
        </nav>

        <div id="page-wrapper" class="gray-bg">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>

                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li>
                            <span class="m-r-sm text-muted welcome-message">Welcome to DASHBOARD</span>
                        </li>
                        <li class="dropdown">




                        <li>
                            <a href="logout.php">
                                <i class="fa fa-sign-out"></i> Log out
                            </a>
                        </li>

                    </ul>

                </nav>
            </div>

            <div class="wrapper wrapper-content">
                <div class="row animated fadeInRight">
                    <div class="col-md-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Documents submission</h5>
                            </div>

                            <div class="ibox-title">
                                <ol>
                                    <li>Official receipt of application fee payment (20,000 Rwf)</li>
                                    <li>Certified photocopies of college or university diplomas or degree certificates</li>
                                    <li>Two recent passport-size photos</li>
                                    <li>Three letters of recommendation from referees</li>
                                    <li>Two certified copies of official transcript from each college/ university attended</li>
                                    <li>Certified photocopy of secondary school certificate</li>
                                    <li>Updated curriculum vitae (CV)Updated curriculum vitae (CV)</li>
                                    <li>Essay (response to Part 5 of this form)</li>
                                    <li>Filled and signed application form which can be found at <a href="https://auca.ac.rw/application-forms/"> this link</a></li>

                                </ol>
                            </div>

                            <div>


                                <form action="" method="post" enctype="multipart/form-data">
                                    Upload all required documents:

                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div align="center">
                                                <input type="file" name="files[]" class="form-control" multiple>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div>
                                                <button class="btn btn-primary" type="submit" name="submit">Upload</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <?php
                                // Include the database configuration file
                                include_once '../connect.php';

                                // Get images from the database
                                $query = $conn->query("SELECT * FROM documents ORDER BY id DESC");

                                if ($query->num_rows > 0) {
                                    while ($row = $query->fetch_assoc()) {
                                        $imageURL = '../upload/' . $row["file_name"];
                                ?>
                                        <img src="<?php echo $imageURL; ?>" alt="" />
                                    <?php }
                                } else { ?>
                                    <p>No image(s) found...</p>
                                <?php } ?>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="pull-right">
                </div>
                <div>
                    <?php include('footer.php'); ?>
                </div>
            </div>

        </div>
    </div>



    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- Peity -->
    <script src="js/plugins/peity/jquery.peity.min.js"></script>

    <!-- Peity -->
    <script src="js/demo/peity-demo.js"></script>

</body>

</html>