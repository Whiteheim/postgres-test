-- 결제 수단별 평균 결제금액이 36,000원 이상인 데이터 조회
select 
	ptype as "결제 수단",
	round(avg(amount), 2) as "평균 결제금액"
from 
	payments
group by
	ptype
having		-- 그룹 필터링 : 그룹화된 것들을 조건으로 선별 
	avg(amount) >= 36000
;

-- 상품 이름과 가격을 기준으로, 누적 판매정보(판매량, 매출)를 조회
SELECT -- 4
	products.name AS "상품명",
	products.price AS "가격",
	SUM(order_details.count) AS "누적 판매량",
	SUM(products.price * order_details.count) AS "누적 매출"
FROM -- 1
	products
LEFT JOIN order_details ON -- 2
	order_details.product_id = products.id
GROUP BY -- 3
	products.name,
	products.price
;

-- 누적 매출이 35,000원 이상인 상품 조회 
SELECT -- 4
	products.name AS "상품명",
	products.price AS "가격",
	SUM(order_details.count) AS "누적 판매량",
	SUM(products.price * order_details.count) AS "누적 매출"
FROM -- 1
	products
LEFT JOIN order_details ON -- 2
	order_details.product_id = products.id
GROUP BY -- 3
	products.name,
	products.price
having
	-- 누적 매출이 35,000원 이상인 데이터 
	SUM(products.price * order_details.count) >= 35000
;

-- 누적 매출이 2만원 이상이면서, 누적판매량도 10개 이상인 상품 조회 
SELECT -- 4
	products.name AS "상품명",
	products.price AS "가격",
	SUM(order_details.count) AS "누적 판매량",
	SUM(products.price * order_details.count) AS "누적 매출"
FROM -- 1
	products
LEFT JOIN order_details ON -- 2
	order_details.product_id = products.id
GROUP BY -- 3
	products.name,
	products.price
having 
	-- 누적 매출이 2만원 이상
	SUM(products.price * order_details.count) >= 20000
	 and 
	-- 누적 판매량 10개 이상
	SUM(order_details.count) >= 10
;

-- 누적 매출이 없는 제품을 가격 기준으로 오름차순 정렬
SELECT -- 4
	products.name AS "상품명",
	products.price AS "가격",
	SUM(order_details.count) AS "누적 판매량",
	SUM(products.price * order_details.count) AS "누적 매출"
FROM -- 1
	products
LEFT JOIN order_details ON -- 2
	order_details.product_id = products.id
GROUP BY -- 3
	products.name,
	products.price
having 
	SUM(products.price * order_details.count) is null
order by 
	products.price
;

-- 누적매출 상위 5개 상품 조회
SELECT -- 4
	products.name AS "상품명",
	products.price AS "가격",
	SUM(order_details.count) AS "누적 판매량",
	SUM(products.price * order_details.count) AS "누적 매출"
FROM -- 1
	products
LEFT JOIN order_details ON -- 2
	order_details.product_id = products.id
GROUP BY -- 3
	products.name,
	products.price
having 
	SUM(products.price * order_details.count) is not null
order by 
	-- SUM(products.price * order_details.count)
	"누적 매출" desc
limit 
	5
;

-- 누적 판매량 상위 5개 상품 조회
SELECT -- 4
	products.name AS "상품명",
	products.price AS "가격",
	SUM(order_details.count) AS "누적 판매량",
	SUM(products.price * order_details.count) AS "누적 매출"
FROM -- 1
	products
LEFT JOIN order_details ON -- 2
	order_details.product_id = products.id
GROUP BY -- 3
	products.name,
	products.price
having 
	SUM(products.price * order_details.count) is not null
order by 
	"누적 판매량" desc
limit 
	5
;

-- 가격 하위 5개 상품의 누적 매출 조회
SELECT -- 4
	products.name AS "상품명",
	products.price AS "가격",
	SUM(order_details.count) AS "누적 판매량",
	SUM(products.price * order_details.count) AS "누적 매출"
FROM -- 1
	products
LEFT JOIN order_details ON -- 2
	order_details.product_id = products.id
GROUP BY -- 3
	products.name,
	products.price
order by 
	"가격"
limit 
	5
;