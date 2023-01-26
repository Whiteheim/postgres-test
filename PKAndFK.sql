-- settings 테이블 생성
create table settings(
	id serial primary key, 	-- PK
	private boolean,		-- boolean : 참 / 거짓 
	adding_photos varchar(15),
	user_id integer unique references users(id) -- FK : 개인설정 유저 (1:1)
);

-- settings 레코드 생성
insert INTO settings (private, adding_photos, user_id) 
values 
(false, 'MANUAL', 1), -- 유저 1
(false, 'AUTO', 2), -- 유저 2
(true, 'AUTO', 3)  -- 유저 3
;
-- settings 조회
select * from settings;

-- insert INTO settings (private, adding_photos, user_id) 
-- values (true, 'AUTO', 3);  -- 유저 3
-- 제약조건으로 인해 생성되지않

-- Like table 생성
create table likes (
	id serial 	primary key, 					-- PK
	user_id 	integer references users(id),	-- FK : 좋아요를 누른 user (N : 1)
	photo_id 	integer references photos(id)	-- FK : 좋아요가 달린 사진 (M : 1)
);

-- likes 레코드 생성
insert into likes (user_id, photo_id)
values 
-- 1번 사진 좋아
(1, 1),
(2, 1),
-- 2번 사진 좋아요 
(1, 2),
(2, 2),
(3, 2),
-- 3번 사진 좋아요
(1, 3),
(3, 3);

-- likes 조회
select  * from likes;

-- 가장 좋아요를 많이 받은 사진 조회
select photo_id, count(user_id) as cnt 
from likes 
group by photo_id 
order by cnt desc limit 1;

-- 가장 좋아요를 적게 받은 사진 조회
select photo_id, count(user_id) as cnt
from likes
group by photo_id 
order by cnt limit 1;

-- 좋아요를 가장 많이 누른 유저의 private 설정값
select private 
from settings
where id = 1;

select user_id, count(photo_id) as cnt
from likes
group by user_id 
order by cnt desc;
















