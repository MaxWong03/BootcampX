SELECT COUNT(assist_req.*) AS total_assistances, name FROM 
teachers INNER JOIN assistance_requests AS assist_req
ON teachers.id = assist_req.teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;