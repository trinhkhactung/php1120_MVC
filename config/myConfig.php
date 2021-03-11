<?php

	/**
	 * Connect database!
	 */
	class Connect
	{
		private const localhost = 'localhost';
		private const user = 'root';
		private const passw = '';
		private const db = 'php1120e_manager';
		protected $conn = null;

		function __construct()
		{
			$this->conn = mysqli_connect(self::localhost, self::user, self::passw, self::db);

			if ($this->conn) {
				mysqli_set_charset($this->conn, 'utf8');
			}else{
				echo "Can't connect database";
				exit();
			}
		}
	}