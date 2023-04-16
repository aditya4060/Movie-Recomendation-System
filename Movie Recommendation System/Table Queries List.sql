create schema movie_recommendation_system;
use movie_recommendation_system;

-- Creating table Movie with M_ID as primary key
create table Movie ( 
M_ID char(5), 
Movie_name char(50), 
Release_date date, 
Duration int, 
Language_ID char(5), 
Genre_ID char(5), 
Site_name char(50), 
primary key(M_ID)
);

-- Creating table Language with Language_ID as primary key
create table Language (
Language_ID char(5),
Language_name char(50),
primary key(Language_ID)
);

-- Creating table IMDB with Rating between 0 to 5
create table IMDB (
M_ID char(5) not NULL,
Rating int,
CHECK (Rating >= 0 && Rating <11)
); 

-- Creating table Genre with Genre_ID as primary key
create table Genre (
Genre_ID char(5) not NULL,
Genre_name char(50),
primary key (Genre_ID)
);

-- altering table IMDB with M_ID as foreign key referencing to Movie and Genre_ID referencing to Genre and Language_ID referencing to Language
ALTER TABLE IMDB ADD FOREIGN KEY (M_ID) REFERENCES Movie(M_ID);
ALTER TABLE Movie ADD FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID);
ALTER TABLE Movie ADD FOREIGN KEY (Language_ID) REFERENCES Language(Language_ID);

-- Creating table Person with P_ID as foreign key
create table Person (
P_ID char(5),
First_name char(50) not NULL,
Middle_name char(50),
Last_name char(50) not NULL,
Sex char(10) not NULL,
check (Sex = "Male" || Sex = "Female" || Sex = "Other"),
DOB date not NULL,
Age int
);

-- Altering the table Person with P_ID as primary key
ALTER TABLE Person ADD PRIMARY KEY (P_ID);

-- Creating table Moviecast with P_ID as primary key and Directed, Acted, Produced as Boolean
create table Moviecast (
P_ID char(5),
M_ID char(5),
Directed boolean,
Acted boolean,
Produced boolean,
PRIMARY KEY (P_ID)
);

-- Altering the table Moviecast with M_ID as foreign key referencing to Movie and P_ID as foreign key referencing to Person
ALTER TABLE Moviecast ADD FOREIGN KEY (M_ID) REFERENCES Movie(M_ID);
ALTER TABLE Moviecast ADD FOREIGN KEY (P_ID) REFERENCES Person(P_ID);

-- Creating table User with P_ID as primary key and foreign key referencing to person, User_name as Unique and password with lenght greater than 7
create table User (
P_ID char(5) not NULL,
User_name char(50) not NULL Unique,
Password char(50),
check (char_length(User.Password) >7),
primary key (P_ID),
foreign key (P_ID) references person(P_ID)
);

insert into OTT_Platform values
('O0001', 'Netflix'),
('O0002', 'Amazon Prime Videos'),
('O0003', 'Disney + Hotstar'),
('O0004', 'Jio Cinema'),
('O0005', 'Sony Liv'),
('O0006', 'Hulu'),
('O0007', 'ALT Balaji'),
('O0008', 'Voot');

insert into Language values
('L0001','English'),
('L0002','Hindi'),
('L0003','Kannada'),
('L0004','Telugu'),
('L0005','Tamil'),
('L0006','Spanish'),
('L0007','French'),
('L0008','Italian'),
('L0009','Korean'),
('L0010','Bengali'),
('L0011','Punjabi');

insert into Genre values
('G0001','Rom-Com'),
('G0002','Romance'),
('G0003','Comedy'),
('G0004','Horror'),
('G0005','Action'),
('G0006','Thriller'),
('G0007','Science-Fiction'),
('G0008','Mystrey'),
('G0009','Drama'),
('G0010', 'Biopic'),
('G0011','Documentary'),
('G0012','Fantasy');

insert into Movie values
('M0001', '3 Idiots','20091225', 170, 'L0002','G0003', 'Amazon Prime, Netflix'),
('M0002', 'Dil Dhadakne Do', '20150605', 170, 'L0002','G0003', 'Amazon Prime, Netflix'),
('M0003', 'Dangal','20161221', 161, 'L0002','G0010', 'Youtube'),
('M0004', 'RRR','20220325', 187, 'L0004','G0005', 'Netflix'),
('M0005', 'Elephant Whispers','20221208', 41, 'L0005','G0011', 'Netflix'),
('M0006', 'Black Adam','20091021', 125, 'L0001','G0007', 'Amazon Prime'),
('M0007', 'Purple Hearts','20220729', 162, 'L0001','G0002', 'Netflix'),
('M0008', 'Hamilton','20200703', 160, 'L0001','G0003', 'Hotstar'),
('M0009', 'Tenet','20200903', 150, 'L0001','G0005', 'Amazon Prime'),
('M0010', 'The Perfect Date','20190412', 89, 'L0001','G0001', 'Netflix');

insert into Movie values
('M0011', 'Intestellar','20141107', 169, 'L0001','G0007', 'Amazon Prime, Netflix'),
('M0012', 'Drishyam','20150721', 163, 'L0002','G0006', 'Netflix, Disney+Hotstar');

insert into IMDB values
('M0001', 8.4),
('M0002', 7.0),
('M0003', 8.3),
('M0004', 7.8),
('M0005', 7.5),
('M0006', 6.3),
('M0007', 6.7),
('M0008', 8.3),
('M0009', 8.1),
('M0010', 5.8);

insert into IMDB values
('M0011', 8.6),
('M0012', 8.2);

insert into Person values
('P0001', 'Priyanka', NULL, 'Chopra', 'Female', '19820718', 44),
('P0002', 'Ranveer', NULL, 'Singh', 'Male', '19850706', 37),
('P0003', 'Farhan', NULL, 'Akhtar', 'Male', '19740109', 49),
('P0004', 'Anil', NULL, 'Kapoor', 'Male', '19591204', 63),
('P0005', 'Aamir', NULL, 'Khan', 'Male', '19650514', 58),
('P0006', 'Kareena', NULL, 'Kapoor', 'Female', '19800921', 42),
('P0007', 'Sakshi', NULL, 'Tanwar', 'Female', '19730112', 40),
('P0008', 'Sanya', NULL, 'Malhotra', 'Female', '19920225', 31),
('P0009', 'NT', 'Rama', 'Rao', 'Male', '19830520', 37),
('P0010', 'Ram', NULL, 'Charan', 'Male', '19850327', 37),
('P0011', 'Ajay', NULL, 'Devgn', 'Male', '19690402', 54 ),
('P0012', 'Alia', NULL, 'Bhatt', 'Female', '19930315', 30),
('P0013', 'Dwayne', NULL, 'Johnsons', 'Male', '19720502', 40),
('P0014', 'Aldis', NULL, 'Hodge', 'Male', '19860920', 37),
('P0015', 'Pierce', NULL, 'Brosnan', 'Male', '19530516', 69),
('P0016', 'Noah', NULL, 'Centineo', 'Male', '19960509', 44),
('P0017', 'Sarah', NULL, 'Shahi', 'Female', '19800110', 43),
('P0018', 'Pierce', NULL, 'Brosnan', 'Male', '19820718', 40),
('P0019', 'Sofia', NULL, 'Carson', 'Female', '19930410', 30),
('P0020', 'Nicholas', NULL, 'Galitzine', 'Male', '19940929', 28),
('P0021', 'Chosan', NULL, 'Jacobs', 'Male', '20010701', 20),
('P0022', 'Lin-Manuel ', NULL, 'Miranda', 'Male', '19800116', 43),
('P0023', 'Leslie', NULL, 'Odom', 'Male', '19810806', 41),
('P0024', 'Phillipa', NULL, 'Soo', 'Female', '19900531', 33),
('P0025', 'Leslie', NULL, 'Odom', 'Male', '19820718', 40),
('P0026', 'Renée', 'Elise', 'Goldsberry', 'Female', '19710102', 51),
('P0027', 'John', 'David', 'Washington', 'Male', '19840728', 39),  
('P0028', 'Robert', NULL, 'Pattinson', 'Male', '19860513', 37),
('P0029', 'Elizabeth', NULL, 'Debicki', 'Female', '19900824', 32),
('P0030', 'Laura', NULL, 'Marano', 'Female', '19951129', 26),
('P0031', 'Camila', NULL, 'Mendes', 'Female', '19940625', 28);

insert into Person values
('P0032', 'Shriya', NULL, 'Saran', 'Female', '19820911', 40),
('P0033', 'Tabu', 'Fatima', 'Hashmi' , 'Female', '19701104', 52),
('P0034', 'Nishikant', NULL, 'Kamat', 'Male', '19700617', 50),
('P0035', 'Christopher', NULL, 'Nolan', 'Male', '19700730', 52),
('P0036', 'Anne', NULL, 'Hatheway', 'Female', '19821112', 40),
('P0037', 'Matthew', NULL, 'McCounghey', 'Male', '19691104', 53),
('P0038', 'Jessica', NULL, 'Chastain', 'Female', '19770324', 46);

-- MOVIECAST
insert into Moviecast values
('P0001','M0001',false, true, false);
insert into Moviecast values
('P0002','M0002',false, true, false);
insert into Moviecast values
('P0003','M0002',false, true, false);
insert into Moviecast values
('P0004','M0002',false, true, false);
insert into Moviecast values
('P0005','M0001',false, true, false);
insert into Moviecast values
('P0006','M0001',false, true, false);
insert into Moviecast values
('P0007','M0003',false, true, false);
insert into Moviecast values
('P0008','M0003',false, true, false);
insert into Moviecast values
('P0009','M0004',false, true, false);
insert into Moviecast values
('P0010','M0004',false, true, false);
insert into Moviecast values
('P0011','M0004',false, true, false);
insert into Moviecast values
('P0012','M0004',false, true, false);
insert into Moviecast values
('P0013','M0006',false, true, false);
insert into Moviecast values
('P0014','M0006',false, true, false);
insert into Moviecast values
('P0015','M0006',false, true, false);
insert into Moviecast values
('P0016','M0006',false, true, false);
insert into Moviecast values
('P0017','M0006',false, true, false);
insert into Moviecast values
('P0018','M0006',false, true, false);
insert into Moviecast values
('P0019','M0007',false, true, false);
insert into Moviecast values
('P0020','M0007',false, true, false);
insert into Moviecast values
('P0021','M0007',false, true, false);
insert into Moviecast values
('P0022','M0006',false, true, false);
insert into Moviecast values
('P0023','M0008',false, true, false);
insert into Moviecast values
('P0024','M0008',false, true, false);
insert into Moviecast values
('P0025','M0008',false, true, false);
insert into Moviecast values
('P0026','M0008',false, true, false);
insert into Moviecast values
('P0027','M0009',false, true, false);
insert into Moviecast values
('P0028','M0009',false, true, false);
insert into Moviecast values
('P0029','M0009',false, true, false);
insert into Moviecast values
('P0030','M0010',false, true, false);
insert into Moviecast values
('P0031','M0010',false, true, false);
insert into Moviecast values
('P0032','M0012',false, true, false);
insert into Moviecast values
('P0033','M0012',false, true, false);
insert into Moviecast values
('P0034','M0012',true , true, false);
insert into Moviecast values
('P0035','M0011',true, false, false);
insert into Moviecast values
('P0036','M0011',false, true, false);
insert into Moviecast values
('P0037','M0011',false, true, false);
insert into Moviecast values
('P0038','M0011',false, true, false);