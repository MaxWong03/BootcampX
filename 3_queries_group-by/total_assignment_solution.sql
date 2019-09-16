SELECT cohorts.name AS cohort, COUNT(assignment_submissions.*) AS total_submissions
FROM students 
INNER JOIN cohorts 
ON cohorts.id = students.cohort_id
INNER JOIN assignment_submissions
ON student_id = students.id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;