system cls;

/* CREATE TABLE string_tbl
(
    char_fld CHAR(30),
    vchar_fld VARCHAR(30),
    text_fld TEXT
);

INSERT INTO string_tbl (char_fld, vchar_fld, text_fld)
VALUES
(
    'This is char data',
    'This is varchar data',
    'This is text data'
); */

/* UPDATE string_tbl
SET vchar_fld = 'This is a piece of extremely long varchar data'; */

/* UPDATE string_tbl
-- SET text_fld = 'This string doesn't work';
-- SET text_fld = 'This string didn''t work but it does now';
SET text_fld = 'This string didn\'t work, but it does now'; */

/* INSERT INTO string_tbl (char_fld, vchar_fld, text_fld)
VALUES
(
    'This string is 28 characters',
    'This string is 28 characters',
    'This string is 28 characters'
); */

/* SELECT LENGTH(char_fld) chat_length,
LENGTH(vchar_fld) vchar_length,
LENGTH(text_fld) text_length
FROM string_tbl; */

/* SELECT POSITION('characters' IN vchar_fld)
FROM string_tbl; */

/* SELECT LOCATE ('is', vchar_fld, 5)
FROM string_tbl; */

/* INSERT INTO string_tbl(vchar_fld)
VALUES
('abcd'),
('xyz'),
('QRSTUV'),
('qrstuv'),
('12345'); */

/* SELECT vchar_fld
FROM string_tbl
ORDER BY vchar_fld; */

/* SELECT STRCMP('12345','12345') 12345_12345,
STRCMP('abcd','xyz') abcd_xyz,
STRCMP('abcd','QRSTUV') abcd_QRSTUV,
STRCMP('qrstuv','QRSTUV') qrstuv_QRSTUV,
STRCMP('12345','xyz') 12345_xyz,
STRCMP('xyz','qrstuv') xyz_qrstuv; */

/* SELECT name, name LIKE '%y' ends_in_y
FROM category; */

/* SELECT name, name REGEXP 'y$' ends_in_y
FROM category; */

/* INSERT INTO string_tbl (text_fld)
VALUES ('This string was 29 characters'); */

/* UPDATE string_tbl
SET text_fld = CONCAT(text_fld, ', but now it is longer'); */
-- SELECT text_fld AS 'TEXT' FROM string_tbl;

/* use sakila;
SELECT concat(first_name,' ',last_name,'has been a customer since', date(create_date)) cust_narrative
FROM customer;
 */

--  SELECT INSERT ('goodbye world', 9, 0, 'cruel ') string;

--  SELECT INSERT ('goodbye world',1,7,'hello') string;

-- SELECT SUBSTRING('goodbye cruel world',9,5);

/* SELECT (37*59) / (78-(8*6));
SELECT (24-19); */

/* SELECT MOD(10,4);
SELECT MOD(22.75,5); */

/* SELECT POW(2,3);
SELECT POW(2,8); */

-- SELECT POW(2,10) Kilobyte, POW(2,20) Megabyte, POW(2,30) Gigabyte, POW(2,40) Terabyte;

/* SELECT CEIL(72.445), FLOOR(72.445);
SELECT ROUND(72.49999), ROUND(72.5), ROUND(72.50001);
SELECT ROUND(72.0909, 1), ROUND(72.0909, 2), ROUND(72.0909, 3);

SELECT TRUNCATE(72.0909, 1), TRUNCATE(72.0909, 2),TRUNCATE(72.0909, 3) */

/* SELECT @@global.time_zone, @@session.time_zone;

SELECT CURRENT_DATE(), CURRENT_TIME(), CURRENT_TIMESTAMP();

SELECT DATE_ADD(CURRENT_DATE(), INTERVAL 5 DAY);

SELECT DAYNAME('2019-09-18');

SELECT EXTRACT(YEAR FROM '2019-09-18 22:19:05');

SELECT DATEDIFF('2019-09-03', '2019-06-21'); */


/* SELECT CAST('1456328' AS SIGNED INTEGER);
SELECT CAST('999ABC111' AS UNSIGNED INTEGER); */

-- Exercises:-

-- 1.
-- SELECT SUBSTRING('Please find the substring in this string',17,9) string;
-- 2.
-- SELECT ABS(-25.76823), SIGN(-25.76823), ROUND(-25.76823,2);
-- 3.
-- SELECT EXTRACT(MONTH FROM CURRENT_DATE());
-- 4.
-- SET @string = 'Sorcerer''s Stone';
-- 5.
-- SELECT DATE_FORMAT(STR_TO_DATE(@string, '%d-%b-%Y'),'%Y-%m-%d') AS formatted;