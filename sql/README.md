
# Introduction 

Creating a new SQL practice project 

# SQL Queries 

####### Table Setup DDL 


### Question 1: show all members



## Part 3  - SQL Queries 

#### Question 1 - The club is adding a new facility - a spa. We need to add it into the facilities table. Use the following values:

facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
#### Answer 1:
 insert into cd.facilities
    (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
    values (9, 'Spa', 20, 30, 100000, 800);  

#### Question 2 - Let's try adding the spa to the facilities table again. This time, though, we want to automatically generate the value for the next facid, rather than specifying it as a constant. Use the following values for everything else:

Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
#### Answer 2: 

insert into cd.facilities. \
    (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) \
    select (select max(facid) from cd.facilities)+1, 'Spa', 20, 30, 100000, 800 ; \ 

#### Question 3 - We made a mistake when entering the data for the second tennis court. The initial outlay was 10000 rather than 8000: you need to alter the data to fix the error.
#### Answer 3 :
update cd.facilities
set initialoutlay = 10000 
where name = 'Tennis Court 2';

#### Question 4 - We want to alter the price of the second tennis court so that it costs 10% more than the first one. Try to do this without using constant values for the prices, so that we can reuse the statement if we want to.
#### Answer 4 - 
update cd.facilities 
set 
	membercost = ( select membercost*1.1 from cd.facilities where facid = 0),
	guestcost = (select guestcost*1.1 from cd.facilities where facid = 0)
where facid = 1;

#### Question 5 - As part of a clearout of our database, we want to delete all bookings from the cd.bookings table. How can we accomplish this?

#### Answer 5: 
delete from cd.bookings;

#### Question 6 - We want to remove member 37, who has never made a booking, from our database. How can we achieve that?
#### Answer 6: 
delete from cd.members where memid = 37;

###    BASICS 

#### Question 7 - How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
#### Answer 7:
select facid, name, membercost, monthlymaintenance
	from cd.facilities 
	where  
		membercost > 0 and 
		(membercost < 0.02*monthlymaintenance ); 
