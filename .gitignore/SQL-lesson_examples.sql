create database IronDB;
use IronDB;
create table students (
	Student_ID int, 
    first_name varchar(255), 
    last_name varchar(255), 
    email varchar(255), 
    course_id int);
create table teachers (
	teacher_id int,
    first_name varchar(255),
    last_name varchar(255));
    
    use olist;
	drop table  students;
    
    use irondb;
	
    create table if not exists courses (
		course_ID int,
        course_name varchar(255),
        form varchar(255),
        teacher_id int);
        primary key (courseID)
        Foreign key (Teacher_ID) references teachers (teacher_ID);
        
        -- or if already created table
        use irondb;
        
        alter table courses
        add primary key (course_id);
         add foreign key (teacher_id) references teachers (teacher_id);
         
         select * from teachers;
        
insert into courses 
	(course_ID, course_name, form, teacher_id)
    values (111, "maths", "fulltime",1),
			(112, "english", "part-time", 2),
            (113, "UIX", "part-time", 3);
            
select * from courses;

update courses
set form = "fulltime"
where course_ID = 112;

select * from courses
limit 2;

insert into courses 
	(course_ID, course_name, form, teacher_id)
    values (114, "maths", "part-time",1);

select course_name, form from courses
where course_name= "maths";

select course_name, form, teacher_id from courses
where form = "fulltime"
order by course_name desc;

select course_name, count(course_name) from courses
group by course_name;