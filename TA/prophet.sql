-- Remove table before creating it again.
DROP TABLE IF EXISTS prophet;

-- Create table.
CREATE TABLE prophet
( prophet_id    int unsigned primary key auto_increment
, first_name    varchar(12)  not null
, middle_name   varchar(12)
, last_name     varchar(12)  not null )
AUTO_INCREMENT=1001;

-- Insert data into table.
INSERT INTO prophet
( last_name
, first_name )
VALUES
('Smith'
,'Joseph');

INSERT INTO prophet
( last_name
, first_name
, middle_name )
VALUES
('Smith'
,'Joseph'
,'F');

INSERT INTO prophet
( last_name
, first_name
, middle_name )
VALUES
('Smith'
,'Joseph'
,'Fielding');

-- Lets verify the data.
SELECT prophet_id
,      last_name
,      first_name
,      IFNULL(middle_name,'') AS middle_name
 FROM prophet;
 
 -- Lets verify the data.
SELECT prophet_id
,      last_name
,      first_name
,      IFNULL(middle_name,'') AS middle_name
 FROM prophet
 WHERE middle_name IS NOT NULL;