SELECT c.name, Avg(completed_at - started_at) AS average_assistance_time  FROM
assistance_requests AS req 
INNER JOIN students AS s
ON req.student_id = s.id
INNER JOIN cohorts AS c
ON s.cohort_id = c.id
WHERE cohort_id IS NOT NULL
GROUP BY c.name
ORDER BY average_assistance_time;

