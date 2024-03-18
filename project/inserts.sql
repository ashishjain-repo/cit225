INSERT INTO continent
(
    continent_name
,   continent_code
)
VALUES
('Asia','AS')
,('Europe','EU')
,('Africa','AF');

INSERT INTO country
(
    continent_id
,   country_name
,   country_code
)
VALUES
((SELECT continent_id FROM continent WHERE continent_code = 'AS'),'India','IN'),
((SELECT continent_id FROM continent WHERE continent_code = 'EU'),'England','EN'),
((SELECT continent_id FROM continent WHERE continent_code = 'AF'),'South Africa','SA');
