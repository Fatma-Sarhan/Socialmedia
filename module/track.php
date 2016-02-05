<?php  
	class track {
		private static $conn = Null;
		var $id;
		var $name;
		var $sup_id;
		var $no_course;
		var $no_stud;
		var $leader_id;
		// ----------------default: select with specific id ------------------//
		public function __construct($id=-1) 
		{
			if(is_null(self::$conn)) self::$conn = mysqli_connect('localhost','root','iti','itians');
			if($id!=-1)
			 {
				$query = "select * from track where id=$id ";
				$result = mysqli_query(self::$conn,$query);
				$track = mysqli_fetch_assoc($result);
				$this->id = $track['id'];
				$this->name = $track['name '];
				$this->sup_id = $track['psup_id '];
				$this->no_course = $track['pno_course'];
				$this->no_stud = $track['no_stud'];
				$this->leader_id = $track['leader_id'];
				
				
			}
		}
		//------------------ select all tracks ------------------//
		function tracks()   
		{
			$query = "select * from track";
			$result = mysqli_query(self::$conn,$query);
			$all_tracks = [];
			while($row = mysqli_fetch_assoc($result)) 
				{
					$all_tracks[] = $row;
				}
			return $all_tracks;
		}
		//------------------- insert track ------------------------//
		function insert() 
		{
			$query = "insert into track (name, sup_id, no_course , no_stud , leader_id ) values('$this->name','$this->sup_id','$this->no_course','$this->no_stud','$this->leader_id')";
			$result  = mysqli_query(self::$conn,$query);
			return mysqli_insert_id(self::$conn);
		}
		//--------------------- delete tack -----------------------//
		function delete ($id)
		{
			$query = "delete from track where id=$id";
			mysqli_query(self::$conn,$query);
		}
		//------------------- update track -------------------------//
		function update() 
		{
			$query = "update track set name='$this->name', sup_id='$this->sup_id', no_course='$this->no_course', no_stud='$this->no_stud', leader_id='$this->leader_id' where id=$this->id";
			mysqli_query(self::$conn,$query);
		}
		//------------------ search by name ------------------------//
		function is_exist($name)
		{
			$query = "select id from track where name='$name' ";
			$result = mysqli_query(self::$conn,$query);
			return (mysqli_num_rows($result)>0)?True:False ;
		}
		//------------------- get full info about track with sup_id-------------//
		function get_track($id)   
		{
			$query = "select * from track where sup_id=$id ";
			$result = mysqli_query(self::$conn,$query);
			$data = [];
			while($row = mysqli_fetch_assoc($result)) 
				{
					$data[] = $row;
				}
			return $data;
		
		}
	}
?>