<html>
<style>

table, th, td {
border: 3px solid black;
border-collapse: collapse;
}

table#t01 tr:nth-child(even) {
  background-color: palegreen;
}
table#t01 tr:nth-child(odd) {
 background-color: aquamarine;
}
table#t01 th {
  background-color: black;
  color: white;
}


</style>
<body>
<a href="index.html">Go Back</a>

<?php 
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "scan";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if($_POST["ip"]!=NULL)
{
//	echo "ip not null";
	$sql = "select * from results where ip=\"".$_POST["ip"]."\"";
	//$sql = sprintf("select * from results where ip ='%s'",mysql_real_escape_string($_POST["ip"]));
	//$sql= "select * from results limit 10;";
}

elseif ($_POST["port"]!=NULL and $_POST["banner"]!=NULL) 

{
	//select * from results where port=ip and banner like '%$_POST["banner"]%';
	$sql = "select * from results where port=\"".$_POST["port"]."\""." and banner like '%".$_POST["banner"]."%'";
//	echo "port not null banner not null";
	
}
elseif ($_POST["port"]==NULL and $_POST["banner"]!=NULL) 
{
	//select * from results where banner like '%$_POST["banner"]%';
	$sql = "select * from results where banner like '%".$_POST["banner"]."%'";
//	echo "port null banner not null";

}
else
{
//	echo "WHAT THE HELL";
}


$result=mysqli_query($conn, $sql);

if ($result) {
   //echo "query Success";
      }
else {
 //echo "query Fail" . mysqli_error($conn);
}


if (mysqli_num_rows($result) > 0) {
	// output data of each row
	echo "<table id=\"t01\"><tr><th>IP</th><th>PORT</th><th>BANNER</th></tr>";
    while($row = mysqli_fetch_assoc($result)) {
        echo "<tr><td>" . $row["ip"]."</td><td> " . $row["port"]. "</td><td> " . $row["banner"]. "</td></tr>";
    }
} else {
    echo "0 results";
}
echo "</table>";

mysqli_close($conn);




?>

<a href="index.html">Go Back</a>
</body>
</html>

