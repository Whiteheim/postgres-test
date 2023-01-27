-- 1. 음료명, 가격, 가격 차이 조회
select 
	name 				as "음료명",
	price 				as "가격",
 	price - (
 		-- 가장 비싼 음료의 가격
	 	select 
	 		max(price) 
	 	from 
	 		beverages
 	) 					as "최대 가격과의 차이"
from 
	beverages
;

-- 2. 주문 별 음료 개수 평균 집계
select
	round(avg(sum),2) as "주문 별 음료 개수 평균"
from 
	(
	-- 주문 별 음료 개수
	select 
		order_id,
		sum(count)
	from 
		order_details
	group by
		order_id
	) as "주문 별 음료 개수 집계"
;

-- 3. 음료 별 주문 개수 조회
select 
	name as "음료명",
	coalesce(total_count, 0) as "주문 개수"
from
	beverages
left join 
	(
	-- 음료 id별 주문 개수 조회
	select 
		beverage_id,
		sum(count) as "total_count"
	from
		order_details
	group by
		beverage_id
	) as b_counts on 
	b_counts.beverage_id = beverages.id
;

-- 4. 평균 가격보다 비싼 음료 조회
select 
	name as "음료명",
	price as "가격"
from 	
	beverages
where 
	price > (		
	-- 음료의 평균 가격 조회
		select
			avg(price)
		from beverages
	)
;


---------------------------------
-- select절의 subQuery는 단일값만 가능 (123값을 지워야 함)
SELECT
	name AS "음료명",
	price AS "가격",
	price - (
			-- SELECT 절 서브쿼리
			SELECT
				MAX(price), 123
			FROM
				beverages
			) AS "최대 가격과의 차이"
FROM
	beverages
;
 
-- 집계함수는 중복해서 사용할 수 없으므로 subQuery를 이용해 실행해야함
SELECT
	AVG(SUM(count))
FROM
	order_details
GROUP BY
	order_id
;

-- 해답
select
	round(avg(sum), 2)
from 
	(
		select
			order_id,
			sum(count)
		from 
			order_details
		group by
			order_id 
	) as "total_count"
;


-- from에 사용하는 subQuery는 별칭을 설정해야함
SELECT
	*
	FROM
		(
		-- FROM 절 서브쿼리
		SELECT
			order_id, -- 주문번호
			SUM(count) -- 주문 별 음료 개수
		FROM
			order_details
		GROUP BY
			order_id
		)
;
	