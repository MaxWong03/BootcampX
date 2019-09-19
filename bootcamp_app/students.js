const {Pool} = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const limit = process.argv[3];
const values = [`%${cohortName}%`, limit];
const queryString = `
SELECT students.name AS student, students.id, cohorts.name AS cohort_name FROM 
students JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
limit $2
`;

pool.query(queryString, values).then(res=>{
  res.rows.forEach(user => {
    console.log(`${user.student} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  });
}).catch((err => console.log(err.stack)));