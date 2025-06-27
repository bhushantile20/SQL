SELECT * FROM blinkit_data


SELECT COUNT(*) FROM blinkit_data

UPDATE blinkit_data 
SET Item_Fat_Content = 
CASE 
WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'low Fat' 
WHEN Item_Fat_Content = 'reg' THEN 'Reqular' 
ELSE Item_Fat_Content 
END 


-- to find the distinct records 

SELECT DISTINCT(Item_Fat_Content) FROM Blinkit_data

-- ata maja yeil 
 
-- Cast show how mancy decimal no also 


-- KPI Requirements : 
-- 1.Total Sales: overall revenue generated from all items sold.

-- mothy value la zot kartoh as decimal madhe convert karoth
SELECT CAST (SUM(Total_Sales) /1000000 As  DECIMAL (10,2))AS Total_Sales_Millions
FROM blinkit_data


-- rounding of the values vallue cha averge karun te show karych 
SELECT CAST(AVG(Total_Sales) AS DECIMAL (10,0))Avg_Sales FROM blinkit_data 
WHERE Outlet_Establishment_Year=2022


SELECT COUNT(*) No_Of_Items FROM blinkit_data
WHERE Outlet_Establishment_Year=2022



SELECT CAST(AVG(Rating)AS DECIMAL (10,2)) AS Avg_Rating FROM blinkit_data


SELECT Item_Fat_Content,
CAST(SUM(Total_Sales) AS DECIMAL (10,2))AS Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL (10,1)) AS Avg_Sales,
COUNT(*) AS No_Of_Items, 
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating

From blinkit_data  
GROUP BY Item_Fat_Content 
ORDER BY Total_Sales DESC 





SELECT Item_Type,
CAST(SUM(Total_Sales) AS DECIMAL (10,2))AS Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL (10,1)) AS Avg_Sales,
COUNT(*) AS No_Of_Items, 
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating

From blinkit_data  
GROUP BY Item_Type
ORDER BY Total_Sales DESC 





SELECT TOP 5 Item_Type,
CAST(SUM(Total_Sales) AS DECIMAL (10,2))AS Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL (10,1)) AS Avg_Sales,
COUNT(*) AS No_Of_Items, 
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating

From blinkit_data  
GROUP BY Item_Type
ORDER BY Total_Sales DESC 



SELECT TOP 5 Item_Type,
CAST(SUM(Total_Sales) AS DECIMAL (10,2))AS Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL (10,1)) AS Avg_Sales,
COUNT(*) AS No_Of_Items, 
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
From blinkit_data  
GROUP BY Item_Type
ORDER BY Total_Sales ASC



SELECT Outlet_Establishment_Year, 
CAST(SUM(Total_Sales)AS DECIMAL (10,2)) AS Total_Sales 
From blinkit_data
Group BY Outlet_Establishment_Year
ORDER BY Total_Sales ASC

SELECT Outlet_Establishment_Year, 
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
From blinkit_data
Group BY Outlet_Establishement_Year
ORDER BY Outlet_Establishment_Year ASC
 