<?php
include '../module/class-student.php';
$studObj = new Student;
if(isset($_GET['method']))
{
	$method = $_GET['method'];
	switch ($method) {
		/*select all students*/
		case 'select_students':
		$students = $studObj -> selectStudents();
		echo json_encode($students);
			break;
		/*select  student by id*/
		case 'select_student_by_id':
		$id = $_GET['id'];
		$student = $studObj -> selectStudent($id);
		echo json_encode($student);
			break;
		/*select  student by email*/
		case 'select_student_by_mail':
		$mial = $_GET['mail'];
		$student = $studObj -> selectStudentByMail($mail);
		echo json_encode($student);
			break;
		/*insert new student*/
		case 'insert_student':
		//$this->id = $_POST['id'];
		// $this->name = $_POST['name'];
		// $this->mail = $_POST['mail'];
		//$this->gender = $_POST['gender'];
		//$this->pic = $_POST['pic'];
		//$this->BOD = $_POST['bod'];
		// $this->collage = $_POST['collage'];
		// $this->grads = $_POST['grads'];
		// $this->grad_year = $_POST['grad_year'];
		// $this->branch = $_POST['branch'];
		// $this->track = $_POST['track'];
		// $this->status = $_POST['status'];
		// $row = $studObj -> insertStudent();
		// if($row>0)
		// {
		// 	$studArr = array("result"=>"true");
		// }
		// else
		// {
		// 	$studArr = array("result"=>"false");
		// }
		// echo json_encode($studArr);
		//echo $_POST['name'];
		echo json_encode($_POST['name']);
			break;
		/*insert new student*/
		case 'update_student':
		$this->id = $_POST['id'];
		$this->name = $_POST['name'];
		$this->mial = $_POST['mail'];
		$this->gender = $_POST['gender'];
		$this->pic = $_POST['pic'];
		$this->BOD = $_POST['bod'];
		$this->collage = $_POST['collage'];
		$this->grads = $_POST['grads'];
		$this->grad_year = $_POST['grad_year'];
		$this->branch = $_POST['branch'];
		$this->track = $_POST['track'];
		$this->status = $_POST['status'];
		$response = $studObj -> updateStudent();
		if($response=='True')
		{
			$studArr = array('result'=>'true');
		}
		else
		{
			$studArr = array('result'=>'false');
		}
		echo json_encode($studArr);
			break;
		/*insert new student*/
		case 'delete_student':
		$id = $_GET['id'];
		$response = $studObj -> deleteStudent();
		if($response=='True')
		{
			$studArr = array('result'=>'true');
		}
		else
		{
			$studArr = array('result'=>'false');
		}
		echo json_encode($studArr);
			break;
		case 'mail_exist':
		$mail = $_GET['mail'];
		$response = $studObj -> isExsistMail($mail);
		if($response=='True')
		{
			$studArr = array('result'=>'false');
		}
		else
		{
			$studArr = array('result'=>'true');
		}
		echo json_encode($studArr);
			break;
		
		default:
			echo "no method selected";
			break;
	}
}
else
	echo "no method selected";
?>