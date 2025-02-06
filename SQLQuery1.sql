select*from zomato_dataset;
select*from Zomato_Restaurant;

Delete from zomato_dataset where [Dining Rating] is null;


---Total number of Restaurant---

Select count(distinct [Restaurant Name]) as Total_Restaurant from zomato_dataset;


---Find the top 10 restaurant with the highest average rating.---

Select top 10 [Restaurant Name],City, round(avg([Dining Rating]),0) as Highest_Avg_Rating 
from zomato_dataset 
group by [Restaurant Name],City
order by Highest_Avg_Rating Desc;


---Determine the distribution of restaurant across different cities.---

select City, count(*) as [Restaurant Count] 
from zomato_dataset
group by City
order by [Restaurant Count];

---what is the percentage of restaurant that have online order---

Select (count(case when ONLINE_ORDER = 'online-order' then 1 end)*100)/count(*) as percentage_Online_order 
from Zomato_Restaurant ;


---How many Restaurant have a rating above 4.0 & also offer online Delivery---

Select count(*) as [Restaurant Count] 
from Zomato_Restaurant
where RATING >4.0 and ONLINE_ORDER = 'online-order';


---how many restaurant fall into different rating segment---

select 
case
when Rating >=4.5 then '4.5 & Above'
when Rating >=4.0 then '4.0 to 4.4'
when Rating >=3.5 then '3.5 to 3.9'
when Rating >=3.0 then '3.0 to 3.4'
when Rating >=2.5 then '2.5 to 2.9'
else 'Below 2.5'
end as Rating_Segment,
count(*) as Restaurant_Count
from Zomato_Restaurant
group by RATING
order by RATING;


--- Retrive the famous food by city---

select top 2 FAMOUS_FOOD, CITY, count(*) as famous_food
from Zomato_Restaurant
group by FAMOUS_FOOD, CITY;