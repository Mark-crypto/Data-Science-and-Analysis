SELECT tweet_bucket, COUNT(user_id) as user_num
FROM (
SELECT COUNT(tweet_id) AS tweet_bucket, user_id 
FROM tweets 
WHERE EXTRACT(YEAR FROM tweet_date) = 2022
GROUP BY user_id
) AS tweet_buckets
GROUP BY tweet_bucket
ORDER BY tweet_bucket;

SELECT candidate_id 
FROM candidates 
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3;