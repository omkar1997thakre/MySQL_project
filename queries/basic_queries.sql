--View all passengers and their tickets
SELECT 
    p.PassengerName,
    b.BusNumber,
    t.TravelDate,
    t.Fare
FROM ticket t
JOIN passenger p ON t.PassengerID = p.PassengerID
JOIN bus b ON t.BusID = b.BusID;

--List all buses with route details
SELECT 
    b.BusNumber,
    r.StartPoint,
    r.EndPoint,
    r.DistanceKM
FROM bus b
JOIN route r ON b.RouteID = r.RouteID;

--Find drivers with more than 5 years experience
SELECT 
    DriverName,
    ExperienceYears
FROM driver
WHERE ExperienceYears > 5;

--Total passengers per bus
SELECT 
    b.BusNumber,
    COUNT(t.TicketID) AS TotalPassengers
FROM bus b
LEFT JOIN ticket t ON b.BusID = t.BusID
GROUP BY b.BusNumber;

--Average fare per bus
SELECT 
    b.BusNumber,
    AVG(t.Fare) AS AvgFare
FROM bus b
JOIN ticket t ON b.BusID = t.BusID
GROUP BY b.BusNumber;

--List all complaints with passenger name
SELECT 
    p.PassengerName,
    c.ComplaintType,
    c.Status
FROM complaint c
JOIN passenger p ON c.PassengerID = p.PassengerID;

--Get schedule details for each bus
SELECT 
    b.BusNumber,
    s.DepartureTime,
    s.ArrivalTime
FROM schedule s
JOIN bus b ON s.BusID = b.BusID;
