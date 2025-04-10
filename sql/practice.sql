--  Question One
SELECT tweet_bucket, COUNT(user_id) as user_num
FROM (
SELECT COUNT(tweet_id) AS tweet_bucket, user_id 
FROM tweets 
WHERE EXTRACT(YEAR FROM tweet_date) = 2022
GROUP BY user_id
) AS tweet_buckets
GROUP BY tweet_bucket
ORDER BY tweet_bucket;

-- Question Two
SELECT candidate_id 
FROM candidates 
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3;

-- Question Three
SELECT p.page_id FROM pages p 
FULL JOIN page_likes pl ON p.page_id = pl.page_id
WHERE pl.user_id IS NULL
ORDER BY p.page_id;

-- Question Four
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;

--Question Five
SELECT 
(SELECT COUNT(*) FROM viewership WHERE device_type = 'laptop')
AS laptop_views,
(SELECT COUNT(*) FROM viewership WHERE device_type IN ('tablet', 'phone'))
AS mobile_views
FROM viewership
GROUP BY laptop_views, mobile_views;

--Question Six
SELECT user_id, 
(extract (day from (max(post_date) - min(post_date)))) 
AS days_between 
from posts
group by user_id
order by days_between desc;

-- Question Seven
SELECT sender_id, COUNT(sender_id) as message_count
FROM messages
WHERE (EXTRACT(MONTH FROM sent_date)) = 8 
AND (EXTRACT(YEAR FROM sent_date)) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;

--Question 8
WITH company_number AS (
select COUNT(company_id) AS company, 
title, 
company_id
from job_listings
GROUP BY title, company_id
HAVING COUNT(company_id) > 1
)
SELECT COUNT (company) AS duplicate_companies FROM company_number
