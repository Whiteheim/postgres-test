create table orders (
 id serial primary key,
 status varchar(50),
 created_at timestamptz
);

create table beverages (
  id serial primary key,
  name varchar(255),
  price integer,
  btype varchar(255)
);

create table order_details (
 id serial primary key,
 order_id integer references orders(id),
 beverage_id integer references beverages(id),
 count integer
);

-- 주문(orders)
INSERT INTO
orders(status, created_at)
VALUES
('DELIVERED', '2022-02-26 8:32:13'),
('CANCELLED', '2022-02-26 8:35:27'),
('DELIVERED', '2022-02-26 8:44:53'),
('DELIVERED', '2022-02-26 9:05:12'),
('DELIVERED', '2022-02-26 9:11:35'),
('DELIVERED', '2022-02-26 9:14:18'),
('DELIVERED', '2022-02-26 9:34:20'),
('DELIVERED', '2022-02-26 9:44:27'),
('DELIVERED', '2022-02-26 9:48:25'),
('DELIVERED', '2022-02-26 11:14:52'),
('CANCELLED', '2022-02-26 11:32:13'),
('DELIVERED', '2022-02-26 11:55:40'),
('DELIVERED', '2022-02-26 12:15:01'),
('DELIVERED', '2022-02-26 12:21:52'),
('CANCELLED', '2022-02-26 12:29:17')
;
-- 음료(beverages)
INSERT INTO
beverages(name, price, btype)
VALUES
('아메리카노', 4500, 'COFFEE'),
('라떼', 5000, 'COFFEE'),
('카푸치노', 5000, 'COFFEE'),
('카페모카', 5500, 'COFFEE'),
('콜드브루', 5200, 'COFFEE'),
('레몬 에이드', 3800, 'AID'),
('자몽 에이드', 4800, 'AID'),
('바닐라 쉐이크', 5800, 'SHAKE')
;
-- 주문내역(order_details)
INSERT INTO
order_details(order_id, beverage_id, count)
VALUES
(1, 1, 1),
(2, 1, 2),
(2, 2, 3),
(2, 8, 2),
(3, 1, 2),
(4, 8, 1),
(5, 4, 1),
(6, 5, 3),
(7, 1, 3),
(7, 2, 2),
(8, 1, 1),
(9, 5, 1),
(10, 1, 4),
(11, 2, 1),
(12, 3, 1),
(13, 1, 6),
(14, 1, 8),
(14, 2, 2),
(14, 6, 1),
(15, 1, 4)
;


-- 주문#2에 담긴 음료 이름들
-- JOIN 문법 사용(다음 강의에서 배움)
SELECT
beverages.name
FROM
 order_details
JOIN beverages ON
beverages.id = order_details.beverage_id
WHERE
order_id = 2
;
-- 취소된 주문내역의 id들
-- JOIN 문법 사용(다음 강의에서 배움)
SELECT
order_details.id
FROM
order_details
JOIN orders ON
orders.id = order_details.order_id
WHERE
orders.status = 'CANCELLED'
;
-- 주문#14의 매출
-- JOIN 문법 사용(다음 강의에서 배움)
SELECT
SUM(order_details.count * beverages.price)
FROM
order_details
JOIN beverages ON
beverages.id = order_details.beverage_id
WHERE
order_id = 14
;

--DROP TABLE likes;
--DROP TABLE settings;
--DROP TABLE comments;
--DROP TABLE photos;
--DROP TABLE users;

-- users 테이블
CREATE TABLE users (
id SERIAL PRIMARY KEY,
nickname VARCHAR(50),
email VARCHAR(100)
);
-- photos 테이블
CREATE TABLE photos (
id SERIAL PRIMARY KEY,
filename VARCHAR(255),
user_id INTEGER REFERENCES users(id)
);
-- comments 테이블
CREATE TABLE comments (
id SERIAL PRIMARY KEY,
body VARCHAR(1000),
user_id INTEGER REFERENCES users(id),
photo_id INTEGER REFERENCES photos(id)
);
-- settings 테이블
CREATE TABLE settings (
id SERIAL PRIMARY KEY,
private BOOLEAN,
adding_photos VARCHAR(15),
user_id INTEGER UNIQUE REFERENCES users(id)
);
-- likes 테이블 생성(사용자와 사진을 다대다 연결)
CREATE TABLE likes (
id SERIAL PRIMARY KEY,
user_id INTEGER REFERENCES users(id),
photo_id INTEGER REFERENCES photos(id)
);

-- users 레코드
INSERT INTO
users(nickname, email)
VALUES
('cloudstudying_kr', 'mail@cloudstudying.kr'),
('hongpark_cs', 'sehongpark@cloudstudying.kr'),
('haesamq', 'haesamq@naver.com')
;
-- photos 레코드
INSERT INTO
photos(filename, user_id)
VALUES
('cat-on-road.jpg', 1),
('sunset-over-the-ocean.jpg', 1),
('andromeda-galaxy.jpg', 1),
('white-tiger.jpg', 2),
('nero-the-black-cat.jpg', 2),
('deleted-image.jpg', NULL),
('blocked-image.jpg', NULL)
;
-- comments 레코드
INSERT INTO
comments(body, user_id, photo_id)
VALUES
('meow', 1, 1),
('nyaong', 2, 1),
('냐옹', 3, 1),
('sunset', 1, 2),
('falling slowly', 2, 2),
('Andromeda galaxy', 1, 3),
('mysteriouse..!', 3, 3),
('wow..!', 3, NULL),
('oh..!', 3, NULL)
;
-- settings 레코드
INSERT INTO
settings(private, adding_photos, user_id)
VALUES
(FALSE, 'MANUAL', 1),
(FALSE, 'AUTO', 2),
(TRUE, 'AUTO', 3)
;
-- likes 레코드
INSERT INTO
likes(user_id, photo_id)
VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(3, 3),
(NULL, 6),
(NULL, 7)
;

select users.nickname, comments.body
from comments 
join users on 
	users.id = comments.user_id
where 
	comments.photo_id = 1
;


select 
	photos.filename,
	users.nickname
from 
	photos
join users on
	users.id = photos.user_id
where photos.id = 5
;

select 
	users.nickname,
	photos.filename
from
	likes 
join users on 
	users.id = likes.user_id
join photos on
	photos.id = likes.photo_id
where 
	photos.id = 2
;

-- 모든 사진의 파일명 조회 / 게시자가 있을 시 닉네임도 함께 가져오기
select
	photos.filename, users.nickname
from photos
left join users on 
	users.id = photos.user_id 	
;

-- 모든 댓글의 내용 조회 / 댓글이 달린 사진의 파일명도 함께 가져오기
select 
	comments.body, 
	photos.filename
from comments
left join photos on
	comments.photo_id = photos.id
;
















