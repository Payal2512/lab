
--Name: Payal Sharma
--Date: 27 Feb 2014
--Assignment: Lab 6 SQL Queries


--Q1 Get the name and city of the customers who live in a city where the most number of products are made:

select name,city 
from customers 
where city = (select city 
	      from (select city , sum(quantity) as "sq"
		    from products 
	            group by city
	            order by sq desc
                    limit 1) sub1)
                    
--Q2 Get the name and city of customers who live in any city where the most number of products are made:

select name,city 
from customers 
where city in (select city 
	      from (select city , sum(quantity) as "sq"
		    from products 
	            group by city
	            order by sq desc
                    limit 2) sub1)


--Q3 List the products whose priceUSD is above the average price USD:

select name from products 
where priceUSD > (select avg(priceUSD) 
		  from products)

--Q4 Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low:

select c.name, o.pid, o.dollars 
from customers c, orders o
where c.cid=o.cid 
order by o.dollars desc

--Q5 Show all customer names (in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLS:

select c.name, coalesce(sum(o.qty),0) as "total products ordered" 
from customers c
left outer join orders o
     on c.cid = o.cid
     group by c.name
     order by c.name;

--Q6 Show the names of all customers who bought products from agents based in New York along with the names of the products they ordered, and the names of the agents who sold it to them:

select c.name, a.name, p.name
from customers c, agents a, products p, orders o
where c.cid = o.cid 
and a.aid=o.aid 
and p.pid=o.pid
and a.city='New York'

--Q7 Write a query to check the accuracy of the dollars column in the Orders table. This means calculating Orders.dollars from other data in other tables and then comparing those values to the values in Orders.dollars:

select p.priceUSD, o.qty, c.discount, o.dollars from orders o, customers c, products p
where o.cid = c.cid and o.pid = p.pid
and o.dollars != ( p.priceusd * o.qty * ((100 - c.discount) / 100))

