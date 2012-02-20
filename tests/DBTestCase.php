<?php

abstract class DBTestCase extends PHPUnit_Extensions_Database_TestCase
{
	protected function getConnection()
	{
		switch (dbms)
		{
			case 'sqlite' :
				$pdo_string = 'sqlite2:' . dbhost;
			break;

			case 'mysqli' :
			case 'mysql'  :
				$pdo_string = 'mysql:host=' . dbhost;

				if (dbport)
				{
					$pdo_string .= ';port=' . dbport;
				}

				$pdo_string .= ';dbname=' . dbname;
			break;

			case 'postgres' :
				$pdo_string = 'pgsql:host=' . dbhost;

				if (dbport)
				{
					$pdo_string .= ';port=' . dbport;
				}

				$pdo_string .= ';dbname=' . dbname;
			break;

			default :
				return null;
		}

		$pdo = new PDO($pdo_string, dbuser, dbpasswd);
		return $this->createDefaultDBConnection($pdo, dbname);
	}

	protected function getDBAL()
	{
		global $sql_db;

		$db = new $sql_db();
		$db->sql_connect(dbhost, dbuser, dbpasswd, dbname, dbport, false, false);

		return $db;
	}
}
