
# Introduction 

Creating a new SQL practice project 

# SQL Queries 

####### Table Setup DDL 

### Question 1: show all members



## Part 3  - SQL Queries 

#### Question 1 - The club is adding a new facility - a spa. We need to add it into the facilities table. Use the following values:

facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
#### Answer 1:
```sql
 insert into cd.facilities
    (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
    values (9, 'Spa', 20, 30, 100000, 800);  
```

#### Question 2 - Let's try adding the spa to the facilities table again. This time, though, we want to automatically generate the value for the next facid, rather than specifying it as a constant. Use the following values for everything else:

Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
#### Answer 2: 
```sql
insert into cd.facilities. 
    (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) 
    select (select max(facid) from cd.facilities)+1, 'Spa', 20, 30, 100000, 800 ;  
```

#### Question 3 - We made a mistake when entering the data for the second tennis court. The initial outlay was 10000 rather than 8000: you need to alter the data to fix the error.
#### Answer 3 :
```sql
update cd.facilities 
    set initialoutlay = 10000 
    where name = 'Tennis Court 2';
```

#### Question 4 - We want to alter the price of the second tennis court so that it costs 10% more than the first one. Try to do this without using constant values for the prices, so that we can reuse the statement if we want to.
#### Answer 4 -
```sql
update cd.facilities 
    set 
        membercost = (select membercost * 1.1 from cd.facilities where facid = 0), 
        guestcost = (select guestcost * 1.1 from cd.facilities where facid = 0) 
    where facid = 1;  
```

#### Question 5 - As part of a clearout of our database, we want to delete all bookings from the cd.bookings table. How can we accomplish this?
#### Answer 5: 
```sql
delete from cd.bookings;
```

#### Question 6 - We want to remove member 37, who has never made a booking, from our database. How can we achieve that?
#### Answer 6:
```sql 
delete from cd.members where memid = 37;
```

###    BASICS 

#### Question 7 - How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
#### Answer 7:
```sql
select facid, name, membercost, monthlymaintenance 
	from cd.facilities 
	where 
	membercost > 0 and 
	(membercost < 0.02* monthlymaintenance);  
```

#### Question 8 - How can you produce a list of all facilities with the word 'Tennis' in their name?
#### Answer 8:
```sql
select * 
	from cd.facilities  
	where 
	name like '%Tennis%';  
```

#### Question 9 - How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
#### Answer 9:
```sql
select * 
	from cd.facilities  
	where 
	facid in (1,5); 
```

#### Question 10 - How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
#### Answer 10:
```sql
select memid, surname, firstname, joindate  
	from cd.members 
	where joindate >= '2012-09-01';  
```

#### Question 11 - You, for some reason, want a combined list of all surnames and all facility names. Yes, this is a contrived example :-). Produce that list!
#### Answer 11 -
```sql
select surname 
	from cd.members
union
select name 
	from cd.facilities;  
```

### JOIN 

#### Question 12 - How can you produce a list of the start times for bookings by members named 'David Farrell'?
#### Answer 12:
```sql
select starttime
from cd.bookings  as b
inner join cd.members as m
on b.memid = m.memid 
and m.firstname = 'David 
and m.surname = 'Farrell';
```

#### Question 13 - How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
#### Answer 13:
```sql
select b.starttime as start, f.name as name 
	from cd.bookings as b 
inner join cd.facilities as f
	on b.facid = f.facid 
where 
	f.name like '%Tennis%Court%' 
and 
	b.starttime >= '2012-09-21' and 
	b.starttime < '2012-09-22’ 
order by b.starttime ;
```

#### Question 14 - How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).
#### Answer 14:
```sql
select m.firstname as memfname, 
	m.surname as memsname, 
	r.firstname as recfname, 
	r.surname as recsname,
from cd.members as m
left outer join cd.members as r 
on m.recommendedby = r.memid
order by memsname, memfname;
```

#### Question 15 - How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
#### Answer 15
```sql
select distinct  r.firstname as firstname,
		 r.surname as surname 
from cd.members as m 
inner join cd.members as r  
	on m.recommendedby = r.memid  
order by surname, firstname;
```

#### Question 16 - How can you output a list of all members, including the individual who recommended them (if any), without using any joins? Ensure that there are no duplicates in the list, and that each firstname + surname pairing is formatted as a column and ordered.
#### Answer 16: 
```sql
select recommendedby, count(*) 
from cd.member s
 where recommendedby is not null
 group by recommendedby
 order by recommendedby;
```
 
#### Question 17 -Produce a count of the number of recommendations each member has made. Order by member ID.
#### Answer 17:
```sql
select facid, sum(slots) as "Total Slots"
	from cd.bookings
	group by facid
	order by facid;
```

#### Question 18 - Produce a list of the total number of slots booked per facility. For now, just produce an output table consisting of facility id and slots, sorted by facility id.
#### Answer 18:
```sql
select facid, sum(slots) as "Total Slots"
	from cd.bookings
	where starttime >= '2012-09-01'
	and starttime < '2012-10-1'
group by facid
order by sum(slots);
```

#### Question 19 - Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.
#### Answer 19:
```sql
select facid, 
	   extract(month from starttime) as month, 
	   sum(slots) as "Total Slots"
from cd.bookings
where extract(year from starttime) = 2012
group by facid, month
order by facid, month;
```

#### Question 20 - Find the total number of members (including guests) who have made at least one booking.
#### Answer 20:
```sql
select count(distinct memid) from cd.bookings;
```

#### Question 21 - Produce a list of each member name, id, and their first booking after September 1st 2012. Order by member ID.
#### Answer 21: 
```sql
select m.surname, m.firstname, m.memid, min(starttime) as starttime
from cd.members as m 
inner join cd.bookings as b 
	on b.memid = m.memid
where starttime >= '2012-09-01'
group by m.surname, m.firstname, m.memid
order by memid;
```

#### Question 22 - Produce a list of member names, with each row containing the total member count. Order by join date, and include guest members.
#### Answer 22:
```sql
select (select count(*) from cd.members) as count, firstname, surname 
from cd.members
group by memid
order by joindate;
```

#### Question 23 - Produce a monotonically increasing numbered list of members (including guests), ordered by their date of joining. Remember that member IDs are not guaranteed to be sequential.
#### Answer 23:
```sql
select row_number() over(order by joindate ), 
	firstname, 
	surname  
from cd.members 
order by joindate;
```

### STRING

#### Question 24 - Output the names of all members, formatted as 'Surname, Firstname'
#### Answer 24:
```sql
select concat( surname, ', ', firstname) as "Name"
from cd.members;
```

#### Question 25 - You've noticed that the club's member table has telephone numbers with very inconsistent formatting. You'd like to find all the telephone numbers that contain parentheses, returning the member ID and telephone number sorted by member ID.
#### Answer 25:
```sql
select memid, telephone 
from cd.members 
where telephone like '%(%)%'
order by memid;
```

#### Question 26 - You'd like to produce a count of how many members you have whose surname starts with each letter of the alphabet. Sort by the letter, and don't worry about printing out a letter if the count is 0.
#### Answer 26:
```sql
select substr(surname, 1, 1) as letter, count(*) 
from cd.members 
group by letter
order by letter;
```
