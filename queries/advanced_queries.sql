--Passengers who gave a 5-star rating
SELECT PassengerName
FROM passenger
WHERE PassengerID IN (
    SELECT t.PassengerID
    FROM ticket t
    JOIN feedback f ON t.TicketID = f.TicketID
    WHERE f.Rating = 5
);

--Buses with above-average fare
SELECT BusID, AVG(Fare) AS AvgFare
FROM ticket
GROUP BY BusID
HAVING AVG(Fare) > (
    SELECT AVG(Fare) FROM ticket
);

--Total passengers per bus
WITH PassengerCount AS (
    SELECT BusID, COUNT(*) AS TotalPassengers
    FROM ticket
    GROUP BY BusID
)
SELECT 
    b.BusNumber,
    pc.TotalPassengers
FROM PassengerCount pc
JOIN bus b ON pc.BusID = b.BusID;

--Revenue generated per route
WITH RouteRevenue AS (
    SELECT 
        r.RouteID,
        SUM(t.Fare) AS TotalRevenue
    FROM ticket t
    JOIN bus b ON t.BusID = b.BusID
    JOIN route r ON b.RouteID = r.RouteID
    GROUP BY r.RouteID
)
SELECT * FROM RouteRevenue;

--Rank buses by number of passengers
SELECT 
    BusID,
    COUNT(*) AS PassengerCount,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS BusRank
FROM ticket
GROUP BY BusID;

--Rank passengers based on total spend
SELECT 
    p.PassengerName,
    SUM(t.Fare) AS TotalSpent,
    DENSE_RANK() OVER (ORDER BY SUM(t.Fare) DESC) AS SpendRank
FROM passenger p
JOIN ticket t ON p.PassengerID = t.PassengerID
GROUP BY p.PassengerName;


--Categorize complaints by status
SELECT 
    ComplaintType,
    Status,
    CASE
        WHEN Status = 'Resolved' THEN 'Closed'
        ELSE 'Open'
    END AS ComplaintCategory
FROM complaint;