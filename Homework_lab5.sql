--Name: Payal Sharma
--Date: 18 Feb 2014
--Assignment: Lab 5 SQL Queries

--Q1 Get the cities of agents booking an order for customer “Basics” (using joins):

select a.city 
from agents a,
     orders o,
     customers c
where a.aid=o.aid 
and   c.cid=o.cid
and   c.name='Basics'

--Q2 Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. (This is not the same as asking for pids of products ordered by a customer in Kyoto): Using joins:

select distinct o2.pid
from orders o1,
     orders o2,
     customers c
where o1.cid=c.cid
and   c.city='Kyoto'
and   o2.aid= o1.aid
	
			    
--Q3 Get the names of the customers who have never placed an order (using subquery)

select name 
from customers 
where cid not in (select distinct cid 
		  from orders)

--Q4 Get the names of the customers who have never placed an order (using outer join)

select c.name
from customers c 
left outer join orders o
on c.cid=o.cid
where o.ordno is null

--Q5 Get the name of customers who have placed at least an order through agent in their city, along with those agent's name:

select distinct c.name, a.name
from customers c, 
     agents a,
     orders o 
where a.aid=o.aid and c.cid=o.cid
and c.city=a.city

--Q6 Get the names of customers and agents in the same city, along with the name of the city , regardless of whether or not the customer has ever placed an order with that agent:

select  c.name, a.name, c.city
from customers c,agents a
where c.city=a.city
			     
--Q7 Get the name and city of the customers who live in the city where the least number of products are made:

select name,city 
from customers 
where city = (select city 
	      from products 
	      where quantity= (select min(quantity) 
			       from products))

