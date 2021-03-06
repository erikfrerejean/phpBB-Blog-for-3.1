# DO NOT EDIT THIS FILE, IT IS GENERATED
#
# To change the contents of this file, edit
# phpBB/develop/create_schema_files.php and
# run it.
# Table: 'phpbb_blog_categories'
CREATE TABLE phpbb_blog_categories (
	id mediumint(8) UNSIGNED NOT NULL auto_increment,
	title varchar(255) DEFAULT '' NOT NULL,
	description mediumtext NOT NULL,
	description_options int(11) UNSIGNED DEFAULT '0' NOT NULL,
	description_bitfield varchar(255) DEFAULT '' NOT NULL,
	description_uid varchar(8) DEFAULT '' NOT NULL,
	total_posts mediumint(8) UNSIGNED DEFAULT '0' NOT NULL,
	last_post_id mediumint(8) UNSIGNED DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
) CHARACTER SET `utf8` COLLATE `utf8_bin`;


# Table: 'phpbb_blog_post_comments'
CREATE TABLE phpbb_blog_post_comments (
	id mediumint(8) UNSIGNED NOT NULL auto_increment,
	post_id int(11) UNSIGNED DEFAULT '0' NOT NULL,
	commenter_id int(11) UNSIGNED DEFAULT '0' NOT NULL,
	comment mediumtext NOT NULL,
	comment_options int(11) UNSIGNED DEFAULT '0' NOT NULL,
	comment_bitfield varchar(255) DEFAULT '' NOT NULL,
	comment_uid varchar(8) DEFAULT '' NOT NULL,
	ctime int(11) UNSIGNED DEFAULT '0' NOT NULL,
	PRIMARY KEY (id),
	KEY post (post_id),
	KEY ctime (ctime)
) CHARACTER SET `utf8` COLLATE `utf8_bin`;


# Table: 'phpbb_blog_posts'
CREATE TABLE phpbb_blog_posts (
	id mediumint(8) UNSIGNED NOT NULL auto_increment,
	category int(11) UNSIGNED DEFAULT '0' NOT NULL,
	title varchar(255) DEFAULT '' NOT NULL,
	poster_id int(11) UNSIGNED DEFAULT '0' NOT NULL,
	post mediumtext NOT NULL,
	post_options int(11) UNSIGNED DEFAULT '0' NOT NULL,
	post_bitfield varchar(255) DEFAULT '' NOT NULL,
	post_uid varchar(8) DEFAULT '' NOT NULL,
	ptime int(11) UNSIGNED DEFAULT '0' NOT NULL,
	post_read_count mediumint(8) UNSIGNED DEFAULT '0' NOT NULL,
	post_last_edit_time mediumint(8) UNSIGNED DEFAULT '0' NOT NULL,
	post_edit_count mediumint(8) UNSIGNED DEFAULT '0' NOT NULL,
	post_comment_count mediumint(8) UNSIGNED DEFAULT '0' NOT NULL,
	post_comment_lock tinyint(1) UNSIGNED DEFAULT '0' NOT NULL,
	PRIMARY KEY (id),
	KEY category (category),
	KEY poster (poster_id),
	KEY ptime (ptime)
) CHARACTER SET `utf8` COLLATE `utf8_bin`;


# Table: 'phpbb_blog_tags'
CREATE TABLE phpbb_blog_tags (
	id mediumint(8) UNSIGNED NOT NULL auto_increment,
	tag varchar(255) DEFAULT '' NOT NULL,
	tag_count mediumint(8) UNSIGNED DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
) CHARACTER SET `utf8` COLLATE `utf8_bin`;


