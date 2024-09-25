create database lab2;

create table countries(
    country_id int primary key,
    country_name varchar(100) default 'Kazakhstan',
    region_id int,
    population int
);

--3
insert into countries (country_name, region_id, population) values ('Japan', 1, 123599146);

--4
insert into countries (country_id, country_name) values (2, 'Argentina');

--5
update countries set region_id = NULL where region_id = 3;

--6
insert into countries (country_name, country_id, region_id) values
    ('Russia', 4, 2),
    ('Niger', 5, 5),
    ('Korea', 6, 7);

--8
update countries set country_name = NULL where region_id = 5;

--9
insert into countries default values;

--10
create table countries_new as table countries with no data;

--11
insert into countries_new select * from countries;

--12
update countries set region_id = 1 where region_id is NULL;

--13
select country_name, population * 1.1 as "NewPopulation" from countries;

--14
delete from countries where population < 100000;

--15
delete from countries_new where country_id in (select country_id from countries) returning *;

--16
delete from countries returning *;
