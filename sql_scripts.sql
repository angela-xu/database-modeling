CREATE TABLE Department_Office
(   
    Department_Office_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    LocatedFloor INT NOT NULL CHECK (LocatedFloor IN (0,1,2,3)),
    OpeningHours  VARCHAR(200) NOT NULL, 
    RoomNumber VARCHAR(10),
    NumberOfServices INT,
    Website VARCHAR(50) 
);


CREATE TABLE ServiceTable
(   
    ServiceID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department_Office_ID INT NOT NULL,
    ServiceDescription VARCHAR(500),
    Website VARCHAR(50), 
    
    CONSTRAINT ServiceTable_FK FOREIGN KEY (Department_Office_ID) REFERENCES Department_Office (Department_Office_ID)
);


CREATE TABLE EventTable
(   
    EventID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    StartDateTime DATETIME NOT NULL,
    EndDateTime DATETIME NOT NULL,
    LocatedFloor INT NOT NULL CHECK (LocatedFloor IN (0,1,2,3)),
    RoomNumber VARCHAR(10),
    EventDescription VARCHAR(500),
    Department_Office_ID INT,
    Website VARCHAR(50), 
    
    CONSTRAINT EventTable_FK FOREIGN KEY (Department_Office_ID) REFERENCES Department_Office (Department_Office_ID)
);


CREATE TABLE Facility
(   
    FacilityID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    LocatedFloor INT NOT NULL CHECK (LocatedFloor IN (0,1,2,3)),
    RoomNumber VARCHAR(10),
    FacilityDescription VARCHAR(500),
    OpeningHours VARCHAR(200),
);


CREATE TABLE AppUser
(   
    UserID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SUID CHAR(9)
);


CREATE TABLE UserActivity
(   
    UserActivityID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ActivityDateTime DATETIME DEFAULT getdate() NOT NULL,
    UserID INT,
    Department_Office_ID INT,
    ServiceID INT,
    EventID INT,
    FacilityID INT,
	
    CONSTRAINT UserActivity_FK_UserID FOREIGN KEY (UserID) REFERENCES AppUser (UserID),
    CONSTRAINT UserActivity_FK_Department_Office_ID FOREIGN KEY (Department_Office_ID) REFERENCES Department_Office (Department_Office_ID),
    CONSTRAINT UserActivity_FK_ServiceID FOREIGN KEY (ServiceID) REFERENCES ServiceTable (ServiceID),
    CONSTRAINT UserActivity_FK_EventID FOREIGN KEY (EventID) REFERENCES EventTable (EventID),
    CONSTRAINT UserActivity_FK_FacilityID FOREIGN KEY (FacilityID) REFERENCES Facility (FacilityID)
);


-- Insert Data into Department/Office Table
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Career Services', 2, 'Monday - Friday: 9:00 am - 5:00 pm; Saturday - Sunday: Closed');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Cash Operations', 2, 'Monday - Friday: 9:00 am - 5:00 pm; Saturday - Sunday: Closed');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Office of Multicultural Affairs', 1, 'Monday - Friday: 9:00 am - 5:00 pm; Saturday - Sunday: Closed');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Office of Student Activites', 1, 'Monday - Friday: 9:00 am - 5:00 pm; Saturday - Sunday: Closed');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Parents Office', 2, 'Monday - Friday: 9:00 am - 5:00 pm; Saturday - Sunday: Closed');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Schine Box Office', 2, 'Monday – Thursday: 11:00 am - 5:00 pm; Friday - Saturday: 12:00 pm - 5:00 pm; Sunday: Closed');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Schine Copy Center', 1, 'Monday - Friday: 9:00 am - 5:00 pm; Saturday - Sunday: Closed');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Schine Dining', 2, 'Monday - Friday: 7:30 am - 7:00 pm; Saturday - Sunday: 11:00 am - 5:00 pm');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Schine Information Desk', 2, 'Monday - Friday: 9:00 am - 5:00 pm; Saturday - Sunday: Closed');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Shaw Center', 1, 'Monday - Friday: 9:00 am - 5:00 pm; Saturday - Sunday: Closed');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Student Association', 1, 'Monday - Friday: 9:00 am - 5:00 pm; Saturday - Sunday: Closed');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('Student Centers and Programming Services', 2, 'Monday - Friday: 9:00 am - 5:00 pm; Saturday - Sunday: Closed');
INSERT INTO Department_Office(Name, LocatedFloor, OpeningHours) VALUES ('University Bookstore', 2, 'Monday - Friday: 8:30 am - 6:00 pm; Saturday - Sunday: 12:00 pm - 5:00 pm');


-- Insert Data into Service Table
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription) VALUES ('15 Minute Drop-Ins', 1, '15 Minute Drop-Ins for quick questions or resume review at Career Services. No appoitment necessary. Monday & Tuesday: 12:00 - 2:30 p.m. Wednesday & Thursday: 2:00 - 4:30 p.m. Friday: No Drop-Ins');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription) VALUES ('Resume & Cover Letter Review', 1, 'Resume & Cover Letter Review at Career Services. By appoitment only.');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription) VALUES ('Mock Interview', 1, 'Mock Interview at Career Services. By appoitment only.');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription) VALUES ('Career Counseling', 1, 'Career Counseling at Career Services. By appoitment only.');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('Career Workshops', 1, 'Career Workshops hosted by Career Services. Please RSVP through Orangelink.', 'https://syr-csm.symplicity.com/students/');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('Career Fairs', 1, 'Career Fairs hosted by Career Services. Please RSVP through Orangelink.', 'https://syr-csm.symplicity.com/students/');
INSERT INTO ServiceTable(Name, Department_Office_ID) VALUES ('Cash Operations', 2);
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('Multicultural Programs & Workshops & Services', 3, 'Multicultural Programs & Workshops & Services at Office of Multicultural Affairs. Please check our website for more details.', 'http://multicultural.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, Website) VALUES ('Guidance on Creating a New Student Organization', 4, 'http://studentactivities.syr.edu/' );
INSERT INTO ServiceTable(Name, Department_Office_ID, Website) VALUES ('Funding Information for Student Organization', 4, 'http://studentactivities.syr.edu/' );
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('Help for Parents', 5, 'Help from Parent Office to help parents of SU students to make most of their roles. Please check our website for more details.', 'http://parents.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('Tickets Selling', 6, 'Tickets Selling at Schine Box Office.', 'http://boxoffice.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, Website) VALUES ('High quality color and black copying', 7, 'http://copycenter.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, Website) VALUES ('Faxing & Scanning', 7, 'http://copycenter.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, Website) VALUES ('Large format poster printing', 7, 'http://copycenter.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, Website) VALUES ('Large document copying', 7, 'http://copycenter.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, Website) VALUES ('Document Binding', 7, 'http://copycenter.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, Website) VALUES ('Walk-up black copiers', 7, 'http://copycenter.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, Website) VALUES ('Laminating (up to 24")', 7, 'http://copycenter.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, Website) VALUES ('Postage Stamps & Envelopes', 7, 'http://copycenter.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, Website) VALUES ('Print Quota Recharge ', 7, 'http://copycenter.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription) VALUES ('Food Services', 8, 'Food Services at Schine Dining. We serve a variety of delicious food.');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription) VALUES ('Information Service', 9, 'Information Service at Schine Information Desk on 2nd floor of Schine Student Center.');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('Community Academic Service', 10, 'Community Academic Service at Shaw Center. Please check our website for more details.', 'http://shawcenter.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('Services for Student Assocations', 11, 'Various Services for SU Student Assocations at Student Association. Please check our website for more details.', 'http://studentorgs.syr.edu/sa/');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('Servicse for SU Students & Student Assocations & Student Activities', 12, 'Various Servicse for SU Students & Student Assocations & Student Activities at Student Centers and Programming Services. Please check our website for more details.', 'http://scps.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('Books Selling', 13, 'Books Selling at SU Bookstore. Please check our website for more details.', 'http://bookweb.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('Supplies Selling', 13, 'Supplies Selling at SU Bookstore. Please check our website for more details.', 'http://bookweb.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('SU Apparel & Gifts Selling', 13, 'SU Apparel & Gifts Selling at SU Bookstore. Please check our website for more details.', 'http://bookweb.syr.edu/');
INSERT INTO ServiceTable(Name, Department_Office_ID, ServiceDescription, Website) VALUES ('CuseTech & Computer Service', 13, 'CuseTech & Computer Service at SU Bookstore. Please check our website for more details.', 'http://bookweb.syr.edu/');


-- Insert Data into Event Table
INSERT INTO EventTable(Name, StartDateTime, EndDateTime, LocatedFloor, Department_Office_ID) VALUES('Workshop: The Internship Search How? Where? When?', '2015-12-02 13:00', '2015-12-02 14:00', 2, 1);
INSERT INTO EventTable(Name, StartDateTime, EndDateTime, LocatedFloor, Department_Office_ID) VALUES('Workshop: The Internship Search How? Where? When?', '2015-12-04 10:30', '2015-12-04 11:30', 2, 1);
INSERT INTO EventTable(Name, StartDateTime, EndDateTime, LocatedFloor) VALUES('Ben Seidman Comedy Magician', '2015-12-04 22:00', '2015-12-05 00:00', 0);
INSERT INTO EventTable(Name, StartDateTime, EndDateTime, LocatedFloor, Department_Office_ID) VALUES('Workshop: The Internship Search How? Where? When?', '2015-12-09 13:00', '2015-12-09 14:00', 2, 1);
INSERT INTO EventTable(Name, StartDateTime, EndDateTime, LocatedFloor, Department_Office_ID) VALUES('Workshop: The Internship Search How? Where? When?', '2015-12-11 10:30', '2015-12-11 11:30', 2, 1);
INSERT INTO EventTable(Name, StartDateTime, EndDateTime, LocatedFloor, Department_Office_ID) VALUES('Pancake Breakfast Stressbuster', '2015-12-13 22:00', '2015-12-14 01:00', 2, 8);
INSERT INTO EventTable(Name, StartDateTime, EndDateTime, LocatedFloor, Department_Office_ID) VALUES('Workshop: The Internship Search How? Where? When?', '2015-12-16 13:00', '2015-12-16 14:00', 2, 1);


-- Insert Data into Facility Table
INSERT INTO Facility(Name, LocatedFloor, FacilityDescription) VALUES ('ATM', 2, 'This ATM is located in SU Bookstore.');
INSERT INTO Facility(Name, LocatedFloor, FacilityDescription) VALUES ('Vending Machine', 1, 'This Vending Machine is located on 1st floor near Schine Copy Center.');
INSERT INTO Facility(Name, LocatedFloor, FacilityDescription) VALUES ('Lockers', 1, 'These Lockers are located on 1st floor near Schine Copy Center.');
INSERT INTO Facility(Name, LocatedFloor, FacilityDescription) VALUES ('Computer Cluster', 1, 'This Computer Cluster is located on 1st floor near Schine Copy Center.');
INSERT INTO Facility(Name, LocatedFloor, FacilityDescription) VALUES ('Cafe', 0, 'This Cafe is located on 0th floor (Underground floor).');
INSERT INTO Facility(Name, LocatedFloor, FacilityDescription) VALUES ('Auditorium', 2, 'This Auditorium is located on 1st floor near SU Bookstore.');
INSERT INTO Facility(Name, LocatedFloor, FacilityDescription) VALUES ('Study Space & Lounge', 3, 'This Study Space & Lounge is located on 3rd floor.');
INSERT INTO Facility(Name, LocatedFloor, FacilityDescription) VALUES ('Restrooms on 2nd floor', 2, 'These Restrooms are located on 2nd floor near Career Services.');
INSERT INTO Facility(Name, LocatedFloor, FacilityDescription) VALUES ('Restrooms on 3rd floor', 3, 'These Restrooms are located on 3rd floor near Study Space & Lounge.');


-- Insert Data into App User Table
INSERT INTO AppUser(SUID) VALUES (968082926);
INSERT INTO AppUser(SUID) VALUES (968082927);
INSERT INTO AppUser(SUID) VALUES (968082928);
INSERT INTO AppUser(SUID) VALUES (968082929);
INSERT INTO AppUser(SUID) VALUES (668072926);
INSERT INTO AppUser(SUID) VALUES (568072329);
INSERT INTO AppUser(SUID) VALUES (868072630);
INSERT INTO AppUser(SUID) VALUES (368072931);
INSERT INTO AppUser(UserID) VALUES (768072629);


--Insert Data into User Activity Table
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (1, 1);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (5, 20);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (7, 22);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (1, 2);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (1, 3);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (2, 7);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (1, 1);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (1, 3);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (3, 7);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (1, 1);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (3, 9);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (1, 1);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (7, 5);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (1, 1);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (6, 12);
INSERT INTO UserActivity(UserID, EventID) VALUES (5, 5);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (1, 20);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (9, 1);
INSERT INTO UserActivity(UserID, EventID) VALUES (5, 3);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (1, 1);
INSERT INTO UserActivity(UserID, EventID) VALUES (6, 1);
INSERT INTO UserActivity(UserID, EventID) VALUES (1, 3);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (7, 1);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (9, 1);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (5, 11);
INSERT INTO UserActivity(UserID, Department_Office_ID) VALUES (7, 1);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (3, 5);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (4, 30);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (6, 29);
INSERT INTO UserActivity(UserID, FacilityID) VALUES (8, 2);
INSERT INTO UserActivity(UserID, FacilityID) VALUES (9, 6);
INSERT INTO UserActivity(UserID, FacilityID) VALUES (1, 3);
INSERT INTO UserActivity(UserID, FacilityID) VALUES (3, 5);
INSERT INTO UserActivity(UserID, FacilityID) VALUES (5, 9);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (9, 15);
INSERT INTO UserActivity(UserID, ServiceID) VALUES (2, 18);
INSERT INTO UserActivity(UserID, EventID) VALUES (9, 1);
INSERT INTO UserActivity(UserID, EventID) VALUES (3, 1);
INSERT INTO UserActivity(UserID, EventID) VALUES (4, 1);
INSERT INTO UserActivity(UserID, FacilityID) VALUES (7, 1);
INSERT INTO UserActivity(UserID, FacilityID) VALUES (6, 8);
INSERT INTO UserActivity(UserID, FacilityID) VALUES (9, 1);
INSERT INTO UserActivity(UserID, FacilityID) VALUES (5, 2);
INSERT INTO UserActivity(UserID, FacilityID) VALUES (6, 7);
INSERT INTO UserActivity(UserID, EventID) VALUES (5, 5);
INSERT INTO UserActivity(UserID, EventID) VALUES (7, 7);
INSERT INTO UserActivity(UserID, EventID) VALUES (9, 1);


select * from Department_Office
select * from servicetable
select * from EventTable
select * from Facility
select * from AppUser
select * from UserActivity


-- What departments or offices are housed in Schine Student Center?
CREATE VIEW Department_Office_Admin_V as
SELECT *
FROM Department_Office;

SELECT * FROM Department_Office_Admin_V;


CREATE VIEW Department_Office_User_V as
SELECT do.Name, do.LocatedFloor, do.RoomNumber, do.OpeningHours, do.NumberOfServices, do.Website
FROM Department_Office do;

SELECT * FROM Department_Office_User_V;

DROP VIEW Service_Admin_V;


-- What services are provided in Schine Student Center? (join name)
CREATE VIEW Service_Admin_V as
SELECT do.Department_Office_ID, do.Name 'Department/Office Name', s.ServiceID, s.Name 'Service Name', s.ServiceDescription, s.Website
FROM ServiceTable s 
LEFT JOIN Department_Office do ON s.Department_Office_ID = do.Department_Office_ID;

SELECT * FROM Service_Admin_V;


CREATE VIEW Service_User_V as
SELECT do.Name 'Department/Office Name', s.Name 'Service Name', s.ServiceDescription, s.Website
FROM ServiceTable s 
LEFT JOIN Department_Office do ON s.Department_Office_ID = do.Department_Office_ID;

SELECT * FROM Service_User_V;


-- What services are provided by certain department/office?
-- What events are hosted in Schine Student Center? 
CREATE VIEW Event_Admin_V as
SELECT e.EventID, e.Name 'Event Name', e.StartDateTime, e.EndDateTime, e.LocatedFloor, e.RoomNumber, e.EventDescription, e.Department_Office_ID, do.Name 'Department/Office Name', e.Website
FROM EventTable e
LEFT JOIN Department_Office do ON e.Department_Office_ID = do.Department_Office_ID;

SELECT * FROM Event_Admin_V;


CREATE VIEW Event_User_V as
SELECT e.StartDateTime, e.Name 'Event Name', e.EndDateTime, e.LocatedFloor, e.RoomNumber, e.EventDescription, do.Name 'Hosting Department/Office', e.Website
FROM EventTable e
LEFT JOIN Department_Office do ON e.Department_Office_ID = do.Department_Office_ID;

SELECT * FROM Event_User_V;


-- What facilites are available in Schine Student Center? 
CREATE VIEW Facility_Admin_V as
SELECT * 
FROM Facility;

SELECT * FROM Facility_Admin_V;


CREATE VIEW Facility_User_V as
SELECT f.Name, f.LocatedFloor, f.RoomNumber, f.FacilityDescription, f.OpeningHours
FROM Facility f;

SELECT * FROM Facility_User_V;


CREATE VIEW AppUser_Admin_V as
SELECT * 
FROM AppUser;

SELECT * FROM AppUser_Admin_V;


CREATE VIEW UserActivity_Admin_V as
SELECT * 
FROM UserActivity;

SELECT * FROM UserActivity_Admin_V;


SELECT s.Name
FROM ServiceTable s
LEFT JOIN Department_Office do ON s.Department_Office_ID = do.Department_Office_ID
WHERE do.Name = 'Career Services';


-- Procedure: Count the 'Number of Services' in Department/Office Table
CREATE PROCEDURE Department_Office_Number_of_Services
AS
BEGIN
    UPDATE Department_Office
	SET NumberOfServices = New.Number
	FROM
	    (SELECT s.Department_Office_ID 'ID', COUNT(s.ServiceID) 'Number'
		 FROM ServiceTable s
		 GROUP BY s.Department_Office_ID) AS New
	WHERE Department_Office.Department_Office_ID = New.ID
END;


-- Call the Procedure
EXEC Department_Office_Number_of_Services;


-- Trigger: automatically update Department/Office Table's "Number of Services" after Service information is modified.
CREATE TRIGGER update_Department_Office_NumOfServices_Trigger
ON ServiceTable
FOR INSERT, UPDATE, DELETE
AS
IF @@ROWCOUNT >= 1
BEGIN
    UPDATE Department_Office
	SET NumberOfServices = New.Number
	FROM
	    (SELECT s.Department_Office_ID 'ID', COUNT(s.ServiceID) 'Number'
		 FROM ServiceTable s
		 GROUP BY s.Department_Office_ID) AS New
	WHERE Department_Office.Department_Office_ID = New.ID
END;


-- Test the Trigger
SELECT * FROM Department_Office;

INSERT INTO ServiceTable(Name, Department_Office_ID) VALUES ('Networking Strategy', 1);

SELECT * FROM Department_Office;


-- HOT Search Ranking of Departments/offices
SELECT DO.Name, New.[Number of Searches]
FROM Department_Office DO
INNER JOIN (SELECT Department_Office_ID 'ID', COUNT(UserActivityID) 'Number of Searches'
            FROM UserActivity
			WHERE Department_Office_ID IS NOT NULL
			GROUP BY Department_Office_ID
			) AS New
ON DO.Department_Office_ID = New.ID
ORDER BY  New.[Number of Searches] DESC;


-- HOT Search Ranking of Services
SELECT ST.Name, New.[Number of Searches]
FROM ServiceTable ST
INNER JOIN (SELECT ServiceID 'ID', COUNT(UserActivityID) 'Number of Searches'
            FROM UserActivity
			WHERE ServiceID IS NOT NULL
			GROUP BY ServiceID
			) AS New
ON sT.ServiceID = New.ID
ORDER BY  New.[Number of Searches] DESC;


-- HOT Search Ranking of Events
SELECT ET.Name, New.[Number of Searches], ET.StartDateTime
FROM EventTable ET
INNER JOIN (SELECT EventID 'ID', COUNT(UserActivityID) 'Number of Searches'
            FROM UserActivity
			WHERE EventID IS NOT NULL
			GROUP BY EventID
			) AS New
ON ET.EventID = New.ID
ORDER BY  New.[Number of Searches] DESC;


-- HOT Search Ranking of Facilities
SELECT F.Name, New.[Number of Searches]
FROM facility F
INNER JOIN (SELECT FacilityID 'ID', COUNT(UserActivityID) 'Number of Searches'
            FROM UserActivity
			WHERE FacilityID IS NOT NULL
			GROUP BY FacilityID
			) AS New
ON F.FacilityID = New.ID
ORDER BY  New.[Number of Searches] DESC;
