CREATE TABLE departments (  
  id serial PRIMARY KEY,  
  name varchar(255)  
);  
  
CREATE TABLE employees (  
  id serial PRIMARY KEY,  
  first_name varchar(255),  
  last_name varchar(255),  
  salary integer,  
  department_id integer REFERENCES departments(id)  
);  
  
CREATE TABLE projects (  
  id serial PRIMARY KEY,  
  title varchar(255),  
  start_date date,  
  end_date date,  
  budget integer  
);  
  
CREATE TABLE employees_projects (  
  project_id integer REFERENCES projects(id) ON DELETE CASCADE,  
  employee_id integer REFERENCES employees(id) ON DELETE CASCADE,  
  UNIQUE (project_id, employee_id)  
);
