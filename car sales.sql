--Identify the Null Values--

SELECT * 
 FROM [2023 Car sales Dataset].[dbo].[Car sales Dataset]
 WHERE Engine_Size_L IS NULL
 OR Entertainment_Features IS NULL
 OR Interior_Features IS NULL
 OR Exterior_Features IS NULL
 OR Customer_Ratings IS NULL
 OR Sales_Figures_Units_Sold IS NULL

 --Removing Null Values--
 
 DELETE FROM [2023 Car sales Dataset].[dbo].[Car sales Dataset]
 WHERE Engine_Size_L IS NULL
 OR Entertainment_Features IS NULL
 OR Interior_Features IS NULL
 OR Exterior_Features IS NULL
 OR Customer_Ratings IS NULL
 OR Sales_Figures_Units_Sold IS NULL

 SELECT * 
 FROM [2023 Car sales Dataset].[dbo].[Car sales Dataset]

 --Overview of Car Dataset--
--Gives the overview of the dataset by defining the best car made by sales and by unit sold.

--1 Top selling car brand by price 
SELECT TOP 5 Car_Make, 
SUM(Price) as Total_Price
FROM [2023 Car sales Dataset].[dbo].[Car sales Dataset]
GROUP BY Car_Make, Car_Model
ORDER BY Total_Price DESC 

--2 Top selling car band by unit sold
SELECT Top 5 Car_Make,
SUM(Sales_Figures_Units_Sold) AS Total_Unit_Sold
FROM [2023 Car sales Dataset].[dbo].[Car sales Dataset]
GROUP BY Car_Make
ORDER BY  Total_Unit_Sold DESC

--Sales performance Analysis--
--Understand the overall sales performance, identify the best selling models, and explore trends over the years.

SELECT TOP 5 Car_Make, Car_Model, Year,
SUM(Sales_Figures_Units_Sold) AS Total_Unit_Sold
FROM [2023 Car sales Dataset].[dbo].[Car sales Dataset]
GROUP BY Car_Make, Car_Model, Year
ORDER BY Total_Unit_Sold DESC

--Customer Preferences--
--Analyze customer preferences by examing the popularity of different car makes, models, body-types and colors.

SELECT TOP 5 Car_Make, Car_Model, Body_Type, Color_Options,
SUM(Sales_Figures_Units_Sold) AS Total_Unit_Sold
FROM [2023 Car sales Dataset].[dbo].[Car sales Dataset]
GROUP BY Car_Make, Car_Model, Body_Type, Color_Options
ORDER BY Total_Unit_Sold DESC

--Fuel Efficiency Impact--
--Investigate the correlation between fuel efficiency(Mileage) and sales figures. Identify fuel efficient models that attract more customer.

SELECT TOP 5 Car_Make, Car_Model, Fuel_Type, Mileage_MPG,
SUM(Sales_Figures_Units_Sold) AS Total_Unit_Sold
FROM [2023 Car sales Dataset].[dbo].[Car sales Dataset]
GROUP BY Car_Make, Car_Model, Fuel_Type, Mileage_MPG
ORDER BY Total_Unit_Sold DESC

--Price Sensitivity--
--Determine the impact of pricing on sales. 
--Analyze the relationship between car prices and customer ratings to understand if higher priced models result in higher customer satisfaction.

SELECT TOP 5 Car_Make, Car_Model,
SUM(Price) AS Total_Price, 
AVG(TRY_CAST(LEFT(Customer_Ratings,3) AS float)) AS Avg_Customer_Ratings
FROM [2023 Car sales Dataset].[dbo].[Car sales Dataset]
GROUP BY Car_Make, Car_Model
ORDER BY Total_Price DESC

--Safety and features Impact--
--Evaluate the influence of safety features, entertainment features, and overall vehicle features on customer ratings and sales figures.

SELECT TOP 5 Car_Make, Car_Model, 
SUM(Price) AS Total_Sales,
AVG(TRY_CAST(LEFT(Customer_Ratings,3) AS float)) AS Avg_Customer_Ratings,
Safety_Features, Entertainment_Features
FROM [2023 Car sales Dataset].[dbo].[Car sales Dataset]
GROUP BY Car_Make, Car_Model, Safety_Features, Entertainment_Features
ORDER BY Total_Sales DESC

--Market trend Analysis--
--Identify market trends by analyzing the popularity of different car makes and models over the years.
--Investigate if certain body types and fuel types are gaining traction in the market.

SELECT TOP 5 Car_Make, Car_Model, Body_Type, Fuel_Type, Year,
SUM(Sales_Figures_Units_Sold) AS Total_Unit_Sold
FROM [2023 Car sales Dataset].[dbo].[Car sales Dataset]
GROUP BY Car_Make, Car_Model, Body_Type, Fuel_Type, Year
ORDER BY Total_Unit_Sold DESC