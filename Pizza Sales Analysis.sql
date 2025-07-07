create database pizzahut;
#imported data directly (pizzas, pizzatypes)

#created a table and then imported data (orders, order_details)
create table orders(
order_id int not null,
order_date date not null,
order_time time not null,
primary key (order_id));

create table order_details(
order_details_id int not null,
order_id int not null,
pizza_id text not null,
quantity int not null,
primary key (order_details_id));


#retrieve the total number of orders placed
select count(order_id) as total_orders from orders;


#calcuate the total revenue generated from pizza sales
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id;
-- DON'T PUT SPACE BETWEEN function AND PARENTHESES 
-- ctrl+B to beautify


#identify the highest-priced pizza
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;
-- cannot apply max function here


#identify the most common pizza size ordered
SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;
-- aggregate (count) use group by (on non aggregate) compulsorily


#list the top 5 most ordered pizza size order along with their quantities
SELECT 
    pizza_types.name,
    SUM(order_details.quantity) AS pizza_quantity
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY pizza_quantity DESC
LIMIT 5; 
-- difference between count and sum
-- SUM(quantity) gives Total pizzas ordered (true quantity sold)
-- COUNT(*)	gives Number of orders/rows/transactions for that pizza


#join the necessary tables to find the total quantity of each pizza category ordered
SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS pizza_quantity
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY pizza_quantity DESC;


# determine the distribution of orders by hour of the day
select hour(order_time) as hours, count(order_id) as no_of_orders from orders
group by hours order by hours asc;


#join relevant tables to find the category-wise distriution of pizzas
select category, count(name) from pizza_types
group by category;


#group the orders by date and calculate avg no of pizzas per day
select round(avg(quantity),0) as avg_pizza_per_day from
(select orders.order_date, sum(order_details.quantity) as quantity
from orders JOIN order_details ON orders.order_id = order_details.order_id 
group by orders.order_date) as order_quantity;
-- use of sub-query 


#determine the top 3 most ordered pizza types based on revenue
select pizza_types.name, round(sum(pizzas.price * order_details.quantity),0) as revenue
from pizzas join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details on pizzas.pizza_id = order_details.pizza_id 
group by pizza_types.name order by revenue desc limit 3;
-- group by with aggregate 


#calculate the percentage contribution of each pizza type (category) to total revenue
select pizza_types.category, round ((sum(pizzas.price * order_details.quantity) /(SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2)
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id)) *100,2) as percent_revenue
from pizzas join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details on pizzas.pizza_id = order_details.pizza_id 
group by pizza_types.category order by percent_revenue ;


#analyze the cumulative revenue generated over time 
select order_date, round(sum(revenue) over (order by order_date),0) as cum_revenue from 
(select orders.order_date, sum(order_details.quantity * pizzas.price) as revenue 
from order_details join pizzas on order_details.pizza_id = pizzas.pizza_id
join orders on orders.order_id = order_details.order_id
group by orders.order_date) as sales;


#determine the top 3 most ordered pizza types based on revenue for each pizza category
select name, revenue from (select category, name, revenue,
rank() over(partition by category order by revenue desc) as rn
from
(select pizza_types.name, pizza_types.category, round(sum(pizzas.price * order_details.quantity),0) as revenue
from pizzas join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details on pizzas.pizza_id = order_details.pizza_id 
group by pizza_types.category, pizza_types.name)as a) as b 
where rn <=3 ;







    









