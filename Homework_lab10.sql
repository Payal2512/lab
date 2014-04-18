--Name: Payal Sharma
--Date: 18 April 2014
--Assignment: Lab 10


--Write two functions (stored procedures) that take an integer course number as their only parameter: 
--1.function PreReqsFor(courseNum): Returns the immediate pre-requisites for the passed in course number. 

create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
   course_num  int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select preReqNum
      from   Prerequisites
      where  courseNum= course_num;
   return resultset;
end;
$$ 
language plpgsql;

select PreReqsFor(499, 'results');
Fetch all from results;

--2.function IsPreReqFor(courseNum): Returns the courses for which the passed in course number is an immediate pre-requisite

create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor as 
$$
declare
   prereq      int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select  courseNum
      from   Prerequisites
      where  preReqNum = prereq;
   return resultset;
end;
$$ 
language plpgsql;

select IsPreReqFor(120, 'results');
Fetch all from results;



