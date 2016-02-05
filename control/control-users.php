<?php
session_start();
include '../module/class-student.php';
$studObj = new Student;
$students_count = $studObj -> selectCountNewStudent();
$students = $studObj -> selectNewStudent();
/* function to get count of all new students*/
function newStudentCount()
{
	global $students_count;
	if($students_count != NULL)
	{
		foreach ($students_count as $key => $studentcount) 
		{
			$nummber = $studentcount;
		}
		echo "<span class='badge'>".$nummber."</span>";
	}
}// end of function newStudentCount

/* function to get count of all new students*/
function drewnewStudent()
{
	global $students;
	if($students != NULL)
	{
		echo "<div class='col-md-12' style='color:#0f0039;text-align:center'>";
		echo "<table class='table table-hover'>";
		echo "<thead>";
		echo "<tr style='text-align:center'>";
		echo"<th> Name</th>";
		echo"<th> Mail</th>";
		echo"<th> Gender</th>";
		echo"<th> Profile Pic</th>";
		echo"<th> Birth-Date</th>";
		echo"<th> Collage</th>";
		echo"<th> Grades</th>";
		echo"<th> Graduation-year</th>";
		echo"<th> Branch</th>";
		echo"<th> Track</th>";
		echo"<th> Action</th>";
		echo "</tr></thead>";
		echo"<tbody><tr>";
		
		foreach ($students as $key => $student) 
		{
			echo"<td>".$student['name']."</td>";
			echo"<td>".$student['mail']."</td>";
			echo"<td>".$student['gender']."</td>";
			echo"<td><img src='../".$student['pic']."' style='width:45px;height:40px;margin-left:10px;' class='img-responsive img-rounded'/></td>";
			echo"<td>".$student['bod']."</td>";
			echo"<td>".$student['collage']."</td>";
			echo"<td>".$student['grades']."</td>";
			echo"<td>".$student['grad_year']."</td>";
			echo"<td>".$student['Branch']."</td>";
			echo"<td>".$student['Track']."</td>";
			echo"<td><button class='btn btn-success'>activate</button></td>";

		}
		echo "</tr></tbody></table></div>";
	}
	else
	{
		echo"<div class='col-md-12' style='text-align:center;'>";
		echo "<span style='color:#ccc;font-size:18px'> No new students registered ... <span>";
		echo "</div>";
	}
	
}// end of drewnewStudent




?>