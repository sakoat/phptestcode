<!DOCTYPE html>
<html>
<body>

<?php
$file_name_list = explode('.', 'shakhawat.hossain##31052022_949000.csv');
print_r($file_name_list);
$exte = array_pop($file_name_list);
echo $exte;
?>

</body>
</html>