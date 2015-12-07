<?php

error_reporting(1);

$host 	= 'localhost';
$user 	= 'vgundeti';
$pass 	= 'vgundeti2015';
$db 	= 'vgundeti';

$load = new LoadValues($host,$user,$pass,$db);

$load->addUsers();
//$load->loadCourses();



class LoadValues{

	var $db;
	//var $Roles;

	function __construct($host,$user,$pass,$db){
		//connect to database on local server
		$this->db = new mysqli($host,$user,$pass,$db);

		if ($this->db->connect_errno) {
			echo "Failed to connect to MySQL: (" . $db->connect_errno . ") " . $db->connect_error;
		}
		
	}
	
	
	
	function addUsers(){		

		
		
			//pull entire user from object to make code below easier to read
				$User_ID   			        = $_POST['User_ID'];
				$last       		        = $_POST['last'];
				$first       		        = $_POST['first'];
				$street			            = $_POST['street'];
				$city    			        = $_POST['city'];
				$state  			        = $_POST['state'];
				$zip			            = $_POST['zip'];
				$phone   			        = $_POST['phone'];
				$email          	        = $_POST['email'];
				$password			        = $_POST['password'];
				$picture			        = $_POST['picture'];
				$SSN		             	= $_POST['SSN'];
				$Credit_Card_no 			= $_POST['Credit_Card_no'];
				$Expiration_Month		    = $_POST['Expiration_Month'];
				$Expiration_Year		    = $_POST['Expiration_Year'];
				$CVC             			= $_POST['CVC'];
				$Document              		= $_POST['Document'];
				$Date_Posted                = $_POST['Date_Posted'];
				$Desired_Job_Categories     = $_POST['Desired_Job_Categories '];
				//echo $first;
				$this->loadRoles($User_ID,$last,$first,$street,$city,$state,$zip,$phone,$email,$password,$picture,$SSN,$Credit_Card_no,$Expiration_Month,$Expiration_Year,$CVC,$Document,Date_Posted,$Desired_Job_Categories);
				//echo $query."\n";
				//$result = $this->db->query($query);
				if($result > 0)
					header('Location : users.php');
				else
					header('Location : registration_form.html');

		
	}
	


	private function loadRoles($User_ID,$last,$first,$street,$city,$state,$zip,$phone,$email,$password,$picture,$SSN,$Credit_Card_no,$Expiration_Month,$Expiration_Year,$CVC,$Document,$Date_Posted,$Desired_Job_Categories){
		
		$query = "INSERT INTO user VALUES ( '$User_ID', '$last', '$first', '$street', '$city', '$state', '$zip', '$phone', '$email', '$password', '$picture', '$SSN', '$Credit_Card_no', '$Expiration_Month','$Expiration_Year','$CVC', '$Document', '$Date_Posted', '$Desired_Job_Categories')";
        $result = $this->db->query($query);
        return $result;
	}
}

