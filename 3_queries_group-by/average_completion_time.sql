SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignmnet_duration
FROM students 
INNER JOIN assignment_submissions
ON student_id = students.id
WHERE students.end_date IS NULL
GROUP BY student
ORDER BY average_assignmnet_duration DESC;