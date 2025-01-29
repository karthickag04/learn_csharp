create database schoolapp;

CREATE TABLE tbl_users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(100) NOT NULL UNIQUE,
    email NVARCHAR(200) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL
);


CREATE TABLE menus (
    menu_id INT IDENTITY(1,1) PRIMARY KEY,
    menuname NVARCHAR(100) NOT NULL UNIQUE,
    
);


INSERT INTO menus (menuname) VALUES ('Dashboard');
INSERT INTO menus (menuname) VALUES ('Students');
INSERT INTO menus (menuname) VALUES ('Teachers');
INSERT INTO menus (menuname) VALUES ('Courses');
INSERT INTO menus (menuname) VALUES ('Settings');

