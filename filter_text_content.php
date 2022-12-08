<?php
$str = '
Dis:Gopalgonj
Thana: Muksudpur <br>
Vill:Maksudpur bazzar<br>
Samplw Number: 8801733654890/
Location data{ "lat":345666, "lang":78899}
';
$trimed_str = trim($str);
$final_string = preg_replace("/[ \\r\n\/\s]*$/", "" ,$trimed_str);
$text = preg_replace( "/<br>|\n/", "", $final_string );

echo $text;

?>