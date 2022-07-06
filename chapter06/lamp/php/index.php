<html> 
<head>
	<title>My Users</title>
	<style type="text/css">
		table, th, td { 
			border: solid 1px #eee; 
			border-collapse: collapse; 
			padding: 5px; 
		}
		th { 
			width: 200px; 
			background-color: #eee; 
		}
	</style>
</head>
<body> 
<?php

$host = "db"; 
$user = "webuser"; 
$password = "password"; 
$database = "mydatabase"; 
$link = mysqli_connect($host, $user, $password, $database); 

$SQL = "SELECT user_id, user_first, user_last FROM my_users"; 
$rs = $link->query($SQL);  

echo "<table>\n"; 
echo "<thead><tr><th>First name</th><th>Last name</th></tr></thead>\n"; 

while ($row = mysqli_fetch_assoc($rs)) { 
	$user_id = $row['user_id'];
	$user_first = $row['user_first'];
	$user_last = $row['user_last'];
	echo "<tr><td>$user_first</td><td>$user_last</td></tr>\n"; 
}
echo "</table>\n";
?>
</body>
</html>
