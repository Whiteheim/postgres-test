postgres=# Create database instagram;
CREATE DATABASE
postgres=# \connect instagram
You are now connected to database "instagram" as user "kangseonghun".

instagram=# create table users (
id serial primary key, -- pk선언 (serial:자동생성 타입)
nickname varchar(50),
email varchar(100));
CREATE TABLE

instagram=# insert into users (nickname, email) values('cloudying_kr', 'mail@cloudying.kr'),
('hongpark_cs', 'sehongpark@cloudstudying.kr'),
('haesamq', 'haesamq@naver.com');
INSERT 0 3
instagram=# select * from users;
 id |   nickname   |            email            
----+--------------+-----------------------------
  1 | cloudying_kr | mail@cloudying.kr
  2 | hongpark_cs  | sehongpark@cloudstudying.kr
  3 | haesamq      | haesamq@naver.com
(3 rows)

instagram=# create table photos (
id serial primary key,
filename varchar(255),
user_id integer references users(id)-- FK선언: 사진 게시자의 PK로 연결;
instagram(# );
CREATE TABLE

instagram=# insert into photos( filename, user_id)
values('cat-on-road.jpg', 1),
('sunset-over-the-ocean.jpg', 1),
('andromeda-galaxy.jpg', 1),
('white-tiger.jpg', 2),
('nero-the-black-cat.jpg', 2);
INSERT 0 5
instagram=# select * from photos;
 id |         filename          | user_id 
----+---------------------------+---------
  1 | cat-on-road.jpg           |       1
  2 | sunset-over-the-ocean.jpg |       1
  3 | andromeda-galaxy.jpg      |       1
  4 | white-tiger.jpg           |       2
  5 | nero-the-black-cat.jpg    |       2
(5 rows)

instagram=# create table comments (
instagram(# id serial primary key,
instagram(# body varchar(1000),
instagram(# user_id integer references users(id),
instagram(# photo_id integer references photos(id)
instagram(# );
CREATE TABLE
instagram=# insert into comments(body, user_id, photo_id) values
instagram-# ('meow', 1, 1),
instagram-# ('nyaong', 2, 1),
instagram-# ('냐옹', 3, 1),
instagram-# ('sunset', 1, 2),
instagram-# ('falling slowly', 2, 2),
instagram-# ('Anfromeda Galaxy', 1, 3),
instagram-# ('mysterious..!', 3, 3);
INSERT 0 7
instagram=# select * from comments;
 id |       body       | user_id | photo_id 
----+------------------+---------+----------
  1 | meow             |       1 |        1
  2 | nyaong           |       2 |        1
  3 | 냐옹             |       3 |        1
  4 | sunset           |       1 |        2
  5 | falling slowly   |       2 |        2
  6 | Anfromeda Galaxy |       1 |        3
  7 | mysterious..!    |       3 |        3
(7 rows)

instagram=# update comments set body = 'Andromeda Galaxy' where id = 6;
UPDATE 1
instagram=# select * from comments;
 id |       body       | user_id | photo_id 
----+------------------+---------+----------
  1 | meow             |       1 |        1
  2 | nyaong           |       2 |        1
  3 | 냐옹             |       3 |        1
  4 | sunset           |       1 |        2
  5 | falling slowly   |       2 |        2
  7 | mysterious..!    |       3 |        3
  6 | Andromeda Galaxy |       1 |        3
(7 rows)

instagram=# 
