<?php
/**
 * Get Bangladeshi mobile  number witt country code 880
 */

 function getmsisdnwithcountrycode($msisdn) {
  $regex1 = "/^01[0-9]{9}$/";
  $regex2 = "/^1[0-9]{9}$/";
  $pattern1 = "/^0/";
  $pattern2 = "/^1/";
  if (preg_match($regex1, $msisdn)) {
      $msisdn = preg_replace($pattern1, '880', $msisdn);
  } else if (preg_match($regex2, $msisdn)) {
      $msisdn = preg_replace($pattern2,'8801', $msisdn);
  }
	return $msisdn;
}
$input = "1733548180";
$output = getmsisdnwithcountrycode($input);
echo $output;
?>