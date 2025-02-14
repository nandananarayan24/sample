create database testt1;
use testt1;
create table countries(
	country_id int primary key,
    country_name varchar(50) not null,
    region_id int not null
    );
create table regions(
region_id int,
region_name varchar(50) not null,
primary key(region_id)
);
insert into countries values(101,"india",10);
select * from countries;
select * from regions;
select * from countries;
create table countries(
country_id int primary key,
country_name varchar(50),
region_id int not null,
foreign key(region_id)references regions(region_id)
);


desc regions;
desc countries;
create table jobs(
job_id int,
job_title varchar(50) not null,
max_salary int not null,
min_salary int not null,
primary key(job_id)
);
create table locations(
location_id int,
street_address varchar(50) not null,
postal_code int not null,
city varchar(50) not null,
state_province varchar(50) not null,
country_id int not null,
primary key(location_id),
foreign key(country_id)references countries(country_id)
);

create table departments(
department_id int,
department_name varchar(50) not null,
location_id int not null,
primary key(department_id),
foreign key(location_id)references locations(location_id)
);

create table employees(
employee_id int,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) not null,
phone_number int not null,
hire_date varchar(50) not null,
job_id int not null,
salary int not null,
manager_id int not null,
department_id int not null,
primary key(employee_id),
foreign key(job_id) references jobs(job_id),
foreign key(department_id) references departments(department_id)
);

create table dependents(
dependent_id int,
first_name varchar(50)not null,
last_name varchar(50)not null,
relationship varchar(50)not null,
employee_id int not null,
primary key(dependent_id),
foreign key(employee_id)references employees(employee_id)
);
alter table employees add constraint foreign key(manager_id) references employees(employee_id);

use testt1;
alter table employees rename to emp;
alter table regions add column region_type varchar(50);
desc regions;
alter table regions rename COLUMN region_type to r_type;
alter table regions modify r_type int;
alter table regions drop r_type;
insert into regions values("101","region 1");
insert into regions values("102","region 2");
insert into regions(region_id,region_name)values
("103","region 3"),
("104","region 4");


