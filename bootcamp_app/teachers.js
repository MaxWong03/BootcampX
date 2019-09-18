const {Pool} = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT DISTINCT teachers.name AS teachers, cohorts.name AS cohort FROM cohorts
INNER JOIN students ON cohorts.id = students.cohort_id
INNER JOIN assistance_requests req ON students.id = req.student_id
INNER JOIN teachers ON teachers.id = req.teacher_id
WHERE cohorts.name LIKE '${process.argv[2] || '%MAR%'}'
ORDER BY teachers.name;
`).then(res=> console.log(res.rows)).catch((err => console.log(err.stack)));