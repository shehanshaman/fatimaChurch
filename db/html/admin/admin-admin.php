<?php 
	@ob_start();
	session_start(); 
?>
<?php require_once('../../inc/connection.php'); ?>
<?php require_once('../../inc/functions.php'); ?>

<?php 

	if (!isset($_SESSION['user_name'])) {
		# code...
		header('Location: ../dbhome.php');
	}

	//check valid or not
	$valid_or_not = '';
	$add_query = '';

	$query = "SELECT * from admins WHERE user_name='{$_SESSION['user_name']}' LIMIT 1";
	$details = mysqli_query($connection, $query);

	$user = mysqli_fetch_assoc($details);
	$valid_or_not = "{$user['valid']}";

	if($valid_or_not){
		$add_query = "<br> <br><a href=\"../add/add_query.php\">Add Query</a>";
	}

	//admins details
	$admins_details = '';

	$query0 = "SET @x = 0";
	$query1 = "SELECT @x:=@x+1 as num,user_name,password,valid,last_login from admins";

	$details = mysqli_query($connection, $query0);
	$details = mysqli_query($connection, $query1);

	verify_query($details);
			//query sussesfull
	while ($user = mysqli_fetch_assoc($details)) {
		# code...
		$admins_details .= "<tr>";
		$admins_details .= "<td>{$user['num']}</td>";
		$admins_details .= "<td>{$user['user_name']}</td>";
		if($valid_or_not){
			$admins_details .= "<td>{$user['password']}</td>";
		}else{
			$admins_details .= "<td>Not Available</td>";
		}
		$admins_details .= "<td>{$user['valid']}</td>";
		$admins_details .= "<td>{$user['last_login']}</td>";
		if($valid_or_not){
			$admins_details .= "<td><a href=\"../delete/delete_admin.php?user_id={$user['user_name']}\">Delete</a></td>";
		}
		$admins_details .= "</tr>";
	}


	//money
	$save = '';

	//getting the details
	$query = "SELECT * from result";

	$details = mysqli_query($connection, $query);

	verify_query($details);

	$row = mysqli_fetch_assoc($details);
	$save = "{$row['money']}";
	
	$update = '';

	$query = "SELECT last_update from result";

	$details = mysqli_query($connection, $query);

	verify_query($details);

	$row = mysqli_fetch_assoc($details);
	$update = "{$row['last_update']}";
	
 ?>


<!DOCTYPE html>
<html>
<head>
	<title>Admin</title>
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/main.css">
</head>
<body>

	<div class="wrapper clearfix"></div>
		
		<div class="top_bar">
			<div class="db_name">
				<p>Welcome to User Mangement System</p>
			</div>
			<div class="user_id">
				<p> Hello <?php echo $_SESSION['user_name']; ?>  
					<a href="../log_out.php"> Log Out</a>
				</p>
			</div>
			
		</div><!-- top_bar -->
		<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <ul class="nav navbar-nav">
		      <li><a href="admin-members.php">Members</a></li>
		      <li><a href="admin-past.php">Past Members</a></li>
		      <li class="active"><a href="admin-admin.php">Admins</a></li>
		      <li><a href="admin-donation.php">Donations</a></li>
		      <li><a href="admin-family.php">Family</a></li>
		    </ul>
		  </div>
		</nav>
		<main class="main_left">
			<div class="alert alert-info">
			  <strong>We have Rs :</strong> <?php echo $save; ?>
			</div>
			<table class="admins_details table table-striped">
				<h1>Admins
					<span>
						<a href="../add/add-admin.php" class="add"> +Add new</a>
					</span>	 
				</h1>

				<tr>
					<th>No</th>
					<th>User Name</th>
					<th>Password</th>
					<th>Valid</th>
					<th>Last Login</th>
					<th>Delete</th>
				</tr>

				<?php echo $admins_details; ?>
			</table>
		</main>
		<div class="bottom_bar">
			<div class="create">
				<p>Created By M.S.S.M PERERA</p>
				<p><?php echo "Last update on ".$update." ."; ?>
					<a href="../update-time.php"><button type="button" class="btn btn-danger">Update Time</button>
					</a>
				</p>
			</div>
			<div class="link">
				<a href="../../../">Fatima Church Home</a>
				<?php echo $add_query; ?>
			</div>
		</div>
	</wrapper>

</body>
</html>
<?php mysqli_close($connection); ?>