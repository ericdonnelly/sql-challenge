CREATE TABLE Departments(
    dept_no VARCHAR(255) NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(dept_no)
);

CREATE TABLE Titles(
    title_id VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    PRIMARY KEY(title_id)
);

CREATE TABLE Employees(
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR(255) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY(emp_no),
    FOREIGN KEY(emp_title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Department_Employees(
    emp_no INT NOT NULL,
    dept_no VARCHAR(255) NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE Department_Managers(
    dept_no VARCHAR(255) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY(dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Salaries(
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)   
);