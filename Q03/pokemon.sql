-- FROM 없이도 값을 가져 올 수 있다
SELECT 5*5;
-- AS로 칼람명을 변경 가능하다
SELECT '피카츄' AS '포켓몬';

-- 만약 pokemon 데이터 베이스가  존대하면 삭제
DROP DATABASE IF EXISTS pokemon;
-- CREATE DATABASE : 데이터 베이스 생성
CREATE DATABASE pokemon;
-- 기본 DB 성정
USE pokemon;
-- CREATE TABLE: 테이블 생서애주는 뭐리
CREATE TABLE mypokemon;(
number int,
name varchar(20),
type varchar(20),
height float,
weight float,
attack float,
defense float,
speed float
);

INSERT INTO mypokemon( number,name , type,height,weight,attack,defense,speed)
VALUES(10,'caterpie','bug',0.3,2.9,30,35,45),
	(25,'pikachu', 'electric', 0.4, 6, 55, 40, 90), 
	(26, 'raichu', 'electric', 0.8, 30, 90, 55, 110), 
	(133, 'eevee', 'normal', 0.3, 6.5, 55, 50, 55), 
	(152, 'chikoirita','grass', 0.9, 6.4, 49, 65, 45);
SELECT * FROM mypokemon;

SELECT name FROM mypokemon;
SELECT name, height, weight FROM mypokemon;

-- DISTINCT : 중복 제거
SELECT DISTINCT height FROM mypokemon;

-- 포켓몬들의 공격력을 2배 해서 'attack2'라는 별명으로 이름과 같이 뽑고싶다
 


