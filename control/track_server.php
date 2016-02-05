<?php 

	include 'module/track.php';
	$track=new track();
	

	//--------------------------- list all -------------------------//

	if(isset($_GET['action']))
	{
		if(!empty($_GET['action']))
		{
			if($_GET['action']=='list')
			{
				$all_tracks=$tack->tracks();
				$all_tracks=json_encode($all_tracks);
				echo $all_tracks;
			}
		}
	}

	//------------------------ delete track ---------------------------//

	if(isset($_GET['id'])) 
	{
		if(!empty($_GET['id']))
		{
			
			$track->delete($_GET['id']);
		}
	}

	//------------------------ insert track ----------------------------//

	if(isset($_POST['insert']))
	{

		// first : check $_POST values
		//second : use values
		$track->name = $_POST['name'];
		$track->sup_id = $_POST['psup_id'];
		$track->no_course = $_POST['pno_course'];
		$track->no_stud = $_POST['no_stud'];
		$track->leader_id = $_POST['leader_id'];
		
		$track_id=$track->insert();
	}

	//------------------------ update track ----------------------------//

	  	if( isset($GET['id']))       //1-GET    2-POST
		{

			if(!empty($_GET['id']))
			{
				$data=$track->get_track($_GET['id']); //get all info about track want to update
			}
		}

		if(isset($_POST['update']))
		{
			// first : check $_POST values
			//second : use values
			$track->id = $_GET['id'];
			$track->name = $_POST['name'];
			$track->sup_id = $_POST['psup_id'];
			$track->no_course = $_POST['pno_course'];
			$track->no_stud = $_POST['no_stud'];
			$track->leader_id = $_POST['leader_id'];
			
			$track->update();
		}
	

	
	
 ?>