-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries 
ON employees.emp_no = salaries.emp_no;


-- 2. List employees who were hired in 1986.
-- https://www.postgresql.org/docs/9.1/functions-datetime.html
SELECT EXTRACT (YEAR FROM hire_date), employees.emp_no, employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date > '12/31/1985' and hire_date < '01/01/1987';


-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.
-- using department, employees, and dept_manager table.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, 
employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;


-- 4. List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name , employees.last_name
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name), last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

--9. ** BONUS 
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name, employees.hire_date
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE employees.emp_no = 499942;