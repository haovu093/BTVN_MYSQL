       -- Hãy tìm tất cả những nam giới tuổi dưới 45 --
SELECT p.name, p.age, p.gender FROM 
(SELECT name, gender, DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),birthdate)), '%Y')+0 AS age 
FROM sys.person where gender='male' ) 
AS p 
WHERE p.age <45

        -- Hãy tìm tất cả những nữ giới làm nghề lái xe --   
SELECT * FROM sys.person where gender='female' and job ='driver'

         -- Tính tỷ lệ nam/nữ lập trình viên trong tất cả tập dữ liệu--
SELECT t.job, m.malecount/t.femalecount FROM 
(SELECT job, COUNT(*) AS femalecount 
FROM person WHERE gender = 'female' and job='developer'
GROUP BY job) AS t 
JOIN 
(SELECT job, COUNT(*) AS malecount 
FROM person WHERE gender = 'Male' and job='developer'
GROUP BY job) AS m ON t.job = m.job

         -- Hãy tìm 5 thành phố có số lượng nữ lớn nhất --
select city, count(*)  from sys.person where gender ='female' 
Group by city
Order by count(*) DESC
Limit 5;

