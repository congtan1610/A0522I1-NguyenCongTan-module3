create table `student_manager`.`Class`(
`id` int not null,
`name` varchar(45) null,
primary key(id)
);
create table `student_manager`.`Teacher`(
`id` int not null,
`name` varchar(45) null,
`age` int null,
`country` varchar(45) null,
primary key(id)
);