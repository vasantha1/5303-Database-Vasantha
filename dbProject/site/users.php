<?php
	error_reporting(1);
	$db = new mysqli("localhost", "vgundeti", "vgundeti2015", "vgundeti");

	if ($db->connect_errno) {
		echo "Failed to connect to MySQL: (" . $db->connect_errno . ") " . $db->connect_error;
	}
?>
<!DOCTYPE HTML>
<!--
	Miniport by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Online Resume</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" />
	</head>
	<body>

		
<div class="wrapper style2" id="usersDiv">
	<article id="work">
		<header>
			<h2>Online Resume</h2>
			<p>Add, Edit, Delete users on this page</p>
		</header>
		
	</article>
</div>
<div class="wrapper">

<table id="usersTable" class="display" cellspacing="0" width="80%">
        <thead>
            <tr>
                
                <th>User_ID</th>
				 <th>last</th>
				 <th>first</th>
				 <th>street</th>
				 <th>city</th>
				 <th>state</th>
				 <th>zip</th>
				 <th>phone</th>
				 <th>email</th>
				 <th>password</th>
				 <th>picture</th>
				 <th>SSN</th>
				 <th>Credit_Card_no</th>
				 <th>Expiration_Month</th>
				 <th>Expiration_Year</th>
				 <th>CVC</th>
				 <th>Document</th>
				 <th>Date_Posted</th>
				 <th>Desired_Job_Categories</th>
				 
                
                
            </tr>
        </thead>
        <tfoot>
            <tr>
                
				 <th>User_ID</th>
				 <th>last</th>
				 <th>first</th>
				 <th>street</th>
				 <th>city</th>
				 <th>state</th>
				 <th>zip</th>
				 <th>phone</th>
				 <th>email</th>
				 <th>password</th>
				 <th>picture</th>
				 <th>SSN</th>
				 <th>Credit_Card_no</th>
				 <th>Expiration_Month</th>
				 <th>Expiration_Year</th>
				 <th>CVC</th>
				 <th>Document</th>
				 <th>Date_Posted</th>
				 <th>Desired_Job_Categories</th>
                
            </tr>
        </tfoot>
        <tbody>


<?php
//Php will poluate each table row
$query = "SELECT * FROM user";
$result = $db->query($query);
if($result) {
	while ($row = $result->fetch_assoc()) {
		echo"<tr>";
		echo"<td>{$row['User_ID']}</td>\n";
		echo"<td>{$row['last']}</td>\n";
		echo"<td>{$row['first']}</td>\n";
		echo"<td>{$row['street']}</td>\n";
		echo"<td>{$row['city']}</td>\n";
		echo"<td>{$row['state']}</td>\n";
		echo"<td>{$row['zip']}</td>\n";
		echo"<td>{$row['phone']}</td>\n";
		echo"<td>{$row['email']}</td>\n";
		echo"<td>{$row['password']}</td>\n";
		echo"<td>{$row['picture']}</td>\n";
		echo"<td>{$row['SSN']}</td>\n";
		echo"<td>{$row['Credit_Card_no']}</td>\n";
		echo"<td>{$row['Expiration_Month']}</td>\n";
		echo"<td>{$row['Expiration_Year']}</td>\n";
		echo"<td>{$row['CVC']}</td>\n";
		echo"<td>{$row['Document']}</td>\n";
		echo"<td>{$row['Date_Posted']}</td>\n";
		echo"<td>{$row['Desired_Job_Categories']}</td>\n";
		
		
		//echo"<td>";
		
		echo"</tr>";
	 }
}
?>
 
        </tbody>
    </table>
	

        </tbody>
    </table>
</div>
</div>

		

		

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script>
			$(function() {
			
				
				$('#usersTable').DataTable();
				$('#coursesTable').DataTable();

				
			});
			</script>

	</body>
</html>
