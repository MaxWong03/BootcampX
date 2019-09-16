SELECT day, COUNT(*) AS total_assignment
FROM assignments
GROUP BY day
ORDER BY day;