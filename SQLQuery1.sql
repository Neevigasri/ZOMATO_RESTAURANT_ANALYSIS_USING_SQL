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


--- the Most Popular Cuisine in Each City ---

SELECT CITY, CUSINE, COUNT(*) AS Cusine_Count 
FROM Zomato_Restaurant 
GROUP BY CITY, CUSINE 
ORDER BY CITY, Cusine_Count DESC;


---Average Cost for Two by City---

SELECT CITY, ROUND(AVG(COST_FOR_TWO), 2) AS Avg_Cost 
FROM Zomato_Restaurant 
GROUP BY CITY 
ORDER BY Avg_Cost DESC;

---the Top 5 Most Expensive Restaurants---

SELECT TOP 5 RESTAURANT_NAME, CITY, COST_FOR_TWO 
FROM Zomato_Restaurant 
ORDER BY COST_FOR_TWO DESC;

---the Most Expensive and Cheapest Restaurants in Each City---

SELECT CITY, [Restaurant Name], MAX(Prices) AS Max_Price, MIN(Prices) AS Min_Price
FROM Zomato_Dataset
GROUP BY CITY, [Restaurant Name]
ORDER BY CITY, Max_Price DESC;

---Restaurants with the Highest Customer Engagement (Votes)---

SELECT [Restaurant Name], City, SUM(Votes) AS Total_Votes
FROM Zomato_Dataset
GROUP BY [Restaurant Name], City
ORDER BY Total_Votes DESC;

---Which Cities Have the Best Dining Ratings---

SELECT City, ROUND(AVG([Dining Rating]), 2) AS Avg_Dining_Rating
FROM Zomato_Dataset
GROUP BY City
ORDER BY Avg_Dining_Rating DESC;

---the Most Common "Best Seller" Items in Each City---

SELECT City, [Item Name], COUNT(*) AS Count
FROM Zomato_Dataset
WHERE [Best Seller] IS NOT NULL
GROUP BY City, [Item Name]
ORDER BY City, Count DESC;

---Compare Dining vs. Delivery Ratings for Each Restaurant---

SELECT [Restaurant Name], City, ROUND(AVG([Dining Rating]), 1) AS Avg_Dining_Rating,
       ROUND(AVG([Delivery Rating]), 1) AS Avg_Delivery_Rating
FROM Zomato_Dataset
GROUP BY [Restaurant Name], City
ORDER BY Avg_Dining_Rating DESC, Avg_Delivery_Rating DESC;

--- End ---