<?php  
	include_once 'config/myConfig.php';
	/**
	 * 
	 */
	class Students extends Connect
	{
		
		function __construct()
		{
			parent::__construct(); // $this->conn auto connect database
		}

		// Viết các hàm tương tác với cơ sở dữ liệu
		public function index(){
			$result = array();

			$sql = "SELECT *FROM students, facultys WHERE students.facultys_id = facultys.id";
			$query = mysqli_query($this->conn, $sql);
			while ($row = mysqli_fetch_assoc($query)) {
				$result[] = $row;
			}

			return $result;
		}
	}

	
	