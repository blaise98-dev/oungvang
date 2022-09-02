<?php 
if (isset($_POST['upload'])) {
    

$file=$_FILES['uploadfiles'];
$filename=$_FILES['uploadfiles']['name'];
    $fileType = $_FILES['uploadfiles']['type'];
    $fileTmpName = $_FILES['uploadfiles']['tmp_name'];
    $fileSize = $_FILES['uploadfiles']['size'];
 $fileError= $_FILES['uploadfiles']['error'];

$fileExt=explode('.',$filename);
$fileActualExtension=strtolower(end($fileExt));
$allowed=array('jpg','jpeg','png','pdf');

if (in_array($fileActualExtension,$allowed)) {
    
    if ($fileError===0) {
        if($fileSize<5000000){
$fileNameNew = uniqid('',true).".".$fileActualExtension;
$filedestination='testupload/'.$fileNameNew;
move_uploaded_file($fileTmpName,$filedestination);
header("Location:index.php?uploadsuccess");

        }
        else{
                echo "your file is too big";
        }
    }
    else{
            echo "There was an error uploading your file";

    }
}
else{
    echo "Only jpg,jpeg,png and pdf allowed";
}

}


?>