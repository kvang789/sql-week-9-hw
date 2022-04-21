CREATE DATABASE IF NOT EXISTS users;

USE users;

DROP TABLE IF EXISTS user_activities;
DROP TABLE IF EXISTS activities;
DROP TABLE IF EXISTS users;

CREATE TABLE users ( 
	user_id INT NOT NULL AUTO_INCREMENT,
	username varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	password varchar(40) NOT NULL,
	PRIMARY KEY (user_id)
);

CREATE TABLE activities ( 
	activity_id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	post text NOT NULL,
	publish_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (activity_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE user_activities ( 
	user_activity_id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	activity_id INT NOT NULL,
	comment text NOT NULL,
	publish_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (user_activity_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (activity_id) REFERENCES activities (activity_id)
);