<?php
error_reporting(0);
$db = new mysqli('localhost', 'snaredla', 'snaredla2015', 'snaredla');
if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}
// Gets 1000 users from the randomuser api, and loads it into a variable called $json
$json = file_get_contents("http://api.randomuser.me/?results=20");
// This turns the variable into a PHP object
$json_array = json_decode($json);
for($i=0;$i<sizeof($json_array->results);$i++){
   
   
	$last = $json_array->results[$i]->user->name->last;
	$first = $json_array->results[$i]->user->name->first;
	$street = $json_array->results[$i]->user->location->street;
	$city = $json_array->results[$i]->user->location->city;
	$state = $json_array->results[$i]->user->location->state;
	$zip = $json_array->results[$i]->user->location->zip;
	$phone = $json_array->results[$i]->user->phone;
	$email = $json_array->results[$i]->user->email;
	$password = $json_array->results[$i]->user->password;
	$picture = $json_array->results[$i]->user->picture->medium;
	
	echo "'$last','$first','$street','$city','$state','$zip','$phone','$email','$password','$picture'";
	$sql1 = "select * from user where email='{$email}'";
	if(!$result1 = $db->query($sql1)){
		die('There was an error running the query [' . $db->error . ']');
	}
	//$rows = $value->num_rows;
	//$num = $value->num_rows;
	//echo "'$value->num_rows'";
	//echo "$rows";
	
if(!$result1->num_rows>0){
	$sql2 = <<<SQL
    INSERT into user
    VALUES('$last','$first','$street','$city','$state','$zip','$phone','$email','$password','$picture'); 
SQL;
	if(!$result = $db->query($sql2)){
		die('There was an error running the query [' . $db->error . ']');	
	}
}
}