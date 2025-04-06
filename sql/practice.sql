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