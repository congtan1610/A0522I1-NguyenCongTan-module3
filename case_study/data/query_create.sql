create database iNotes;
use iNotes;
create table type_note(
	id int(11) auto_increment,
    name nvarchar(100),
    description nvarchar(200),
    primary key (id,name)
);
create table note(
	id int(11) auto_increment primary key,
    title nvarchar(100),
    content nvarchar(500),
    type_id  int(11),
    foreign key(type_id) references type_note(id)
);