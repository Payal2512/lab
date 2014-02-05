--List the name and city of agents named Smith:

select name, city 
from agents 
where name = 'Smith';

--List pid, name, and quantity of products costing more than US $1.25. 

select pid, name, quantity 
from products 
where priceUSD>1.25

--List the ordno and aid of all orders:

select ordno, aid 
from orders

--List the names and cities of customers in Dallas:

select name, city 
from customers 
where city='Dallas'


--List the names of agents not in New York and not in Newark:

select name 
from agents 
where city not in ('New York','Newark')

--List all data for products not in New York or Newark that cost US $1 or more

select * 
from products 
where city  not in ('New York','Newark') 
and priceUSD>=1.00

--List all data for orders in January or March:

select * from orders where mon in ('jan','mar')

--List all data for orders in February less than US $100:

select * from orders where mon='feb' and dollars<100

--List all orders from the customer whose cid is C001:

select * from orders where cid='c001'