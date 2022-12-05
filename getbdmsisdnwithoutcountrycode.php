<?php
/**
 * Get Bangladeshi mobile  number without country code 880
 */

 function getmsisdnwithoutcountrycode($msisdn) {
  $regex1 = "/^8801[0-9]{9}$/";
  $regex2 = "/^01[0-9]{9}$/";
  $pattern1 = "/^8801/";
  $pattern2 = "/^01/";
  if (preg_match($regex1, $msisdn)) {
      $msisdn = preg_replace($pattern1, '1', $msisdn);
  } else if (preg_match($regex2, $msisdn)) {
      $msisdn = preg_replace($pattern2,'1', $msisdn);
  }
	return $msisdn;
}
$input = "8801733548180";
$output = getmsisdnwithoutcountrycode($input);
echo $output;
?>