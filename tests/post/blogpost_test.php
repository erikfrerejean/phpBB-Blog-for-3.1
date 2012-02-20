<?php

class blogpost_test extends DBTestCase
{
	protected function getDataSet()
	{
		return $this->createXMLDataSet(dirname(__FILE__) . '/fixture.xml');
	}

	/**
	 * Load an blog post from the database
	 */
	public function test_load_blog()
	{
		$db = $this->getDBAL();

		$bp = new phpbb_ext_blog_core_post($db, 1);

		// Tests
		$this->assertSame('Test Post', $bp->getTitle());
	}
}
