--会議室
insert into meeting_room (room_name) values('新木場');
insert into meeting_room (room_name) values('辰巳');
insert into meeting_room (room_name) values('豊洲');
insert into meeting_room (room_name) values('月島');
insert into meeting_room (room_name) values('新富町');
insert into meeting_room (room_name) values('銀座一丁目');
insert into meeting_room (room_name) values('有楽町');

--会議室の予約可能日(room_idが2~6用のSQLは省略)
--room_id=1(新木場)の予約可能日
insert into reservable_room(reserved_date, room_id) values (curdate(), 1);
insert into reservable_room(reserved_date, room_id) values (curdate() + 1, 1);
insert into reservable_room(reserved_date, room_id) values (curdate() - 1, 1);
insert into reservable_room(reserved_date, room_id) values (curdate(), 2);
insert into reservable_room(reserved_date, room_id) values (curdate() + 1, 2);
insert into reservable_room(reserved_date, room_id) values (curdate() - 1, 2);
insert into reservable_room(reserved_date, room_id) values (curdate(), 3);
insert into reservable_room(reserved_date, room_id) values (curdate() + 1, 3);
insert into reservable_room(reserved_date, room_id) values (curdate() - 1, 3);
insert into reservable_room(reserved_date, room_id) values (curdate(), 4);
insert into reservable_room(reserved_date, room_id) values (curdate() + 1, 4);
insert into reservable_room(reserved_date, room_id) values (curdate() - 1, 4);
insert into reservable_room(reserved_date, room_id) values (curdate(), 5);
insert into reservable_room(reserved_date, room_id) values (curdate() + 1, 5);
insert into reservable_room(reserved_date, room_id) values (curdate() - 1, 5);
insert into reservable_room(reserved_date, room_id) values (curdate(), 6);
insert into reservable_room(reserved_date, room_id) values (curdate() + 1, 6);
insert into reservable_room(reserved_date, room_id) values (curdate() - 1, 6);
--room_id=7(有楽町)の予約可能日
insert into reservable_room(reserved_date, room_id) values (curdate(), 7);
insert into reservable_room(reserved_date, room_id) values (curdate() + 1, 7);
insert into reservable_room(reserved_date, room_id) values (curdate() - 1, 7);

--ダミーユーザー
insert into usr (user_id, first_name, last_name, password, role_name)
values ('taro-yamada', '太郎', '山田', '$2a$10$oxSJl.keBwxmsMLKcT9lPeAIxfNTPNQxpeywMrF7A3kVszwUTqfTK', 'USER');
--認証確認用のテストユーザー(password = demo)
insert into usr (user_id, first_name, last_name, password, role_name)
values ('aaaa', 'Aaa', 'Aaa', 'demo', 'USER');
insert into usr (user_id, first_name, last_name, password, role_name)
values ('bbbb', 'Bbb', 'Bbb', '$2a$10$oxSJl.keBwxmsMLKcT9lPeAIxfNTPNQxpeywMrF7A3kVszwUTqfTK', 'USER');
insert into usr (user_id, first_name, last_name, password, role_name)
values ('cccc', 'Ccc', 'Ccc', '$2a$10$oxSJl.keBwxmsMLKcT9lPeAIxfNTPNQxpeywMrF7A3kVszwUTqfTK', 'ADMIN');