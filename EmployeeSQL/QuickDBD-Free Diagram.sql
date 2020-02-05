-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/iyD8Zj
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "gender" char(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);
COPY employees FROM '/Users/kattelyaanggasastra/Kat_Berkeley_Study/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/employees.csv' CSV HEADER;
SELECT * FROM employees;


CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" varchar(30)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);
COPY titles FROM '/Users/kattelyaanggasastra/Kat_Berkeley_Study/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/titles.csv' CSV HEADER;
SELECT * FROM titles;


CREATE TABLE "departments" (
    "dept_no" varchar(8)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);
COPY departments FROM '/Users/kattelyaanggasastra/Kat_Berkeley_Study/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/departments.csv' CSV HEADER;
SELECT * FROM departments;


CREATE TABLE "dept_manager" (
    "dept_no" varchar(8)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);
COPY dept_manager FROM '/Users/kattelyaanggasastra/Kat_Berkeley_Study/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/dept_manager.csv' CSV HEADER;
SELECT * FROM dept_manager;


CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(8)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);
COPY dept_emp FROM '/Users/kattelyaanggasastra/Kat_Berkeley_Study/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/dept_emp.csv' CSV HEADER;
SELECT * FROM dept_emp;


CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);
COPY salaries FROM '/Users/kattelyaanggasastra/Kat_Berkeley_Study/UCB-BEL-DATA-PT-11-2019-U-C/02-Homework/09-SQL/Instructions/data/salaries.csv' CSV HEADER;
SELECT * FROM salaries;



ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

