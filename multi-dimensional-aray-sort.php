<?php
/*
* Multi dimensional array sorting 
*/
$data = array(
    'internet' => array(
        '7day' => '45', '1day' => '15', 'today' => '10'
    ),
    'network' => array(
        '7day' => '25', '1day' => '15', 'today' => '20'
    ),
    'internet speed' => array(
        '7day' => '35', '1day' => '15', 'today' => '15'
    )
);
foreach ($data as $key => $row) {
    $attack[$key]  = $row['today'];
}

// Sort the data with attack descending
 array_multisort($attack, SORT_DESC, $data);

echo "<pre/>";print_r($data);

/**
 * User sort
 */

$info = array(
    array('name' => 'Jadon', 'age' => 21, 'country' => 'England'),
    array('name' => 'Marcus', 'age' => 23, 'country' => 'England'),
    array('name' => 'Anthony', 'age' => 24, 'country' => 'France'),
    array('name' => 'Mason', 'age' => 19, 'country' => 'England'),
    array('name' => 'Dan', 'age' => 23, 'country' => 'Wales'),
);
usort($info, function($x, $y) {
    //For asc order
    //return $x['age'] > $y['age'];
    //return $x['age'] <=> $y['age'];
    //For desc order
    return $x['age'] < $y['age'];
});
echo "<pre />"; print_r($info);