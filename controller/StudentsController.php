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
			$result = $this->students->index();
			include_once 'views/dashboard.php';
		}

	}