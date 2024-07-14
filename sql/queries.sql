
-- Query 1 - 

insert into cd.facilities
    (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
    values (9, 'Spa', 20, 30, 100000, 800);

-- Query 2
insert into cd.facilities. 
    (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) 
    select (select max(facid) from cd.facilities)+1, 'Spa', 20, 30, 100000, 800 ;         

-- Query 3
update cd.facilities
set initialoutlay = 10000 
where name = 'Tennis Court 2';

-- Query 4
update cd.facilities 
set 
	membercost = ( select membercost*1.1 from cd.facilities where facid = 0),
	guestcost = (select guestcost*1.1 from cd.facilities where facid = 0)
where facid = 1;

-- Query 5
delete from cd.bookings;

-- Query 6
delete from cd.members where memid = 37;

-- Query 7
select facid, name, membercost, monthlymaintenance
	from cd.facilities 
	where  
		membercost > 0 and 
		(membercost < 0.02*monthlymaintenance );

-- Query 8
select * from cd.facilities
where name like '%Tennis%';

-- Query 9
select * from cd.facilities
where facid in (1,5);

-- Query 10
select memid, surname, firstname, joindate
from cd.members
where joindate >= '2012-09-01';

-- Query 11 
select surname from cd.members
union
select name from cd.facilities;

-- Query 12
select starttime
from cd.bookings  as b
inner join cd.members as m
on b.memid = m.memid 
and m.firstname = 'David' 
and m.surname = 'Farrell';

-- Query 13
select b.starttime as start, f.name as name 
	from cd.bookings as b 
inner join cd.facilities as f 
	on b.facid = f.facid 
where 
	f.name like '%Tennis%Court%' 
and 
	b.starttime >= '2012-09-21' and 
	b.starttime < '2012-09-22' 
order by b.starttime ;

-- Query 14
select m.firstname as memfname, 
	   m.surname as memsname, 
	   r.firstname as recfname
	   r.surname as recsname 
from cd.members as m
left outer join cd.members as r 
on m.recommendedby = r.memid
order by memsname, memfname;

-- Query 15
select distinct r.firstname as firstname, r.surname as surname
from cd.members as m 
inner join cd.members as r 
on m.recommendedby = r.memid 
order by surname, firstname;

-- Query 16
select recommendedby, count(*)
 from cd.members
 where recommendedby is not null
 group by recommendedby
 order by recommendedby;

-- Query 17
select facid, sum(slots) as "Total Slots"
	from cd.bookings
	group by facid
	order by facid;

-- Query 18
select facid, sum(slots) as "Total Slots"
	from cd.bookings
	where starttime >= '2012-09-01'
	and starttime < '2012-10-1'
group by facid
order by sum(slots);

-- Query 19
select facid, 
	   extract(month from starttime) as month, 
	   sum(slots) as "Total Slots"
from cd.bookings
where extract(year from starttime) = 2012
group by facid, month
order by facid, month;

-- Query 20
select count(distinct memid) from cd.bookings;

-- Query 21
select m.surname, m.firstname, m.memid, min(starttime) as starttime
from cd.members as m 
inner join cd.bookings as b 
	on b.memid = m.memid
where starttime >= '2012-09-01'
group by m.surname, m.firstname, m.memid
order by memid;

-- Query 22 
select (select count(*) from cd.members) as count, firstname, surname 
from cd.members
group by memid
order by joindate;

-- Query 23
select row_number() over(order by joindate ), 
	firstname, 
	surname  
from cd.members 
order by joindate;

-- Query 24
select concat( surname, ', ', firstname) as "Name"
from cd.members;

-- Query 25
select me-mid, telephone 
from cd.members 
where telephone like '%(%)%'
order by memid;

-- Query 26
select substr(surname, 1, 1) as letter, count(*) 
from cd.members 
group by letter
order by letter;



