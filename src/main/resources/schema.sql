alter table reservable_room drop foreign key FK_f4wnx2qj0d59s9tl1q5800fw7;
alter table reservation drop foreign key FK_p1k4iriqd4eo1cpnv79uvni9g;
alter table reservation drop foreign key FK_recqnfjcp370rygd9hjjxjtg;

drop table if exists meeting_room;
drop table if exists reservable_room;
drop table if exists reservation;
drop table if exists usr;

create table if not exists meeting_room(
	room_id int(4) not null auto_increment,
	room_name varchar(255) not null,
	primary key (room_id)
) ENGINE=InnoDB default charset=utf8;

create table if not exists reservable_room (
	reserved_date date not null,
	room_id int(4) not null,
	primary key (reserved_date, room_id)
) ENGINE=InnoDB default charset=utf8;

create table if not exists reservation(
	reservation_id int not null auto_increment,
	end_time time not null,
	start_time time not null,
	reserved_date date not null,
	room_id int(4) not null,
	user_id varchar(255) not null,
	primary key(reservation_id)
) ENGINE=InnoDB default charset=utf8;

create table if not exists usr (
	user_id varchar(255) not null,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	password varchar(255) not null,
	role_name varchar(255) not null,
	primary key (user_id)
) ENGINE=InnoDB default charset=utf8;


alter table reservable_room add constraint FK_f4wnx2qj0d59s9tl1q5800fw7 foreign key (room_id) references meeting_room(room_id) on update restrict on delete restrict;
alter table reservation add constraint FK_p1k4iriqd4eo1cpnv79uvni9g foreign key(reserved_date, room_id) references reservable_room(reserved_date, room_id) on update restrict on delete restrict;
alter table reservation add constraint FK_recqnfjcp370rygd9hjjxjtg foreign key(user_id) references usr(user_id) on update restrict on delete restrict;
