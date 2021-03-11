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
			return 'Danh sách học viên';
		}
	}

	
	