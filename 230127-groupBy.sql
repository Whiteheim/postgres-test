-- 결제 테이블을 결제 방법에 따라 분류하고, 각각의 결제횟수 조회
select 
	ptype as "결제 방법",
	count(ptype) as "결제 횟수"
from 
	payments
group by
	ptype 
;

-- 상품 테이블을 보관타입에 따라 분류, 각각 상품 개수와 평균가 조회
select 
	ptype as "상품보관 타입",
	count(ptype) as "상품 개수",
	round(avg(price), 2) as "평균 가격"
from 
	products
group by
	ptype 
;

-- 사용자와 주문 테이블을 조인하고, 사용자 닉네임별 배송 완료 주문수를 조회
select
	users.nickname as "사용자 닉네임",
	count(*) as "배송 완료 주문수"
from 
	orders
join users on
	orders.user_id = users.id
	 and
	orders.status = 'DELIVERED'
group by users.nickname
;

-- 상품별 총 주문횟수 조회
select 
	products.name as "상품명",
	count(*) as "총 주문 횟수" 
from
	orders
join order_details on
	orders.id = order_details.order_id 
join products ON 
	products.id = order_details.product_id 
group by 
	products.name
;

-- 사용자 닉네임별 배송완료 주문수와 총 결제금액 조회
select
	users.nickname as "사용자 닉네임",
	count(*) as "배송완료 주문수",
	sum(products.price * order_details.count) as "총 결제금액"
from 
	orders
join users on
	users.id = orders.user_id 
	 and 
	orders.status = 'DELIVERED'
join order_details on
	order_details.order_id = orders.id 
join products on
	order_details.product_id = products.id 
group by 
	users.nickname 
;