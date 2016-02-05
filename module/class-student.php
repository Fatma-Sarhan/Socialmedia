<?php
/**
* class of students
*/
class Student
{
	var $id;
	var $name;
	var $mail;
	var $gender;
	var $pic;
	var $BOD;
	var $collage;
	var $grads;
	var $grad_year;
	var $branch;
	var $track;
	var $status;
	private static $conn = Null;

	function __construct($id=-1) 
	{
		if(self::$conn == Null) 
		{
			self::$conn = mysqli_connect('localhost','root','iti','itians');
		}
	}
	function selectStudents()
	{
		$query = "SELECT * From student";
		$result = mysqli_query(self::$conn,$query);
		$data = [];
		while($student = mysqli_fetch_assoc($result))
		{
			$data[] = $student;
		}
		return $data;
	}
	function selectStudent($id)
	{
		$query = "SELECT * From student WHERE id='$id' LIMIT 1";
		$result = mysqli_query(self::$conn,$query);
		$student = mysqli_fetch_assoc($result);
		return $student;
	}
	function selectCountNewStudent()
	{
		$query = "SELECT id , count(id) AS numbers From student WHERE status='0' GROUP BY id";
		$result = mysqli_query(self::$conn,$query);
		$student = mysqli_fetch_assoc($result);
		return $student;
	}

	function selectNewStudent()
	{
		$query = "SELECT S.*,B.name As Branch,T.name AS Track  From student S,branch B,track T WHERE S.status='0' AND S.branch_id=B.id AND S.track_id = T.id ";
		$result = mysqli_query(self::$conn,$query);
		$data = [];
		while($student = mysqli_fetch_assoc($result))
		{
			$data[] = $student;
		}
		return $data;
	}
	function selectStudentByMail($mail)
	{
		$query = "SELECT * From student WHERE mail='$mail' LIMIT 1";
		$result = mysqli_query(self::$conn,$query);
		$student = mysqli_fetch_assoc($result);
		return $student;
	}
	function isExsistMail($mail)
	{
		$query = "SELECT * From student WHERE mail='$mail' LIMIT 1";
		$result = mysqli_query(self::$conn,$query);
		return (mysqli_num_rows($result)>0)?True:False ;
	}
	function insertStudent()
	{
		$query = "INSERT INTO student id,name,mail,gender,pic,BOD,collage,grads,grad_year,branch,track,status VALUES (null,'$this->id','$this->name','$this->mail','$this->gender','$this->pic','$this->BOD','$this->collage','$this->grads','$this->grad_year','$this->branch','$this->track','$this->status')";
		$result = mysqli_query(self::$conn,$query);
		return mysqli_insert_id(self::$conn);
	}
	function updatStudent($id)
	{
		$query = "UPDATE student SET name='$this->name',mail='$this->mail',gender='$this->gender',pic='$this->pic',bod='$this->bod',collage='$this->collage',grads='$this->grads',grad_year='$this->grad_year',branch='$this->branch',track='$this->track',status='$this->status' WHERE id = '$id'";
		$result = mysqli_query(self::$conn,$query);
		return (mysqli_num_rows($result)>0)?True:False ;
	}
	function deleteStudent($id)
	{
		$query = "DELETE FROM student WHERE id = '$id'";
		$result = mysqli_query(self::$conn,$query);
		return (mysqli_num_rows($result)>0)?True:False ;
	}

}


?>