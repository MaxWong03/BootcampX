SELECT req.assignment_id, name, day, chapter, COUNT(req.*) AS total_requests FROM assistance_requests as req
INNER JOIN assignments
ON assignments.id = req.assignment_id
GROUP BY req.assignment_id, name, day, chapter
ORDER BY total_requests DESC;