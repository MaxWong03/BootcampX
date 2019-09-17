SELECT DISTINCT teachers.name, cohorts.name FROM cohorts
INNER JOIN students ON cohorts.id = students.cohort_id
INNER JOIN assistance_requests req ON students.id = req.student_id
INNER JOIN teachers ON teachers.id = req.teacher_id
WHERE cohorts.name = 'JUL02'
ORDER BY teachers.name;