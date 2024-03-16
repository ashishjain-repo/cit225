DROP TABLE IF EXISTS first, second;

CREATE TABLE first
( first_id     int unsigned PRIMARY KEY AUTO_INCREMENT
, text         varchar(30));

CREATE TABLE second
( second_id    int unsigned PRIMARY KEY AUTO_INCREMENT
, first_id     int unsigned
, text         varchar(30));


INSERT INTO first
( text )
VALUES
('First Value');

SET @sv_first := last_insert_id();

SELECT @sv_first AS "Test Case";

INSERT INTO second
( first_id
, text )
VALUES
( @sv_first
,'Second Value');

INSERT INTO first
( text )
VALUES
('First Value')
RETURNING first_id INTO @sv_first;

SELECT *
FROM   first f INNER JOIN second s
ON     f.first_id = s.first_id;

INSERT INTO second
( first_id
, text )
VALUES
((SELECT first_id FROM first WHERE text = 'First Value')
,'Third Value');

SELECT *
FROM   first f INNER JOIN second s
ON     f.first_id = s.first_id;

DROP TABLE IF EXISTS apple, orange, apple_orange;

CREATE TABLE apple
( apple_id     int unsigned PRIMARY KEY AUTO_INCREMENT
, text         varchar(30));

CREATE TABLE orange
( orange_id    int unsigned PRIMARY KEY AUTO_INCREMENT
, text         varchar(30));

CREATE TABLE apple_orange
( apple_orange_id  int unsigned PRIMARY KEY AUTO_INCREMENT
, apple_id         int unsigned
, orange_id        int unsigned);

INSERT INTO apple
( text )
VALUES
('Gala'),('MacIntosh'),('Granny Smith');

INSERT INTO orange
( text )
VALUES
('Navel'),('Blood');

INSERT INTO apple_orange
( apple_id
, orange_id )
VALUES
((SELECT apple_id FROM apple WHERE text = 'Gala')
,(SELECT orange_id FROM orange WHERE text = 'Blood'));

SELECT *
FROM   apple a INNER JOIN apple_orange ao
ON     a.apple_id = ao.apple_id INNER JOIN orange o
ON     ao.orange_id = o.orange_id;