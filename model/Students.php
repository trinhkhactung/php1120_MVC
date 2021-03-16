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

			$sql = "SELECT students.name, students.id, students.email, students.phone, facultys.title FROM students, facultys WHERE students.facultys_id = facultys.id";
			$pre = $this->pdo->prepare($sql);
			$pre->execute();
			return $pre->fetchAll(PDO::FETCH_ASSOC);
		}

		public function destroy($id){
			$sql = "DELETE FROM students WHERE id = $id";
			return mysqli_query($this->conn, $sql);
		}

		public function searchStudents($phone){
			$result = array();

			$sql = "SELECT students.name, students.id, students.email, students.phone, facultys.title FROM students, facultys WHERE students.facultys_id = facultys.id AND students.phone LIKE :phone";
			$pre = $this->pdo->prepare($sql);
			$pre->bindParam(':phone', $phone);
			$pre->execute();
			return $pre->fetchAll(PDO::FETCH_ASSOC);
		}

	}

	
	