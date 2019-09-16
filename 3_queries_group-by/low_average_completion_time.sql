SELECT students.name AS student, AVG(sub.duration) AS average_assignment_duration, AVG(assignments.duration) AS average_estimated_duration
FROM assignment_submissions AS sub
INNER JOIN students
ON sub.student_id = students.id
INNER JOIN assignments
ON sub.assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY student
HAVING AVG(sub.duration) < AVG(assignments.duration)
ORDER BY average_assignment_duration;


