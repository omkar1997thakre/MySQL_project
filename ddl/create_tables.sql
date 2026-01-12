CREATE TABLE city (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL
);

CREATE TABLE transport_department (
    DeptID INT PRIMARY KEY,
    CityID INT NOT NULL,
    DeptName VARCHAR(100) NOT NULL,
    FOREIGN KEY (CityID) REFERENCES city(CityID)
);

CREATE TABLE route (
    RouteID INT PRIMARY KEY,
    DeptID INT NOT NULL,
    StartPoint VARCHAR(100) NOT NULL,
    EndPoint VARCHAR(100) NOT NULL,
    DistanceKM DECIMAL(5,2) CHECK (DistanceKM > 0),
    FOREIGN KEY (DeptID) REFERENCES transport_department(DeptID)
);

CREATE TABLE bus (
    BusID INT PRIMARY KEY,
    RouteID INT NOT NULL,
    BusNumber VARCHAR(20) NOT NULL UNIQUE,
    Capacity INT CHECK (Capacity > 0),
    FOREIGN KEY (RouteID) REFERENCES route(RouteID)
);

CREATE TABLE driver (
    DriverID INT PRIMARY KEY,
    BusID INT NOT NULL,
    DriverName VARCHAR(100) NOT NULL,
    LicenseNumber VARCHAR(50) NOT NULL UNIQUE,
    ExperienceYears INT CHECK (ExperienceYears >= 0),
    FOREIGN KEY (BusID) REFERENCES bus(BusID)
);

CREATE TABLE schedule (
    ScheduleID INT PRIMARY KEY,
    BusID INT NOT NULL,
    DepartureTime TIME NOT NULL,
    ArrivalTime TIME NOT NULL,
    CHECK (ArrivalTime > DepartureTime),
    FOREIGN KEY (BusID) REFERENCES bus(BusID)
);

CREATE TABLE passenger (
    PassengerID INT PRIMARY KEY,
    PassengerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE ticket (
    TicketID INT PRIMARY KEY,
    PassengerID INT NOT NULL,
    BusID INT NOT NULL,
    TravelDate DATE NOT NULL,
    Fare DECIMAL(8,2) CHECK (Fare >= 0),
    FOREIGN KEY (PassengerID) REFERENCES passenger(PassengerID),
    FOREIGN KEY (BusID) REFERENCES bus(BusID)
);

CREATE TABLE feedback (
    FeedbackID INT PRIMARY KEY,
    TicketID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments VARCHAR(255),
    FOREIGN KEY (TicketID) REFERENCES ticket(TicketID)
);

CREATE TABLE complaint (
    ComplaintID INT PRIMARY KEY,
    PassengerID INT NOT NULL,
    ComplaintType VARCHAR(100) NOT NULL,
    Status VARCHAR(50) CHECK (Status IN ('Open', 'In Progress', 'Resolved')),
    FOREIGN KEY (PassengerID) REFERENCES passenger(PassengerID)
);
