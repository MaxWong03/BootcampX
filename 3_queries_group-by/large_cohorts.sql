SELECT cohorts.name AS cohorts_name, COUNT(students.*) AS student_count
FROM cohorts 
INNER JOIN students
ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING COUNT(students.*) >= 18
ORDER BY student_count;

