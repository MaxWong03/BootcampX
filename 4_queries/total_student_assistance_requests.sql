SELECT COUNT(assist_req.*) AS total_assistances, name FROM
students INNER JOIN assistance_requests AS assist_req
ON students.id = assist_req.student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;