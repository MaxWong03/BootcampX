SELECT AVG(duration) AS average_total_duration FROM (SELECT cohorts.name, SUM(completed_at - started_at) AS duration FROM cohorts
INNER JOIN students ON cohorts.id = students.cohort_id
INNER JOIN assistance_requests as req ON req.student_id = students.id
GROUP BY cohorts.name) AS total_duration;