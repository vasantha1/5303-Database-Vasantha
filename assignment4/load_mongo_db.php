<?php

// connecting to Mongodb
$m = new MongoClient();

// selecting a database
$db = $m->vgundeti;

//selecting a collection
$collection=$db->random_people;


$json = file_get_contents("http://api.randomuser.me/?results=1000");

$json_array = json_decode($json);

for($i=0;$i<sizeof($json_array->results);$i++)
{
	$collection->insert($json_array->results[$i]);
}

?>
