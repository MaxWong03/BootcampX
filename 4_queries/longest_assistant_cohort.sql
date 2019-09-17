SELECT name, average_assistance_time
FROM (SELECT cohorts.name AS name, AVG(completed_at - started_at) AS average_assistance_time
  FROM
    students INNER JOIN cohorts
    ON cohorts.id = students.cohort_id
    INNER JOIN assistance_requests AS req
    ON students.id = req.student_id
  GROUP BY cohorts.name
  ORDER BY average_assistance_time DESC
  limit 1
  ) AS total_average;
