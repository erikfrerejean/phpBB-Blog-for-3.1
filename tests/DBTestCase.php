<?php

abstract class DBTestCase extends PHPUnit_Extensions_Database_TestCase
{
	protected function getConnection()
	{
		switch ($GLOBALS['dbms'])
		{
			case 'sqlite' :
				$pdo_string = 'sqlite2:' . $GLOBALS['dbhost'];
			break;

			case 'mysqli' :
			case 'mysql'  :
				$pdo_string = 'mysql:host=' . $GLOBALS['dbhost'];

				if ($GLOBALS['dbport'])
				{
					$pdo_string .= ';port=' . $GLOBALS['dbport'];
				}

				$pdo_string .= ';dbname=' . $GLOBALS['dbname'];
			break;

			case 'postgres' :
				$pdo_string = 'pgsql:host=' . $GLOBALS['dbhost'];

				if ($GLOBALS['dbport'])
				{
					$pdo_string .= ';port=' . $GLOBALS['dbport'];
				}

				$pdo_string .= ';dbname=' . $GLOBALS['dbname'];
			break;

			default :
				return null;
		}

		$pdo = new PDO($pdo_string, $GLOBALS['dbuser'], $GLOBALS['dbpasswd']);
		return $this->createDefaultDBConnection($pdo, $GLOBALS['dbname']);
	}

	protected function getDBAL()
	{
		global $sql_db;
		global $dbhost, $dbuser, $dbpasswd, $dbname, $dbport;

		$db = new $sql_db();
		$db->sql_connect($dbhost, $dbuser, $dbpasswd, $dbname, $dbport, false, defined('PHPBB_DB_NEW_LINK') ? PHPBB_DB_NEW_LINK : false);

		return $db;
	}
}
