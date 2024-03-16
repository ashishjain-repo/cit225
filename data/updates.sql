DROP TABLE IF EXISTS application_user, first, second;

CREATE TABLE application_user
( application_user_id    int unsigned PRIMARY KEY AUTO_INCREMENT
, application_user_name  varchar(20) NOT NULL);

INSERT INTO application_user
( application_user_name )
VALUES
('Moe'),('Curly'),('Larry'),('Shemp');

CREATE TABLE first
( first_id     int unsigned PRIMARY KEY AUTO_INCREMENT
, text         varchar(30)
, updated_by   int unsigned NOT NULL
, update_date  datetime     NOT NULL);

CREATE TABLE second
( second_id    int unsigned PRIMARY KEY AUTO_INCREMENT
, first_id     int unsigned NOT NULL
, text         varchar(30)  NOT NULL
, updated_by   int unsigned NOT NULL
, update_date  datetime     NOT NULL);

INSERT INTO first
( text
, updated_by
, update_date)
VALUES
 ('First Value'
 ,(SELECT application_user_id
   FROM application_user
   WHERE application_user_name = 'Moe')
 ,'2023-02-28')
,('Second Value'
 ,(SELECT application_user_id
   FROM application_user
   WHERE application_user_name = 'Curly')
 ,'2023-02-28')
,('Third Value'
 ,(SELECT application_user_id
   FROM application_user
   WHERE application_user_name = 'Larry')
 ,'2023-02-28');

INSERT INTO second
( first_id
, text
, updated_by
, update_date)
VALUES
((SELECT first_id FROM first WHERE text = 'First Value')
,'First Value'
 ,(SELECT application_user_id
   FROM application_user
   WHERE application_user_name = 'Moe')
,'2023-02-28');

INSERT INTO second
( first_id
, text
, updated_by
, update_date)
VALUES
((SELECT first_id FROM first WHERE text = 'Second Value')
,'Second Value'
 ,(SELECT application_user_id
   FROM application_user
   WHERE application_user_name = 'Curly')
,'2023-02-28');

INSERT INTO second
( first_id
, text
, updated_by
, update_date)
VALUES
((SELECT first_id FROM first WHERE text = 'Third Value')
,'Third Value'
 ,(SELECT application_user_id
   FROM application_user
   WHERE application_user_name = 'Larry')
,'2023-02-28');

SELECT f.first_id
,      f.text AS f_text
,      f.updated_by
,      s.second_id
,      s.text AS s_id
,      s.updated_by
FROM   first f INNER JOIN second s
ON     f.first_id = s.first_id;

SELECT f.first_id
,      f.text AS f_text
,      a1.application_user_name AS "User Name"
,      s.second_id
,      s.text AS s_id
,      a2.application_user_name AS "User Name"
FROM   first f INNER JOIN second s
ON     f.first_id = s.first_id INNER JOIN application_user a1
ON     f.updated_by = a1.application_user_id INNER JOIN application_user a2
ON     s.updated_by = a2.application_user_id;

UPDATE second
SET    updated_by = 
(
    SELECT application_user_id
    FROM   application_user
    WHERE  application_user_name = 'Shemp'
)
,      update_date = NOW()
WHERE  updated_by = 
(
    SELECT application_user_id
    FROM   application_user
    WHERE  application_user_name = 'Curly'
);

SELECT f.first_id
,      f.text AS f_text
,      a1.application_user_name AS "User Name"
,      s.second_id
,      s.text AS s_id
,      a2.application_user_name AS "User Name"
FROM   first f INNER JOIN second s
ON     f.first_id = s.first_id INNER JOIN application_user a1
ON     f.updated_by = a1.application_user_id INNER JOIN application_user a2
ON     s.updated_by = a2.application_user_id;