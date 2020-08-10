/*List the following details of each employee: employee number, last name, first name, sex, and salary.*/

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
INNER JOIN Salaries On Employees.emp_no = Salaries.emp_no;

/*List first name, last name, and hire date for employees who were hired in 1986.*/
SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';

/*List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name.*/
SELECT Department_Managers.dept_no, Departments.dept_name, Department_Managers.emp_no,
Employees.last_name, Employees.first_name
FROM ((Department_Managers
INNER JOIN Departments ON Department_Managers.dept_no = Departments.dept_no)
INNER JOIN Employees ON Department_Managers.emp_no = Employees.emp_no
);

/*List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM ((Employees
INNER JOIN Department_Employees ON Employees.emp_no = Department_Employees.emp_no)
INNER JOIN Departments ON Department_Employees.dept_no = Departments.dept_no
);

/*List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."*/
SELECT Employees.first_name, Employees.last_name, Employees.sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE "B%";

/*List all employees in the Sales department, including their employee number, last name, first name, and department name.*/
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Department_Employees ON Employees.emp_no = Department_Employees.emp_no
INNER JOIN Departments ON Department_Employees.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales';

/*List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Department_Employees ON Employees.emp_no = Department_Employees.emp_no
INNER JOIN Departments ON Department_Employees.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales' OR Departments.dept_name = 'Development';

/*In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/
SELECT last_name, COUNT(*) AS frequency_count
FROM Employees
ORDER BY frequency_count DESC;