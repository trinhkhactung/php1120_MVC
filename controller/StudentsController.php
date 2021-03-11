<?php

	include_once 'model/Students.php';

	/**
	 * 
	 */
	class StudentsController extends Students
	{
		private $students;

		function __construct()
		{
			$this->students = new Students();
		}

		public function studnts(){
			if (isset($_GET['method'])) {
				$method = $_GET['method'];
			}else{
				$method = 'index';
			}
			switch ($method) {
				case 'index':
					$result = $this->students->index();
					include_once 'views/dashboard.php';
					break;
				
				case 'destroy':
					if (isset($_GET['id'])) {
						$id = (int)$_GET['id'];
						$destroy = $this->students->destroy($id);
					}
					header('Location: index.php');
					break;

				default:
					# code...
					break;
			}
			
		}

	}