const {Pool} = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const input = process.argv.slice(2);
const [cohort, limit] = [input[0], input[1]];
pool.query(`
SELECT students.name AS student, students.id, cohorts.name AS cohort_name FROM 
students JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${cohort}%'
limit ${limit}
`).then(res=>{
  res.rows.forEach(user => {
    console.log(`${user.student} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  });
}).catch((err => console.log(err.stack)));