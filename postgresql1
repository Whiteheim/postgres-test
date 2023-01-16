ostgres=# \du
postgres=# create role postgres;
CREATE ROLE
postgres=# \du
postgres=# \password postgres
Enter new password for user "postgres": 
Enter it again: 
postgres=# \du
postgres=# alter role postgres createdb
postgres-# \du
postgres-# alter role postgres createdb;
ERROR:  syntax error at or near "alter"
LINE 2: alter role postgres createdb;
        ^
postgres=# Alter role postgres createdb;
ALTER ROLE
postgres=# \du
postgres=# Alter role postgres nocannotlogin;
ERROR:  unrecognized role option "nocannotlogin"
LINE 1: Alter role postgres nocannotlogin;
                            ^
postgres=# Alter role postgres Nocannotlogin;
ERROR:  unrecognized role option "nocannotlogin"
LINE 1: Alter role postgres Nocannotlogin;
                            ^
postgres=# \du
postgres=# postgres -U postgres
postgres-# create database testdb;
ERROR:  syntax error at or near "postgres"
LINE 1: postgres -U postgres
        ^
postgres=# postgres -U postgres;
ERROR:  syntax error at or near "postgres"
LINE 1: postgres -U postgres;
        ^
postgres=# ostgres -U postgres;
ERROR:  syntax error at or near "ostgres"
LINE 1: ostgres -U postgres;
        ^
postgres=# Postgres -U postgres;
ERROR:  syntax error at or near "Postgres"
LINE 1: Postgres -U postgres;
        ^
postgres=# drop role postgres
postgres-# 
postgres-# q
postgres-# ;
ERROR:  syntax error at or near "q"
LINE 2: q
        ^
postgres=# drop role postgres;
DROP ROLE
postgres=# \du
postgres=# create role postdb with login password 'postgres'
postgres-# ;
CREATE ROLE
postgres=# /du
postgres-# ;
ERROR:  syntax error at or near "/"
LINE 1: /du
        ^
postgres=# \du
postgres=# createuser testdb
postgres-# ;
ERROR:  syntax error at or near "createuser"
LINE 1: createuser testdb
        ^
postgres=# Createuser testdb
;
ERROR:  syntax error at or near "Createuser"
LINE 1: Createuser testdb
        ^
postgres=# Createuser testdb;
ERROR:  syntax error at or near "Createuser"
LINE 1: Createuser testdb;
        ^
postgres=# \du
postgres=# alter role postgres createdb;
ERROR:  role "postgres" does not exist
postgres=# \du
postgres=# drop role postdb
postgres-# ;
DROP ROLE
postgres=# create role postgres with login password 'postgres'
;
CREATE ROLE
postgres=# alter role postgres createdb;
ALTER ROLE
postgres=# createuser testdb;
ERROR:  syntax error at or near "createuser"
LINE 1: createuser testdb;
        ^
postgres=# Createuser testdb;
ERROR:  syntax error at or near "Createuser"
LINE 1: Createuser testdb;
        ^
postgres=# \list
postgres=# create database testdb;
CREATE DATABASE
postgres=# \list
                                   List of databases
   Name    |    Owner     | Encoding | Collate | Ctype |       Access privileges       
-----------+--------------+----------+---------+-------+-------------------------------
 postgres  | kangseonghun | UTF8     | C       | C     | 
 template0 | kangseonghun | UTF8     | C       | C     | =c/kangseonghun              +
           |              |          |         |       | kangseonghun=CTc/kangseonghun
 template1 | kangseonghun | UTF8     | C       | C     | =c/kangseonghun              +
           |              |          |         |       | kangseonghun=CTc/kangseonghun
 testdb    | kangseonghun | UTF8     | C       | C     | 
(4 rows)

postgres=# drop database testdb;
DROP DATABASE
postgres=# create database mcdonalds;
CREATE DATABASE
postgres=# \list
                                   List of databases
   Name    |    Owner     | Encoding | Collate | Ctype |       Access privileges       
-----------+--------------+----------+---------+-------+-------------------------------
 mcdonalds | kangseonghun | UTF8     | C       | C     | 
 postgres  | kangseonghun | UTF8     | C       | C     | 
 template0 | kangseonghun | UTF8     | C       | C     | =c/kangseonghun              +
           |              |          |         |       | kangseonghun=CTc/kangseonghun
 template1 | kangseonghun | UTF8     | C       | C     | =c/kangseonghun              +
           |              |          |         |       | kangseonghun=CTc/kangseonghun
(4 rows)

postgres=# \connect testdb
connection to server on socket "/tmp/.s.PGSQL.5432" failed: FATAL:  database "testdb" does not exist
Previous connection kept
postgres=# \connect mcdonalds
You are now connected to database "mcdonalds" as user "kangseonghun".
mcdonalds=# \dy
              List of event triggers
 Name | Event | Owner | Enabled | Function | Tags 
------+-------+-------+---------+----------+------
(0 rows)

mcdonalds=# \dt
Did not find any relations.
mcdonalds=# q
mcdonalds-# ;
ERROR:  syntax error at or near "q"
LINE 1: q
        ^
mcdonalds=# quit
> psql postgres
psql (14.6 (Homebrew))
Type "help" for help.

postgres=# \du
                                     List of roles
  Role name   |                         Attributes                         | Member of 
--------------+------------------------------------------------------------+-----------
 kangseonghun | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 postgres     | Create DB                                                  | {}

postgres=# \list
                                   List of databases
   Name    |    Owner     | Encoding | Collate | Ctype |       Access privileges       
-----------+--------------+----------+---------+-------+-------------------------------
 mcdonalds | kangseonghun | UTF8     | C       | C     | 
 postgres  | kangseonghun | UTF8     | C       | C     | 
 template0 | kangseonghun | UTF8     | C       | C     | =c/kangseonghun              +
           |              |          |         |       | kangseonghun=CTc/kangseonghun
 template1 | kangseonghun | UTF8     | C       | C     | =c/kangseonghun              +
           |              |          |         |       | kangseonghun=CTc/kangseonghun
(4 rows)

postgres=# \q
> psql postgres
psql (14.6 (Homebrew))
Type "help" for help.

postgres=# \connect mcdonalds
You are now connected to database "mcdonalds" as user "kangseonghun".
mcdonalds=# create table burgers ();
CREATE TABLE
mcdonalds=# \list
                                   List of databases
   Name    |    Owner     | Encoding | Collate | Ctype |       Access privileges       
-----------+--------------+----------+---------+-------+-------------------------------
 mcdonalds | kangseonghun | UTF8     | C       | C     | 
 postgres  | kangseonghun | UTF8     | C       | C     | 
 template0 | kangseonghun | UTF8     | C       | C     | =c/kangseonghun              +
           |              |          |         |       | kangseonghun=CTc/kangseonghun
 template1 | kangseonghun | UTF8     | C       | C     | =c/kangseonghun              +
           |              |          |         |       | kangseonghun=CTc/kangseonghun
(4 rows)

mcdonalds=# \dt
            List of relations
 Schema |  Name   | Type  |    Owner     
--------+---------+-------+--------------
 public | burgers | table | kangseonghun
(1 row)

mcdonalds=# alter id int
mcdonalds-# ;
ERROR:  syntax error at or near "id"
LINE 1: alter id int
              ^
mcdonalds=# drop table burgers();
ERROR:  syntax error at or near "("
LINE 1: drop table burgers();
                          ^
mcdonalds=# drop table burgers;
DROP TABLE
mcdonalds=# create table burgers(
mcdonalds(# id INT, name VARCHAR(50), 
mcdonalds(# price INT, gram INT,
mcdonalds(# kcal INT, protein INT);
CREATE TABLE
mcdonalds=# \dt
            List of relations
 Schema |  Name   | Type  |    Owner     
--------+---------+-------+--------------
 public | burgers | table | kangseonghun
(1 row)

mcdonalds=# \dt burgers
            List of relations
 Schema |  Name   | Type  |    Owner     
--------+---------+-------+--------------
 public | burgers | table | kangseonghun
(1 row)

mcdonalds=# selec * from burgers;
ERROR:  syntax error at or near "selec"
LINE 1: selec * from burgers;
        ^
mcdonalds=# select * from burgers;
 id | name | price | gram | kcal | protein 
----+------+-------+------+------+---------
(0 rows)

mcdonalds=# insert into burgers(id, name, price, gram, kcal, protein
mcdonalds(# ) valuse (
mcdonalds(# 1, '행운버거 골드 스페셜' , 6000, 227, 699, 26);
ERROR:  syntax error at or near "valuse"
LINE 2: ) valuse (
          ^
mcdonalds=# insert into burgers(id, name, price, gram, kcal, protein
) values (
1, '행운버거 골드 스페셜' , 6000, 227, 699, 26);
INSERT 0 1
mcdonalds=# select * from burgers;
 id |         name         | price | gram | kcal | protein 
----+----------------------+-------+------+------+---------
  1 | 행운버거 골드 스페셜 |  6000 |  227 |  699 |      26
(1 row)

mcdonalds=# insert into burgers(id, name, price, gram, kcal, protein)
mcdonalds-# VAlues (2, '행운버거 골드', 5300, 222, 540, 25),
mcdonalds-# (3, '트리플 치즈버거', 6300, 219, 619, 36),
mcdonalds-# (4, '빅맥' 5300, 223, 583, 27);
ERROR:  syntax error at or near "5300"
LINE 4: (4, '빅맥' 5300, 223, 583, 27);
                   ^
mcdonalds=# insert into burgers(id, name, price, gram, kcal, protein)
VAlues (2, '행운버거 골드', 5300, 222, 540, 25),
(3, '트리플 치즈버거', 6300, 219, 619, 36),
(4, '빅맥', 5300, 223, 583, 27);
INSERT 0 3
mcdonalds=# select * from burgers;
 id |         name         | price | gram | kcal | protein 
----+----------------------+-------+------+------+---------
  1 | 행운버거 골드 스페셜 |  6000 |  227 |  699 |      26
  2 | 행운버거 골드        |  5300 |  222 |  540 |      25
  3 | 트리플 치즈버거      |  6300 |  219 |  619 |      36
  4 | 빅맥                 |  5300 |  223 |  583 |      27
(4 rows)

mcdonalds=# update
mcdonalds-# burgers
mcdonalds-# set 
mcdonalds-# price = 1000;
UPDATE 4
mcdonalds=# select * from burgers;
 id |         name         | price | gram | kcal | protein 
----+----------------------+-------+------+------+---------
  1 | 행운버거 골드 스페셜 |  1000 |  227 |  699 |      26
  2 | 행운버거 골드        |  1000 |  222 |  540 |      25
  3 | 트리플 치즈버거      |  1000 |  219 |  619 |      36
  4 | 빅맥                 |  1000 |  223 |  583 |      27
(4 rows)

mcdonalds=# update                
burgers
set 
price = 1000
mcdonalds-# ;
UPDATE 4
mcdonalds=# update
burgers
set 
price = 500
mcdonalds-# where id = 4;
UPDATE 1
mcdonalds=# select * from burgers;
 id |         name         | price | gram | kcal | protein 
----+----------------------+-------+------+------+---------
  1 | 행운버거 골드 스페셜 |  1000 |  227 |  699 |      26
  2 | 행운버거 골드        |  1000 |  222 |  540 |      25
  3 | 트리플 치즈버거      |  1000 |  219 |  619 |      36
  4 | 빅맥                 |   500 |  223 |  583 |      27
(4 rows)

mcdonalds=# delete from burgers
mcdonalds-# where id = 4;
DELETE 1
mcdonalds=# select * from burgers;
 id |         name         | price | gram | kcal | protein 
----+----------------------+-------+------+------+---------
  1 | 행운버거 골드 스페셜 |  1000 |  227 |  699 |      26
  2 | 행운버거 골드        |  1000 |  222 |  540 |      25
  3 | 트리플 치즈버거      |  1000 |  219 |  619 |      36
(3 rows)
