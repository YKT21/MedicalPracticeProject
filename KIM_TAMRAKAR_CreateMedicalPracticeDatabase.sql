
-- Part 1

CREATE DATABASE MedicalPractice
GO

USE MedicalPractice
GO


--PractitionerType Table
CREATE TABLE PractitionerType(
TypeID int primary key,
PractitionerType nvarchar(50)
)


--TestType
CREATE TABLE TestType(
TestID int primary key,
Code varchar(10),
Name nvarchar(50),
Description nvarchar(250),
)


--Create the Practitioner Table
CREATE TABLE Practitioner(
PractitionerID int primary key,
Title varchar(5),
FName nvarchar(30),
MInitial nchar(1),
LName nvarchar(30),
HouseNo nchar(8),
Street nvarchar(50),
Suburb nvarchar(30),
State nchar(3),
Postcode smallint,
HomePhone nvarchar(10),
Mobile nvarchar(10),
Medicare nvarchar(20),
MRN nvarchar(20) not null,
DOB date not null,
Gender nchar(6),
TypeID int foreign key references PractitionerType
)


--Weekday Table
CREATE TABLE Weekday(
DayID int primary key,
Dayoftheweek varchar(10)
)


--Availability Table
CREATE TABLE Availability(
AvaiID int primary key,
PractitionerID int foreign key references Practitioner,
DayID int foreign key references Weekday
)

--Patient table
CREATE TABLE Patient(
PatientID int primary key,
Title varchar(6),
FName nvarchar(30),
MInitial nchar(1),
LName nvarchar(30),
HouseNo nchar(8),
Street nvarchar(50),
Suburb nvarchar(30),
State nchar(3),
Postcode int,
HomePhone nvarchar(10),
Mobile nvarchar(10),
Medicare nvarchar(20),
DOB date not null,
Gender nchar(6),
)

-- Create the Appointment Table
CREATE TABLE Appointment(
AppID int primary key,
Date date,
TimeSlot time,
PractitionerID int foreign key references Practitioner,
PatientID int foreign key references Patient
)


--Create the Pathology Table
CREATE TABLE Pathology(
PathID int primary key, 
PractitionerID int foreign key references Practitioner,
RequestDate date,
RequestTime time,
PatientID int foreign key references Patient,
TestID int foreign key references TestType)



INSERT INTO PractitionerType 
Values(1,'Diagnostic radiographer'),
(2,'Enrolled nurse'),
(3,'Medical Practitioner (Doctor or GP)'),
(4,'Medical radiation practitioner'),
(5,'Midwife'),
(6,'Nurse'),
(7,'Occupational therapist'),
(8,'Optometrist'),
(9,'Osteopath'),
(10,'Physical therapist'),
(11,'Physiotherapist'),
(12,'Podiatrist'),
(13,'Psychologist'),
(14,'Radiation therapist'),
(15,'Registered nurse')


INSERT INTO Practitioner
Values(10000,'Dr','Mark','P','Huston','21', 'Fuller Street', 'Sunshine', 'NSW',2342,'0287657483','0476352638','9878986473892753','63738276173','1975-07-07','male',3),
(10001,'Mrs', 'Hilda','D','Brown','32', 'Argyle Street', 'Bonnels Bay', 'NSW',2264,'0249756544','0318466453','4635278435099921','37876273849','1993-12-03','female',15),
(10002,'Mrs','Jennifer','J','Dunsworth','45','Dora Street','Morriset', 'NSW',2264,'0249767574','0228484373','7666777833449876','48372678939','1991-06-04','female',15),
(10003,'Mr','Jason','D','Lithdon','43','Fowler Street','Camperdown','NSW',2050,'0298785645','0317896453','0487736265377777','12345678901','1989-08-09', 'male',6),
(10004, 'Ms', 'Paula', 'D', 'Yates','89', 'Tableton Road','Newtown', 'NSW',2051,'0289876432','0938473625','6637474433222881','84763892834', '1982-09-07','female',5),
(10005, 'Dr', 'Ludo', 'V', 'Vergenargen','27', 'Pembleton Place', 'Redfern', 'NSW',	2049,'9383737627','8372727283','8484737626278884','84737626673','1986-05-15','male',3),
(10006,	'Dr', 'Anne', 'D', 'Funsworth', '4/89','Pacific Highway', 'St Leonards','NSW',2984,'8847362839','8372688949','8477666525173738','36271663788','1991-12-11','female',13),
(10007,	'Mrs', 'Leslie', 'V', 'Gray','98', 'Dandaraga Road','Mirrabooka', 'NSW',2264,'4736728288','4837726789','4847473737277276','05958474636','1989-03-11','female',12),
(10008,	'Dr', 'Adam','J', 'Moody','35', 'Mullabinga Way', 'Brightwaters', 'NSW',2264,'8476635678','2736352536','7473636527771183','63635245256','1990-09-23','male',3),
(10009,	'Mr', 'Leslie', 'Y'	,'Gray'	, '3', 'Dorwington Place', 'Enmore', 'NSW',	 2048,'8473763678','4484837289','3827284716390987','38277121234','1991-04-11','male',6)


INSERT INTO Weekday
values(1,'Monday'),
(2,'Tuesday'),
(3,'Wednesday'),
(4,'Thursday'),
(5,'Friday')


INSERT INTO Availability
Values(1,10000,	5),
(2,10000, 1), 
(3,10000, 3),	 
(4,10001, 4),	
(5,10001, 2),	
(6,10002, 4),	
(7,10002, 2),	
(8,10003,5),	
(9,10003,1),	
(10,10003,3),	 
(11, 10004, 5),	 
(12,10004,1),
(13, 10005, 4),
(14,10005,2),
(15,10006,3),
(16,10007, 4),
(17,10007,2),
(18,10008,5),
(19,10008,1),
(20,10008,3)



INSERT INTO Patient
Values (10000,'Mr', 'Mackenzie', 'J', 'Fleetwood','233', 'Dreaming Street', 'Roseville', 'NSW',2069,'0298654743', '0465375486', '7253418356478253', '2000-03-12', 'male'),
(10001, 'Ms', 'Jane','P', 'Killingsworth','34',	 'Southern Road', 'Yarramundi', 'NSW',2753, '0234654345','0342134679', '9365243640183640', '1943-04-08', 'female'),
(10002, 'Mr', 'Peter','D', 'Leons','21','Constitution Drive','West Hoxton','NSW', 2171, '0276539183', '0125364927', '1873652945578932', '1962-07-08', 'male'),
(10003, 'Mr', 'Phill','B', 'Greggan','42','Donn Lane','Killara','NSW', 2071,'0276548709','1234326789','6473645782345678','1971-08-31', 'male'),
(10004, 'Dr', 'John', 'W','Ward','332','Tomorrow Road','Chatswood','NSW', 2488, '4847383848','4838382728', '4738294848484838', '1978-02-12', 'male'),
(10005, 'Mrs','Mary','D','Brown','Lot23','Johnston Road','Warwick Farm','NSW',2170,'0297465243','0417335224','9356273321176546','1972-03-05','female'),
(10006,	'Mr', 'Terrence', 'D','Hill','43','Somerland Road','La Perouse','NSW',2987,'0266645432','0365243561', '6363525353535356','2005-10-04','male'),
(10007,'Master','Adrian','B','Tamerkand','44','The Hill Road','Macquarie Fields','NSW',2756,'0276546783','4848473738','9863652527637332','2008-12-12','male'),
(10008, 'Ms','Joan','D','Wothers','32','Slapping Street','Mount Lewis','NSW',2343,'1294848777','8484737384','9484746125364765','1997-06-12','female'),
(10009,'Mrs','Caroline','J','Barrette','44','Biggramham Road','St Kilda','VIC',4332,'0384736278','9383827373','1234565725463728','1965-04-04','female'),
(10010,'Mrs','Wendy','J','Pilington','182','Parramatta Road','Lidcombe','NSW',2345,'4837383848','8473838383','8483727616273838','1985-09-17','female')



INSERT INTO Appointment
Values(1, '2019-09-17', '08:15:00',10005,10000),
(2,'2019-09-18','10:00:00',10006,10000),
(3, '2019-09-18','10:15:00',10006,10000),
(4,'2019-09-18', '10:30:00',10006,10000),
(5,'2019-09-18','10:45:00',10006,10000),
(6,'2019-09-18', '11:00:00',10006,10000),
(7,'2019-09-17', '09:00:00',10005,10002),
(8,'2019-09-18', '08:00:00',10000,10003),
(9,'2019-09-17', '08:30:00',10005,10005),
(10,'2019-09-18', '08:30:00',10000,10005),
(11,'2019-09-17', '14:15:00',10005,	10006),
(12,'2019-09-18', '08:30:00',10008,	10006),
(13,'2019-09-17', '08:00:00',10005,	10008),
(14,'2019-09-17', '08:30:00',10002,	10008),
(15,'2019-09-18', '08:00:00',10005,	10008),
(16,'2019-09-17', '10:00:00',10005,	10009),
(17,'2019-09-17', '08:00:00',10001,	10010),
(18,'2019-09-17', '10:15:00',10005,	10010),
(19,'2019-09-18','08:00:00',10008,10010),
(20,'2019-09-18', '09:30:00',10006,10010)




INSERT INTO TestType
values(1,'CPEP', 'C Peptide','C-Peptide; CPEP'),	
(2,'ECH', 'Echis Time', 'Ecarin time'),	
(3,'ENT', 'Ear Nose Throat Eye Swab', 'includes gram stain (except throat swab) and bacterial culture. Contact screening for Corynebacterium'),
(4,'HLYSN', 'ABO', 'Haemolysins (serum)'),	
(5,'IMISC', 'Paraneoplastic', 'Paraneoplastic Pemphigus Antibodies [NOTE: Authorisation required from an Immunopathologist]'),
(6,'MOLINT', 'Deafness', 'Autosomal Recessive Complete GJB2 Gene Sequencing Analysis Connexin 26; CX26; CXB2; Recessive Autosomal Deafness; Autosomal Deafness; Hereditary Deafness; GJB2; DFNB1; Nonsyndromic Neurosensory Deafness; Neurosensory Deafness Type I'),
(7,'RAST', 'Radioallergosorbent Test', 'RAST; IgE RAST; Allergen Screen; Radioimmunosorbent Assay of Allergens; Allergen-Specific IgE; Aspergillus RAST	 Specific IgE; Ig to specific allergens')


INSERT INTO Pathology
values(1,10005, '2019-09-17', '10:30:00', 10010, 4),
(2,10005, '2019-09-18', '08:15:00',10008, 7),
(3,10006, '2019-09-18', '10:30:00',10000, 4),
(4,10008, '2019-09-18', '08:15:00',10010, 5)


--Part 2
--1.	List the first name and last name of female patients who live in St Kilda or Lidcombe.
SELECT FName as FirstName, LName as LastName
FROM Patient
WHERE Gender = 'Female'
AND Suburb = 'St Kilda'
OR(Suburb = 'Lidcombe')


--2.	List the first name, last name, state and Medicare Number of any patients who do not live in NSW.
SELECT FName AS FirstName, LName as LastName, State, Medicare
FROM Patient
WHERE State != 'NSW'



--3.	For patients who have had pathology test requests, list the practitioner's and patient's first and last names, 
--the date and time that the pathology tests were ordered and the name of the pathology test.
SELECT P.FName AS PatientFName, P.LName AS PatientLName, D.FName AS PractitionerFName, D.LName AS PractitionerLName, R.RequestDate, R.RequestTime, T.Name
FROM Patient P, Practitioner D , Pathology R, TestType T 
WHERE P.PatientID = R.PatientID
AND D.PractitionerID = R.PractitionerID
AND R.TestCode = T.Code


--4.	List the Patient's first name, last name and the appointment date and time, for all appointments held on the 18/09/2019 by Dr Anne Funsworth.
SELECT P.FName, P.LName, A.Date AS AppointmentDate, A.TimeSlot AS AppointmentTime
FROM Patient P, Practitioner D, Appointment A
WHERE P.PatientID = A.PatientID
AND D.PractitionerID = A.PractitionerID
AND A.Date = '2019-09-18'
AND D.FName = 'Anne'
AND D.LName = 'Funsworth'


--5.	List each Patient's first name, last name, Medicare Number and their date of birth. Sort the list by date of birth, listing the youngest patients first.
SELECT FName, LName, Medicare, DOB
FROM Patient
ORDER BY DOB DESC


--6.	List the ID and date of birth of any patient who has not had an appointment and was born before 1950.
SELECT PatientID, DOB 
FROM Patient WHERE YEAR(DOB) <1950
AND PatientID NOT IN (SELECT DISTINCT PatientID FROM Appointment)


--7.	List the patient ID, last name and date of birth of all male patients born between 1962 and 1973 (inclusive).
SELECT PatientID, LName, DOB
FROM Patient
WHERE YEAR(DOB) BETWEEN '1962'AND'1973' 
AND Gender = 'male'


--8.	List the patient ID, first name and last name of any male patients who have had appointments with either Dr Huston or Dr Vergenargen.
SELECT P.PatientID, P.FName, P.LName
FROM Patient P, Appointment A
WHERE P.PatientID = A.PatientID
AND P.Gender = 'male'
AND A.PractitionerID IN (SELECT PractitionerID FROM Practitioner WHERE LName = 'Vergenargen' OR (LName = 'Huston'))


--9.	List the practitioner ID, first name, last name and practitioner type of each practitioner, and the number of days of the week that they're available.
SELECT COUNT (D.PractitionerID) AS NumberOfDaysAvailable ,D.FName, D.LName, T.PractitionerType
FROM Practitioner D, PractitionerType T, Availability A
WHERE D.TypeID = T.TypeID
AND D.PractitionerID = A.PractitionerID
GROUP BY D.PractitionerID, D.FName, D.LName, T.PractitionerType


--10.	List the patient ID, first name, last name and the number of appointments for patients who have had at least three appointments.
SELECT A.PatientID, P.FName, P.LName,
COUNT (A.PatientID) AS NumberOfAppointment 
FROM Patient P, Appointment A
WHERE P.PatientID =A.PatientID 
GROUP  BY A.PatientID, P.FName, P.LName
HAVING COUNT(A.PatientID)>=3


--11.	List the first name, last name, gender, and the number of days since the last appointment of each patient and the 23/09/2019.
SELECT DISTINCT P.FName, P.LName, P.Gender, DATEDIFF(DAY, DATE ,'09/23/2019') AS DayDifferent
FROM Appointment A, Patient P
WHERE P.PatientID = A.PatientID


--12.	For each practitioner, list their ID, first name, last name and the total number of hours worked each week at the Medical Practice.
--Assume a nine-hour working day and that practitioners work the full nine hours on each day that they're available.
SELECT D.PractitionerID, D.FName, D.LName, COUNT(A.PractitionerID)*9 AS TotalHourWork
FROM Practitioner D, PractitionerType T, Availability A
WHERE D.TypeID = T.TypeID
AND D.PractitionerID = A.PractitionerID
GROUP BY D.PractitionerID, D.FName, D.LName



--13.	List the full name and full address of each practitioner in the following format exactly. Dr Mark P. Huston. 21 Fuller Street SUNSHINE, NSW 2343
--Make sure you include the punctuation and the suburb in upper case.
SELECT CONCAT(Title,' ', FName , ' ' , MInitial, '.' , ' ',  LName, '.', ' ', HouseNo, Street,'  ',  UPPER(Suburb), ',', ' ', State, ' ', Postcode)
AS FullNameAndAddress
FROM Practitioner


--14.	List the date of birth of the male practitioner named Leslie Gray in the following format exactly:
--Saturday, 11 March 1989
SELECT FORMAT (DOB,'D')
FROM Practitioner
WHERE FName = 'Leslie'
AND LName = 'Gray'
AND Gender = 'male'


--15.	List the patient id, first name, last name and date of birth of the fifth oldest patient(s).
SELECT TOP 1 PatientID, FName, LName, DOB 
FROM (SELECT TOP 5 PatientID, FName, LName, DOB FROM Patient ORDER BY DOB ASC) RESULT
ORDER BY DOB DESC



--16.	List the patient ID, first name, last name, appointment date (in the format 'Tuesday 17 September, 2019') 
--and appointment time (in the format '14:15 PM') for all patients who have had appointments on any Tuesday after 10:00 AM.
SELECT P.PatientID, P.FName, P.LName, FORMAT (A.Date,'D') AS AppointmentDate, CONVERT(varchar(15), CAST(TimeSlot AS time), 100) AS AppointmentTime
FROM Patient P, Appointment A
WHERE P.PatientID =A.PatientID
AND FORMAT (A.Date,'D') like 'Tuesday%'
and TimeSlot > '10:00:00'


--17.	Calculate and list the number of hours and minutes between Joan Wothers' 8:00 AM appointment on 17/09/2019 and Terrence Hill's 2:15 PM appointment on that same day with Dr Ludo Vergenargen. 
SELECT P.FName, P.LName, a.TimeSlot, A.Date, D.FName,D.LName
FROM Patient P, Appointment A, Practitioner D
WHERE P.PatientID = A.PatientID
AND A.PractitionerID = d.PractitionerID
AND D.FName = 'Ludo'
AND D.LName ='Vergenargen'
AND A.Date = '2019-09-17'
ORDER BY TimeSlot


--18.	List the age difference in years between the youngest patient and the oldest patient.

SELECT DOB
FROM Patient
ORDER BY DOB 

SELECT DISTINCT DATEDIFF(YEAR,(SELECT TOP 1 DOB FROM Patient ORDER BY DOB),(SELECT TOP 1 DOB FROM Patient ORDER BY DOB DESC)) as AgeDiff
FROM Patient


