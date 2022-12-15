<?php
/**
 * Help link url: https://phppot.com/php/how-to-handle-csv-with-php-read-write-import-export-with-database/
 * Import Mysql DB Table data to csv file
 * comma (,) separator working fine 
 * but Pipe(|) break for if column field content have any comma(,) as content
 * but this is working fine for comma(,) separator
 */
$db = new mysqli('localhost', 'root', '', 'phpapidb', '3308');
$separator = '|'; // can be , or |
$enclosure = ' ';
if ($db->connect_errno) {
    echo "Failed to connect  to MySql DB: ".$db->connect_error;
    exit;
}
$query = "SELECT * from tickets";
$result = $db->query($query);
$cur_date = date('dmYHis');
$file_name = 'ticket_csv_export_from_db'.'_'.$cur_date.'.csv';
$handle = fopen($file_name, 'w');
$heading = true;

/**
 * For Comma(,) delimiter csv generation
 */

while($row = $result->fetch_assoc()) {
    if ($heading) {
        fputcsv($handle, array_keys($row), $separator);
        //fwrite($handle, implode($separator, array_keys($row))."\n");
        $heading = false;
    }
    fputcsv($handle, $row, $separator);
}


/** 
 * for Pipe (|) delimiter csv generation
 * 
 */

 while($row = $result->fetch_assoc()) {
    if ($heading) {
        //fputcsv($handle, array_keys($row), $separator);
        fwrite($handle, implode($separator, array_keys($row))."\n");
        $heading = false;   
    }

    if (!empty($row['category'])) {
            $str = $row['category'];
            $final_str = trim($str);
            $text = str_replace( array("\r", "\n", "\t", "/", "<br>"), "", $final_str);
            $row['category'] = $text;
        } 
        if (!empty($row['sub_category'])) {
            $str = $row['sub_category'];
            $final_str = trim($str);
            $text = str_replace( array("\r", "\n", "\t", "/", "<br>"), "", $final_str);
            $row['sub_category'] = $text;
        } 
        if (!empty($row['agent_comment'])) {
            $str = $row['agent_comment'];
            $final_str = trim($str);
            $text = str_replace( array("\r", "\n", "\t", "/", "<br>"), "", $final_str);
            $row['agent_comment'] = $text;
        } 
        if (!empty($row['title'])) {
            $str = $row['title'];
            $final_str = trim($str);
            $text = str_replace( array("\r", "\n", "\t", "/", "<br>"), "", $final_str);
            $row['title'] = $text;
        }
        fwrite($handle, implode($separator, $row)."\n");
        //fputcsv($handle, $row, $separator);
    
}

fclose($handle);
echo "Ticket Dump exported successfully : ". $file_name;
?>