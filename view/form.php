<!DOCTYPE html>
<html>
<head>
	<title>register</title>
</head>
<script src="../js/jquery-1.11.3.min.js" type="text/javascript" ></script>
<script src="../control/add-stud.js" ></script>
<body>
<form action="../control/add-student.php" method="post" accept-charset="utf-8">
	<table>
		<tr>
			<td>
				name:
			</td>
			<td>
				<input type="text" name="name" id="name"/>
			</td> 
		</tr>
		<tr>
			<td>
				password:
			</td>
			<td>
				<input type="text" name="password" id="password"/>
			</td> 
		</tr>
		<tr>
			<td>
				Email:
			</td>
			<td>
				<input type="text" name="mail" id="mail"/><span id="mailErr"></span>
			</td> 
		</tr>
		<tr>
			<td>
				image:
			</td>
			<td>
				<input type="file" name="image" id="image"/>
			</td> 
		</tr>
		<tr><td colspan="2" style="align:center"><button id="submit" type="submit" name="submit" value="ok">submit</button></td></tr>
	</table>
</form>
</body>
</html>