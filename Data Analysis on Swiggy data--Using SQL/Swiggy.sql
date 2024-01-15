
#Swiggy Project

Use swiggy;

#HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?

select count(distinct(restaurant_name)) as total 
from swiggy
where rating>4.5;

#WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?

select * from swiggy;

select city,count( distinct(restaurant_name)) as c_restaurant_name from swiggy
group by city
order by c_restaurant_name desc
limit 1;

select city, count(distinct(restaurant_name) ) as e,
rank() over (order by restaurant_name DESC)
from swiggy
group by city;

#HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?

select distinct( restaurant_name) as pizza_name from swiggy
where restaurant_name like '%pizza%';

#WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
select  cuisine , count(*) as c_count from swiggy
group by cuisine
order by c_count desc
limit 1;

#WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?

select distinct(city), AVG(rating) from Swiggy
group by city;

#WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?

select restaurant_name, menu_category, max(price) as hightest_price from Swiggy
where menu_category="RECOMMENDED"
group by restaurant_name;

select menu_category, max(price) as total, restaurant_name from Swiggy
where menu_category="RECOMMENDED"
group by restaurant_name,menu_category;

#FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE

select distinct(restaurant_name) , cuisine , cost_per_person from swiggy 
where cuisine not in ("Indian")
order by cost_per_person desc
limit 5;

#FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.

select distinct(restaurant_name), cost_per_person from swiggy
where cost_per_person > (select avg( cost_per_person) from swiggy)
order by cost_per_person desc;

#RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES.

select distinct(t1.restaurant_name),t1.city,t2.city
from swiggy t1
join swiggy t2
on t1.restaurant_name=t2.restaurant_name and t1.city<>t2.city;

#WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE'CATEGORY?

select count(item) as no_of_item,menu_category, restaurant_name
from swiggy
where menu_category="main course"
group by menu_category,restaurant_name
order by no_of_item desc
limit 1;

#LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME.

select distinct restaurant_name ,
(count(case when veg_or_nonveg ="veg" then 1 end)* 100/ count(*)) as veg_percentage
from swiggy
group by restaurant_name
having veg_percentage=100.00
order by restaurant_name ASC;

#WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?

select distinct(restaurant_name),avg(price) as avg_price from swiggy
group by restaurant_name
 order by avg_price limit 1;

#WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?

select distinct restaurant_name, count(distinct menu_category) as total from swiggy
group by restaurant_name
order by total desc
limit 5;

#WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?
select distinct restaurant_name ,
(count(case when veg_or_nonveg ="non-veg" then 1 end)* 100/ count(*)) as nonveg_percentage
from swiggy
group by restaurant_name
having nonveg_percentage=100.00
order by restaurant_name ASC;