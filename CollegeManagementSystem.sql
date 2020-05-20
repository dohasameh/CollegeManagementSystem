create table ADDRESS (
CountryID number( 5 )
constraint Co11PK primary key,
Country_name varchar2( 20 )
constraint Co123Un unique
not null) ;

create table City(
CityID number( 5 )
constraint Ci121PK primary key,
CountryID number( 5 )
constraint Cu42FK references ADDRESS( CountryID ) on delete cascade 
not null,
City_name varchar2( 20 )
constraint Ci323Un unique 
not null) ;

create table STD_INFO ( 
StdID number( 12 ) 
constraint stPK primary key,
FirstName varchar2( 20 ) 
not null,
LastName varchar2( 20 ) 
not null,
Gender varchar( 6 ) 
constraint geCk check( lower(Gender) in ( 'male' , 'female' ) )
not null,
Nationality varchar2( 20 )
not null,
NationalID varchar2( 14 )
constraint NAUN unique
not null,
BirthDate date 
not null,
CityID number 
constraint CiFK references City( CITYID  ) on delete cascade  
not null ) ;

create table STD_TEL(
StdID number( 12 ) 
constraint StFK references STD_INFO( STDID )on delete cascade  
not null,
Phone varchar2( 11 )
constraint PhCK check ( phone like ( '01%' ) ) 
not null );

create table DEPARTMENTS(
DepartmentID number( 2 ) 
constraint DePK primary key, 
Name varchar2( 50 ) 
not null,
NumberOfTA number( 3 ),
NumberOfSTD number( 5 ) );

create table STD_COLLEGE(
StdID number( 5 )
constraint St1PK primary key,
Year number( 2 )
constraint YeCK check( Year >= 1 and year <= 4 ),
DepartmentID number( 2 )
constraint DeFK references DEPARTMENTS( DepartmentID )on delete cascade 
not null,
Status varchar2( 20 ) ) ;

create table TEACHING_ASSISTANTS(
JobID number( 5 ) 
constraint JoPK primary key,
Title varchar2( 15 ) 
not null,
FirstName varchar2( 20 )
not null,
LastName varchar2( 20 ) 
not null,
CityID number( 5 ) 
constraint Ci1FK references City( CityID ) on delete cascade 
not null,
DepartmentID number( 2 )
constraint De2FK references DEPARTMENTS( DepartmentID ) on delete cascade 
not null,
HiringDate date 
not null );

create table OfficeHours(
JobID number( 5 )
constraint Jo122FK references TEACHING_ASSISTANTS( JobID ) on delete cascade 
not null,
Office_hours varchar2( 20 )
not null ) ;

create table TA_TEL(
JobID number( 5 ) 
constraint Jo1FK references TEACHING_ASSISTANTS( JobID ) on delete cascade 
not null,
Phone varchar2( 11 )
constraint PhCh check( phone like( '01%' ) ) 
not null);

create table TA_EMAIL(
JobID number( 5 ) 
constraint Jo2FK references TEACHING_ASSISTANTS( JobID ) on delete cascade 
not null,
EMAIL varchar2( 100 )
constraint EmCh check( EMAIL like( '%@%' ) ) 
not null);

create table SUBJECTS(
SubjectID number( 5 )
constraint SuPK primary key,
Name varchar2( 20 )
not null,
DepartmentID number( 2 )
constraint De3FK references DEPARTMENTS( DepartmentID ) on delete cascade 
not null,
NumberOfHours number( 3 )
not null
constraint Nu2CK check( NumberOfHours between 0 and 600 ),
TotalDegree number( 3 )
not null 
constraint ToCk check ( TotalDegree between 0 and 1000) ) ;

create table TEACHES(
JobID number( 5 )
constraint Jo5FK references TEACHING_ASSISTANTS( JobID ) on delete cascade 
not null,
SubjectID number( 5 ) 
constraint Su5FK references SUBJECTS(SubjectID) on delete cascade  
not null ) ;

create table TAKES(
StdID number( 12 )
constraint St4FK references STD_INFO( StdID ) on delete cascade  
not null,
SubjectID number( 5 )
constraint Su7FK references SUBJECTS( SubjectID ) on delete cascade  
not null,
Degree number( 3 )
constraint DeCK check ( Degree between 0 and 1000 ) ) ;

insert into address 
values (1,'Egypt');

insert into address 
values (2,'Syria');

insert into address 
values (3,'Kuwait');

insert into city
values(1,3,'Salmiya');

insert into city
values(2,2,'Demishq');

insert into city
values(3,1,'Tanta');

insert into city
values(4,1,'Kafr ElSheikh');

insert into std_info
values(1,'Doha','Sameh','female','egyptian',88225566997744,'23-NOV-2000',3);

insert into std_info
values(2,'Sara','Galal','female','kuwaiti','l8795634 ','11-DEC-2000',1);

insert into std_info
values(3,'Salma','Mohamed','female','syrian','p7895623 ','23-OCT-1999',2);

insert into std_tel
values(1,'01026833162');

insert into std_tel
values(2,'01091994980');

insert into std_tel
values(3,'01212177976');

insert into std_tel
values(3,'01011175476');

insert into departments
values(1,'CS',20,50);

insert into departments
values(2,'IT',20,30);

insert into departments
values(3,'IS',30,10);

insert into std_college
values (1,2,1,'passed');

insert into std_college
values (2,3,2,'passed');

insert into std_college
values (3,4,1,'passed');

insert into teaching_assistants
values (1,'Doctor','reda','hussien',3,1,'01-jan-2007');

insert into teaching_assistants
values (2,'T_A','moataz','mohamed',3,2,'01-jan-2009');

insert into officehours
values(1,'50');

insert into officehours
values(2,'from 2pm to 5pm ');

insert into ta_tel 
values(1,'01055447788');

insert into ta_tel
values(1,'01055447788');

insert into ta_email
values(1,'o@yahoo.com');

insert into ta_email
values(2,'s@yahoo.com');

insert into ta_email
values(3,'a@yahoo.com');

insert into subjects 
values(1,'java',1,20,100);

insert into subjects 
values(2,'database',3,50,100);

insert into subjects 
values(3,'network',2,70,100);

insert into teaches
values(1,1);

insert into teaches
values(2,3);

insert into takes 
values(1,1,50);

insert into takes 
values(2,2,90);

insert into takes 
values(3,3,80);

insert into takes 
values(3,2,92);

update address set country_name='Emarates' where countryid=2;

update city set city_name='dubai' where countryid=2;

update std_info set birthdate='08-jan-2000' where stdid=1;

update std_college set year=3 where stdid=1;

update teaching_assistants set cityid=1 where jobid=1;

update officehours set office_hours='from 10am to 8pm'
where jobid=1;

update ta_tel set phone='01897755663' where jobid=1;

update ta_email set email='yat@yahoo.com' where jobid=1;

delete from address where country_name = ( select ad.country_name from std_info stin join city ci
on( stin.cityid = ci.cityid ) join address ad
on( ci.countryid = ad.countryid ) where stin.firstname = 'sara' ) ;

delete from std_info where cityid = ( select cityid from city where cityid = 100 ) ;

delete from std_college where status = 'fired' ;

delete from teaching_assistants where hiringdate = null ;

delete from teaching_assistants ;

select stin.stdid id, stin.firstname , stin.lastname , stin.birthdate, stin.nationality
, stin.nationalid , stco.year , de.name departmentName , ci.city_name , ad.country_name
from std_info stin join std_college stco
on( stin.stdid = stco.stdid ) join city ci
on( stin.cityid = ci.cityid ) join address ad
on( ci.countryid = ad.countryid ) join departments de
on( de.departmentID = stco.departmentid ) ;

select ta.firstname , ta.lastname , ta.title, ta.hiringdate , de.name from teaching_assistants ta join departments de
on( ta.departmentid = de.departmentid ) ;

select ad.country_name, ci.city_name from city ci join address ad
on( ci.countryid = ad.countryid ) ;

select std_info.stdID,std_info.firstname ,std_info.lastname,std_info.Gender,std_info.BirthDate ,std_college.year ,std_college.status
from std_info join std_college on ( std_info.stdID  = std_college.stdid ) ;

select * from std_info st join city ci
on( st.cityid = ci.cityid )
where ci.city_name = 'Tanta' ;

select stin.firstname , stin.lastname , stte.phone from std_info stin join std_tel stte
on( stte.stdid = stin.stdid ) ;

select from address where country_name = ( select ad.country_name from std_info stin join city ci
on( stin.cityid = ci.cityid ) join address ad
on( ci.countryid = ad.countryid ) where stin.firstname = 'alaa' ) ;


select city = ( select cityid from city where cityid = 100 ) cityid, from std_info where cityid =100

select de.name departmentName , count( * ) num_of_students from std_college st join departments de 
on( st.departmentid = de.departmentid ) 
group by de.name
order by de.name ;

select su.name,round( avg( nvl( ta.degree , 0 ) ) ) Average_Of_Degrees from takes ta join subjects su
on( ta.subjectid = su.subjectid )
group by su.subjectid , su.name ;

select ta.title, concat( ta.firstname , concat( ' ' , ta.lastname ) ) Name , tt.phone , te.email from teaching_assistants ta join ta_tel tt
on( tt.jobid = ta.jobid ) join ta_email te
on( tt.jobid = te.jobid ) ;

select ta.title , concat( ta.firstname , concat( ' ' , ta.lastname ) ) Name, su.name subjectName from teaching_assistants ta join teaches te
on( ta.jobid = te.jobid ) join subjects su
on( te.subjectid = su.subjectid ) ;

select concat( stin.firstname , concat( ' ' , stin.lastname ) ) name , su.name subbject , 
ta.degree , su.totaldegree FullMark from std_info stin join takes ta
on( ta.stdid = stin.stdid ) join subjects su
on( ta.subjectid = su.subjectid ) ;

select te.title , te.firstname , te.lastname , ofhu.office_hours from teaching_assistants te 
join officehours ofhu
on( te.jobid = ofhu.jobid ) ;
