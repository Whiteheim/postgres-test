-- 메인쿼리 (판매량 상위 3개의 음료 정보)
select
	id 	as "ID",
	name as "음료명"
from 
	beverages
where 
	id in (
		-- 음료 아이디별 판매량
		select 
			beverage_id
		from
			order_details
		group by
			beverage_id	
		order by 
			sum(count) desc 
		limit 
			3
	)
;

-- 아메리카노와 라뗴보다 싼 음료
select 
	name as "음료명",
	price as "가격"
from
	beverages
where 
	price < all(
				-- 아메리카노와 라떼의 값
				select 
					price
				from 	
					beverages
				where 
					name in ('아메리카노', '라떼')
				)
;
	
-- non-coffee 메뉴 중, 적어도 한 커피보다 가격이 비싼 음료 조회 
select 
	name as "음료명",
	price as "가격"
from 
	beverages
where
	btype != 'COFFEE'
	 and 
	price > any(
			-- 모든 커피의 가격
			select 
				price 
			from 
				beverages
			where
				btype = 'COFFEE'
	)
;

--------------------------------------------------------------
-- 메인 쿼리(판매량 상위 3개의 음료 정보)
SELECT
	id AS "ID",
	name AS "음료명"
FROM
	beverages
WHERE
	id IN (
		-- 음료 id 별, 판매량
		SELECT
			beverage_id,
			SUM(count)
		FROM
			order_details
		GROUP BY
			beverage_id
		ORDER BY -- 내림차순 정렬(판매량 기준)
			SUM(count) DESC
		LIMIT -- 개수 제한(상위 3개만)
			3
		)
;

-- in을 이용해 필터링 하기 위해서는 단일 컬럼이 필요해서 작동에 오류가 남
-- 해결책 : select 절에서 beverage_id 값만 조회하여 사용

-- 메인 쿼리(적어도 한 커피 보다 비싼 음료)
SELECT
	name AS "음료명",
	price AS "가격"
FROM
	beverages
WHERE
	btype != 'COFFEE'
	 AND
	price > (
			-- 모든 커피의 가격
			SELECT
				price
			FROM
				beverages
			WHERE
				btype = 'COFFEE'
			)
;

-- 비교연산자에 SubQuery를 사용하기 위해서는 in / all / any중 한가지를 사용해야 함