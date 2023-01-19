

aggregate_function=# -- 거래 내역의 평균 값
aggregate_function=# Select avg(amount) from transactions;
         avg          
----------------------
 284.0229629629629630
(1 row)

aggregate_function=# -- 거래 내역의 평균 값
Select round(avg(amount),2) from transactions;
 round  
--------
 284.02
(1 row)

aggregate_function=# -- 거래 메세지 목록을 중복되지 않게 추출하기
aggregate_function=# select distinct(msg) from transactions;
      msg      
---------------
 Amazon
 Google
 G∞g≤
 Notion
 BankofAmerica
 Coupang
 PayPal
 Udemy
(8 rows)
---------------------------------------------------------
aggregate_function=# -- 거래내역의 총 합
aggregate_function=# select sum(amount) from transactions;
   sum   
---------
 7668.62
(1 row)

----------------------------------------------------------
aggregate_function=# -- 거래내역의 입금 총 합
select sum(amount) from transactions where amount >= 0;
   sum    
----------
 10489.63
(1 row)

-------------------------------------------------------
aggregate_function=# select sum(amount)from transactions
aggregate_function-# where created_at >= '2022-01-01';
   sum   
---------
 4709.73
(1 row)

aggregate_function=# -- 2022년 1월의 순수익 총 합
aggregate_function=# select sum(amount)from transactions
where created_at >= '2022-01-01';
   sum   
---------
 4709.73
(1 row)

aggregate_function=# -- 2022년 1월의 순수익 총 합
select sum(amount)from transactions
where created_at >= '2022-01-01' and created_at < '2022-02-01';
   sum   
---------
 3738.04
(1 row)
--------------------------------------------------------------------
aggregate_function=# -- 2021년 12월의 순수익
select sum(amount) from transactions
where created_at >= '2021-12-01' and created_at < '2022-01-01';
   sum   
---------
 1799.01
(1 row)

aggregate_function=# -- 2021년 12월의 순수익
select sum(amount) from transactions
where
aggregate_function-# extract(year from created_at) = 2021 and extract(month from created_at) = 12;
   sum   
---------
 1799.01
(1 row)
---------------------------------------------------------------------------
aggregate_function=# -- 2021년 11월의 순 수익
select sum(amount) from transactions
where extract(year from created_at) = 2021 and
extract(month from created_at) = 11;
   sum   
---------
 1159.88
(1 row)

aggregate_function=# -- 2021년 11월의 순 수익
select sum(amount) from transactions
where to_char(created_at, 'YYYY-MM') = '2021-11';
   sum   
---------
 1159.88
(1 row)
---------------------------------------------------------------------------
aggregate_function=# -- 2021년 11월과 2022년 1월의 순 수익
select sum(amount) from transactions
where to_char(created_at, 'YYYY-MM') = '2021-11' or 
to_char(created_at, 'YYYY-MM') = '2022-01';
   sum   
---------
 4897.92
(1 row)
                                     ^
aggregate_function=# -- 2021년 11월 부터 2022년 1월까지의 총 지출
select sum(amount) from transactions
where '2021-11' =< to_char(created_at, 'YYYY-MM') =< '2022-01';
ERROR:  operator does not exist: unknown =< text
LINE 2: where '2021-11' =< to_char(created_at, 'YYYY-MM') =< '2022-0...
                        ^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
aggregate_function=# -- 2021년 11월 부터 2022년 1월까지의 총 지출
select sum(amount) from transactions
where created_at >= '2021-11-01' and created_at < '2022-02-01';
   sum   
---------
 6696.93
(1 row)

aggregate_function=# -- 2021년 11월 부터 2022년 1월까지의 총 지출
select sum(amount) from transactions
where created_at >= '2021-11-01' and created_at < '2022-02-01'
aggregate_function-# and amount < 0;
   sum    
----------
 -2243.43
(1 row)

aggregate_function=# 
