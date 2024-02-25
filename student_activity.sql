create database student_activity character set 'utf8';

use student_activity;

create table categories (
    id char(2),
    name varchar(100) not null,
    primary key (id)
);

create table staff (
	id char(6),
    fullname varchar(255) not null, 
    email varchar(128) not null unique, 
    pic varchar(128), 
    password varchar(255),
    primary key (id)
);

create table activities (
	id int AUTO_INCREMENT,
    name varchar(100) not null, 
    semester tinyint not null, 
    edu_year int not null, 
    cat_id char(2) not null, 
    start datetime not null, 
    end datetime not null, 
    seats int default 50, 
    edited_by char(6) not null, 
    edited_on timestamp default CURRENT_TIMESTAMP,
    primary key (id),
    FOREIGN KEY (cat_id) references categories (id),
    FOREIGN KEY (edited_by) references staff (id)
);

create table faculties (
    id int AUTO_INCREMENT,
    name varchar(100) not null,
    primary key (id)
);

create table departments (
    id char(2),
    name varchar(100) not null,
    fac_id int not null,
    primary key (id),
    FOREIGN KEY (fac_id) references faculties (id)
);

create table students (
	id char(8),
    fullname varchar(255) not null, 
    email varchar(128) not null unique, 
    dep_id char(2) not null, 
    pic varchar(128), 
    password varchar(255) not null,
    primary key (id),
    FOREIGN KEY (dep_id) REFERENCES departments (id)
);

create table enrollments (
	stu_id char(8), 
    act_id INT,
    enroll_on timestamp default CURRENT_TIMESTAMP, 
    status boolean default false, 
    approved_by char(6) not null, 
    approved_on timestamp default CURRENT_TIMESTAMP,
    primary key (stu_id, act_id),
    FOREIGN KEY (stu_id) references students (id),
    FOREIGN KEY (act_id) REFERENCES activities (id),
    FOREIGN KEY (approved_by) references staff (id)
);