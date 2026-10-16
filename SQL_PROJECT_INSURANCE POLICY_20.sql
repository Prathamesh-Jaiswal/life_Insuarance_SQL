Create Database LIC;
use LIC;

CREATE TABLE Policies (
    Policy_ID INT PRIMARY KEY,
    Policy_Name VARCHAR(100) NOT NULL,
    Policy_Type VARCHAR(50) NOT NULL,
    Coverage_Amount DECIMAL(12,2) NOT NULL,
    Premium_Amount DECIMAL(10,2) NOT NULL,
    Policy_Term INT NOT NULL
);
desc Policies;

CREATE TABLE Agents (
    Agent_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Branch VARCHAR(100) NOT NULL
);
desc Agents;

CREATE TABLE Policy_Holders (
    Policy_Holder_ID INT PRIMARY KEY,
    Policy_ID INT NOT NULL,
    Agent_ID INT NOT NULL,
    Holder_First_Name VARCHAR(50) NOT NULL,
    Holder_Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address VARCHAR(255),
    DOB DATE,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Policy_ID) REFERENCES Policies(Policy_ID),
    FOREIGN KEY (Agent_ID) REFERENCES Agents(Agent_ID)
);

desc Policy_Holders;

CREATE TABLE Premium_Payments (
    Payment_ID INT PRIMARY KEY,
    Policy_Holder_ID INT NOT NULL,
    Payment_Date DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Method VARCHAR(30) NOT NULL,
    FOREIGN KEY (Policy_Holder_ID) REFERENCES Policy_Holders(Policy_Holder_ID)
);
desc Premium_Payments;

CREATE TABLE Claims (
    Claim_ID INT PRIMARY KEY,
    Policy_Holder_ID INT NOT NULL,
    Claim_Date DATE NOT NULL,
    Claim_Amount DECIMAL(12,2) NOT NULL,
    Claim_Status VARCHAR(30) NOT NULL,
    Description VARCHAR(255),
    FOREIGN KEY (Policy_Holder_ID) REFERENCES Policy_Holders(Policy_Holder_ID)
);
desc Claims;

INSERT INTO Policies (Policy_ID, Policy_Name, Policy_Type, Coverage_Amount, Premium_Amount, Policy_Term) VALUES
(101, 'Life Secure Plan', 'Life', 1000000.00, 12000.00, 20),
(102, 'Health Shield', 'Health', 500000.00, 8000.00, 10),
(103, 'Car Protect Plus', 'Motor', 700000.00, 15000.00, 5),
(104, 'Home Safe Cover', 'Home', 1500000.00, 10000.00, 15),
(105, 'Travel Care', 'Travel', 300000.00, 2500.00, 1),
(106, 'Family Health Plan', 'Health', 1000000.00, 18000.00, 15),
(107, 'Child Future Plan', 'Life', 2000000.00, 22000.00, 25),
(108, 'Bike Secure', 'Motor', 150000.00, 3000.00, 3),
(109, 'Senior Citizen Health', 'Health', 400000.00, 12000.00, 10),
(110, 'Business Protection', 'Commercial', 5000000.00, 50000.00, 10),
(111, 'Term Life Basic', 'Life', 2500000.00, 15000.00, 30),
(112, 'Gold Health Plan', 'Health', 750000.00, 14000.00, 12),
(113, 'Premium Car Cover', 'Motor', 1200000.00, 22000.00, 5),
(114, 'Home Premium', 'Home', 2500000.00, 18000.00, 20),
(115, 'International Travel', 'Travel', 1000000.00, 5000.00, 1),
(116, 'Critical Illness Plan', 'Health', 1500000.00, 25000.00, 20),
(117, 'Retirement Secure', 'Life', 3000000.00, 28000.00, 30),
(118, 'Commercial Vehicle', 'Motor', 2500000.00, 35000.00, 7),
(119, 'Office Insurance', 'Commercial', 4000000.00, 42000.00, 15),
(120, 'Accident Protection', 'Personal Accident', 1000000.00, 6000.00, 10);

select*from Policies; 

INSERT INTO Agents (Agent_ID, First_Name, Last_Name, Email, Phone, Branch) VALUES
(201, 'Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876543210', 'Mumbai'),
(202, 'Priya', 'Patel', 'priya.patel@gmail.com', '9876543211', 'Pune'),
(203, 'Amit', 'Verma', 'amit.verma@gmail.com', '9876543212', 'Nagpur'),
(204, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876543213', 'Nashik'),
(205, 'Rohan', 'Gupta', 'rohan.gupta@gmail.com', '9876543214', 'Thane'),
(206, 'Neha', 'Mehta', 'neha.mehta@gmail.com', '9876543215', 'Aurangabad'),
(207, 'Vikas', 'Singh', 'vikas.singh@gmail.com', '9876543216', 'Kolhapur'),
(208, 'Pooja', 'Yadav', 'pooja.yadav@gmail.com', '9876543217', 'Solapur'),
(209, 'Karan', 'Mishra', 'karan.mishra@gmail.com', '9876543218', 'Amravati'),
(210, 'Anjali', 'Kulkarni', 'anjali.kulkarni@gmail.com', '9876543219', 'Satara'),
(211, 'Suresh', 'Naik', 'suresh.naik@gmail.com', '9876543220', 'Sangli'),
(212, 'Meena', 'Chavan', 'meena.chavan@gmail.com', '9876543221', 'Ratnagiri'),
(213, 'Arjun', 'Deshmukh', 'arjun.deshmukh@gmail.com', '9876543222', 'Jalgaon'),
(214, 'Kavita', 'Rao', 'kavita.rao@gmail.com', '9876543223', 'Ahmednagar'),
(215, 'Nikhil', 'Sawant', 'nikhil.sawant@gmail.com', '9876543224', 'Latur'),
(216, 'Deepa', 'Iyer', 'deepa.iyer@gmail.com', '9876543225', 'Akola'),
(217, 'Manoj', 'Pawar', 'manoj.pawar@gmail.com', '9876543226', 'Nanded'),
(218, 'Swati', 'Jadhav', 'swati.jadhav@gmail.com', '9876543227', 'Chandrapur'),
(219, 'Ajay', 'Bhosale', 'ajay.bhosale@gmail.com', '9876543228', 'Dhule'),
(220, 'Ritika', 'Shinde', 'ritika.shinde@gmail.com', '9876543229', 'Mumbai');

select*from Agents;

INSERT INTO Policy_Holders
(Policy_Holder_ID, Policy_ID, Agent_ID, Holder_First_Name, Holder_Last_Name, Email, Phone, Address, DOB, Start_Date, End_Date, Status)
VALUES
(301, 101, 201, 'Aarav', 'Patil', 'aarav.patil@gmail.com', '9123456701', 'Mumbai, Maharashtra', '1990-05-14', '2025-01-01', '2045-01-01', 'Active'),

(302, 102, 202, 'Diya', 'Shah', 'diya.shah@gmail.com', '9123456702', 'Pune, Maharashtra', '1995-08-20', '2025-02-10', '2035-02-10', 'Active'),

(303, 103, 203, 'Vihaan', 'Joshi', 'vihaan.joshi@gmail.com', '9123456703', 'Nagpur, Maharashtra', '1988-11-09', '2025-03-15', '2030-03-15', 'Active'),

(304, 104, 204, 'Ananya', 'Kulkarni', 'ananya.kulkarni@gmail.com', '9123456704', 'Nashik, Maharashtra', '1992-01-18', '2025-04-01', '2040-04-01', 'Active'),

(305, 105, 205, 'Aditya', 'Mehta', 'aditya.mehta@gmail.com', '9123456705', 'Thane, Maharashtra', '1997-07-30', '2025-05-12', '2026-05-12', 'Active'),

(306, 106, 206, 'Ishita', 'Gupta', 'ishita.gupta@gmail.com', '9123456706', 'Aurangabad, Maharashtra', '1991-12-25', '2025-06-20', '2040-06-20', 'Active'),

(307, 107, 207, 'Krishna', 'Yadav', 'krishna.yadav@gmail.com', '9123456707', 'Kolhapur, Maharashtra', '1989-09-05', '2025-07-01', '2050-07-01', 'Active'),

(308, 108, 208, 'Meera', 'Singh', 'meera.singh@gmail.com', '9123456708', 'Solapur, Maharashtra', '1996-03-22', '2025-08-10', '2028-08-10', 'Active'),

(309, 109, 209, 'Arjun', 'Nair', 'arjun.nair@gmail.com', '9123456709', 'Amravati, Maharashtra', '1985-06-17', '2025-09-05', '2035-09-05', 'Active'),

(310, 110, 210, 'Sneha', 'Rao', 'sneha.rao@gmail.com', '9123456710', 'Satara, Maharashtra', '1993-10-12', '2025-10-01', '2035-10-01', 'Active'),

(311, 111, 211, 'Rohan', 'Deshmukh', 'rohan.deshmukh@gmail.com', '9123456711', 'Sangli, Maharashtra', '1994-02-14', '2025-11-11', '2055-11-11', 'Active'),

(312, 112, 212, 'Pooja', 'Chavan', 'pooja.chavan@gmail.com', '9123456712', 'Ratnagiri, Maharashtra', '1987-04-08', '2025-12-01', '2037-12-01', 'Active'),

(313, 113, 213, 'Kunal', 'Pawar', 'kunal.pawar@gmail.com', '9123456713', 'Jalgaon, Maharashtra', '1990-07-19', '2026-01-15', '2031-01-15', 'Active'),

(314, 114, 214, 'Neha', 'Jadhav', 'neha.jadhav@gmail.com', '9123456714', 'Ahmednagar, Maharashtra', '1998-05-10', '2026-02-20', '2046-02-20', 'Active'),

(315, 115, 215, 'Siddharth', 'Patel', 'siddharth.patel@gmail.com', '9123456715', 'Latur, Maharashtra', '1999-09-09', '2026-03-12', '2027-03-12', 'Active'),

(316, 116, 216, 'Riya', 'Bhosale', 'riya.bhosale@gmail.com', '9123456716', 'Akola, Maharashtra', '1992-11-30', '2026-04-18', '2046-04-18', 'Active'),

(317, 117, 217, 'Harsh', 'Mishra', 'harsh.mishra@gmail.com', '9123456717', 'Nanded, Maharashtra', '1986-08-24', '2026-05-05', '2056-05-05', 'Active'),

(318, 118, 218, 'Kavya', 'Shinde', 'kavya.shinde@gmail.com', '9123456718', 'Chandrapur, Maharashtra', '1995-12-18', '2026-06-22', '2033-06-22', 'Active'),

(319, 119, 219, 'Yash', 'More', 'yash.more@gmail.com', '9123456719', 'Dhule, Maharashtra', '1991-01-27', '2026-07-14', '2041-07-14', 'Active'),

(320, 120, 220, 'Aditi', 'Kale', 'aditi.kale@gmail.com', '9123456720', 'Mumbai, Maharashtra', '1994-06-15', '2026-08-01', '2036-08-01', 'Active');

select*from Policy_Holders;

INSERT INTO Premium_Payments (Payment_ID, Policy_Holder_ID, Payment_Date, Amount, Payment_Method) VALUES
(401, 301, '2025-01-05', 12000.00, 'UPI'),
(402, 302, '2025-02-15', 8000.00, 'Credit Card'),
(403, 303, '2025-03-20', 15000.00, 'Net Banking'),
(404, 304, '2025-04-10', 10000.00, 'Debit Card'),
(405, 305, '2025-05-18', 2500.00, 'Cash'),
(406, 306, '2025-06-25', 18000.00, 'UPI'),
(407, 307, '2025-07-08', 22000.00, 'Credit Card'),
(408, 308, '2025-08-14', 3000.00, 'Net Banking'),
(409, 309, '2025-09-09', 12000.00, 'UPI'),
(410, 310, '2025-10-12', 50000.00, 'Cheque'),
(411, 311, '2025-11-18', 15000.00, 'Debit Card'),
(412, 312, '2025-12-05', 14000.00, 'UPI'),
(413, 313, '2026-01-20', 22000.00, 'Credit Card'),
(414, 314, '2026-02-28', 18000.00, 'Net Banking'),
(415, 315, '2026-03-15', 5000.00, 'Cash'),
(416, 316, '2026-04-22', 25000.00, 'UPI'),
(417, 317, '2026-05-10', 28000.00, 'Debit Card'),
(418, 318, '2026-06-18', 35000.00, 'Credit Card'),
(419, 319, '2026-07-25', 42000.00, 'Net Banking'),
(420, 320, '2026-08-08', 6000.00, 'UPI');

select*from Premium_Payments;

INSERT INTO Claims (Claim_ID, Policy_Holder_ID, Claim_Date, Claim_Amount, Claim_Status, Description)
VALUES
(501, 301, '2026-02-15', 150000.00, 'Approved', 'Hospitalization expenses'),
(502, 302, '2026-02-20', 75000.00, 'Pending', 'Medical treatment claim'),
(503, 303, '2026-03-05', 200000.00, 'Approved', 'Car accident damage'),
(504, 304, '2026-03-10', 300000.00, 'Rejected', 'House fire damage'),
(505, 305, '2026-03-18', 50000.00, 'Approved', 'Travel baggage loss'),
(506, 306, '2026-04-02', 100000.00, 'Pending', 'Health insurance reimbursement'),
(507, 307, '2026-04-08', 250000.00, 'Approved', 'Life insurance maturity benefit'),
(508, 308, '2026-04-15', 40000.00, 'Rejected', 'Bike accident repair'),
(509, 309, '2026-04-20', 180000.00, 'Approved', 'Heart surgery expenses'),
(510, 310, '2026-05-01', 500000.00, 'Pending', 'Business property damage'),
(511, 311, '2026-05-10', 350000.00, 'Approved', 'Life insurance death benefit'),
(512, 312, '2026-05-18', 120000.00, 'Rejected', 'Critical illness claim'),
(513, 313, '2026-06-05', 275000.00, 'Approved', 'Vehicle collision repair'),
(514, 314, '2026-06-12', 600000.00, 'Pending', 'Home flood damage'),
(515, 315, '2026-06-20', 80000.00, 'Approved', 'Lost passport during travel'),
(516, 316, '2026-07-01', 220000.00, 'Approved', 'Cancer treatment expenses'),
(517, 317, '2026-07-10', 450000.00, 'Pending', 'Retirement policy claim'),
(518, 318, '2026-07-18', 150000.00, 'Rejected', 'Commercial vehicle accident'),
(519, 319, '2026-08-01', 550000.00, 'Approved', 'Office equipment damage'),
(520, 320, '2026-08-10', 90000.00, 'Pending', 'Accidental injury treatment');

select*from Claims;

-- sub query question

-- Find  the policy with the highest premium amount
SELECT *
FROM Policies
WHERE Premium_Amount = (
    SELECT MAX(Premium_Amount)
    FROM Policies
);
-- find policy holder whose policy term is more than 20 yrars
SELECT Holder_First_Name, Holder_Last_Name
FROM Policy_Holders
WHERE Policy_ID IN (
    SELECT Policy_ID
    FROM Policies
    WHERE Policy_Term > 20
);
-- find agents who mange active policy holders
SELECT *
FROM Agents
WHERE Agent_ID IN (
    SELECT Agent_ID
    FROM Policy_Holders
    WHERE Status = 'Active'
);
-- find policy holders who have made a payment above 20000
SELECT Holder_First_Name, Holder_Last_Name
FROM Policy_Holders
WHERE Policy_Holder_ID IN (
    SELECT Policy_Holder_ID
    FROM Premium_Payments
    WHERE Amount > 20000
);
-- find policy holders who have an approved claim
SELECT Holder_First_Name, Holder_Last_Name
FROM Policy_Holders
WHERE Policy_Holder_ID IN (
    SELECT Policy_Holder_ID
    FROM Claims
    WHERE Claim_Status = 'Approved'
);

-- join question 

 -- Show the Policy Holder Name and Policy Name
 SELECT ph.Holder_First_Name,
       ph.Holder_Last_Name,
       p.Policy_Name
FROM Policy_Holders ph
INNER JOIN Policies p
ON ph.Policy_ID = p.Policy_ID;

-- Show all Policy Holders and their Payment Amount
SELECT ph.Holder_First_Name,
       ph.Holder_Last_Name,
       pp.Amount
FROM Policy_Holders ph
LEFT JOIN Premium_Payments pp
ON ph.Policy_Holder_ID = pp.Policy_Holder_ID;

-- Show all Policy Holders and their Claim Status
SELECT ph.Holder_First_Name,
       ph.Holder_Last_Name,
       c.Claim_Status
FROM Policy_Holders ph
LEFT JOIN Claims c
ON ph.Policy_Holder_ID = c.Policy_Holder_ID;

-- Show all Policy Holders and their Payment Method
SELECT ph.Holder_First_Name,
       pp.Payment_Method
FROM Policy_Holders ph
LEFT JOIN Premium_Payments pp
ON ph.Policy_Holder_ID = pp.Policy_Holder_ID;

-- Show all Policy Holders with their Policy details
SELECT p.Policy_Name,
       p.Policy_Type,
       ph.Holder_First_Name,
       ph.Status
FROM Policies p
RIGHT JOIN Policy_Holders ph
ON p.Policy_ID = ph.Policy_ID;

-- Window function
-- Rank policies based on Premium Amount
SELECT Policy_Name,
       Premium_Amount,
       RANK() OVER(ORDER BY Premium_Amount DESC) AS Rank_No
FROM Policies;

-- Display the policy holder name with a row number based on the Start Date
SELECT Holder_First_Name,
       Start_Date,
       ROW_NUMBER() OVER(ORDER BY Start_Date) AS Row_No
FROM Policy_Holders;


-- view question 
-- Create a view to show all policy holder details
CREATE VIEW vw_Policy_Holders AS
SELECT Policy_Holder_ID,
       Holder_First_Name,
       Holder_Last_Name,
       Email,
       Phone,
       Status
FROM Policy_Holders;
select* from vw_Policy_Holders;

-- Create a view to show policy details
CREATE VIEW vw_Policies AS
SELECT Policy_ID,
       Policy_Name,
       Policy_Type,
       Coverage_Amount,
       Premium_Amount
FROM Policies;
select*from vw_Policies;

-- Create a view showing policies with premium amount greater than 10000.
CREATE VIEW Expensive_Policies AS
SELECT *
FROM Policies
WHERE Premium_Amount>10000;
select*from Expensive_Policies;

SELECT
    a.First_Name,
    a.Last_Name,
    ph.Holder_First_Name,
    ph.Holder_Last_Name
FROM Policy_Holders ph
RIGHT JOIN Agents a
ON ph.Agent_ID = a.Agent_ID;