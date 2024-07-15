INSERT 0 1
UPDATE 1
UPDATE 1
DELETE 4044
DELETE 1
 facid |      name      | membercost | monthlymaintenance 
-------+----------------+------------+--------------------
     4 | Massage Room 1 |         35 |               3000
     5 | Massage Room 2 |         35 |               3000
(2 rows)

 facid |      name      | membercost | guestcost | initialoutlay | monthlymaintenance 
-------+----------------+------------+-----------+---------------+--------------------
     0 | Tennis Court 1 |          5 |        25 |         10000 |                200
     3 | Table Tennis   |          0 |         5 |           320 |                 10
     1 | Tennis Court 2 |        5.5 |      27.5 |         10000 |                200
(3 rows)

 facid |      name      | membercost | guestcost | initialoutlay | monthlymaintenance 
-------+----------------+------------+-----------+---------------+--------------------
     5 | Massage Room 2 |         35 |        80 |          4000 |               3000
     1 | Tennis Court 2 |        5.5 |      27.5 |         10000 |                200
(2 rows)

 memid |      surname      | firstname |      joindate       
-------+-------------------+-----------+---------------------
    24 | Sarwin            | Ramnaresh | 2012-09-01 08:44:42
    26 | Jones             | Douglas   | 2012-09-02 18:43:05
    27 | Rumney            | Henrietta | 2012-09-05 08:42:35
    28 | Farrell           | David     | 2012-09-15 08:22:05
    29 | Worthington-Smyth | Henry     | 2012-09-17 12:27:15
    30 | Purview           | Millicent | 2012-09-18 19:04:01
    33 | Tupperware        | Hyacinth  | 2012-09-18 19:32:05
    35 | Hunt              | John      | 2012-09-19 11:32:45
    36 | Crumpet           | Erica     | 2012-09-22 08:36:38
(9 rows)

      surname      
-------------------
 Tennis Court 2
 Worthington-Smyth
 Badminton Court
 Pinker
 Dare
 Bader
 Mackenzie
 Crumpet
 Massage Room 1
 Squash Court
 Tracy
 Hunt
 Tupperware
 Smith
 Butters
 Rownam
 Spa
 Baker
 Genting
 Purview
 Coplin
 Massage Room 2
 Joplette
 Stibbons
 Rumney
 Pool Table
 Sarwin
 Boothe
 Farrell
 Tennis Court 1
 Snooker Table
 Owen
 Table Tennis
 GUEST
 Jones
(35 rows)

 starttime 
-----------
(0 rows)

 start | name 
-------+------
(0 rows)

 firstname | surname  
-----------+----------
 Florence  | Bader
 Timothy   | Baker
 Gerald    | Butters
 Jemima    | Farrell
 Matthew   | Genting
 David     | Jones
 Janice    | Joplette
 Millicent | Purview
 Tim       | Rownam
 Darren    | Smith
 Tracy     | Smith
 Ponder    | Stibbons
 Burton    | Tracy
(13 rows)

 recommendedby | count 
---------------+-------
             1 |     5
             2 |     3
             3 |     1
             4 |     2
             5 |     1
             6 |     1
             9 |     2
            11 |     1
            13 |     2
            15 |     1
            16 |     1
            20 |     1
            30 |     1
(13 rows)

 facid | Total Slots 
-------+-------------
(0 rows)

 facid | Total Slots 
-------+-------------
(0 rows)

 facid | month | Total Slots 
-------+-------+-------------
(0 rows)

 count 
-------
     0
(1 row)

 surname | firstname | memid | starttime 
---------+-----------+-------+-----------
(0 rows)

 count | firstname |      surname      
-------+-----------+-------------------
    30 | GUEST     | GUEST
    30 | Darren    | Smith
    30 | Tracy     | Smith
    30 | Tim       | Rownam
    30 | Janice    | Joplette
    30 | Gerald    | Butters
    30 | Burton    | Tracy
    30 | Nancy     | Dare
    30 | Tim       | Boothe
    30 | Ponder    | Stibbons
    30 | Charles   | Owen
    30 | David     | Jones
    30 | Anne      | Baker
    30 | Jemima    | Farrell
    30 | Jack      | Smith
    30 | Florence  | Bader
    30 | Timothy   | Baker
    30 | David     | Pinker
    30 | Matthew   | Genting
    30 | Anna      | Mackenzie
    30 | Joan      | Coplin
    30 | Ramnaresh | Sarwin
    30 | Douglas   | Jones
    30 | Henrietta | Rumney
    30 | David     | Farrell
    30 | Henry     | Worthington-Smyth
    30 | Millicent | Purview
    30 | Hyacinth  | Tupperware
    30 | John      | Hunt
    30 | Erica     | Crumpet
(30 rows)

 row_number | firstname |      surname      
------------+-----------+-------------------
          1 | GUEST     | GUEST
          2 | Darren    | Smith
          3 | Tracy     | Smith
          4 | Tim       | Rownam
          5 | Janice    | Joplette
          6 | Gerald    | Butters
          7 | Burton    | Tracy
          8 | Nancy     | Dare
          9 | Tim       | Boothe
         10 | Ponder    | Stibbons
         11 | Charles   | Owen
         12 | David     | Jones
         13 | Anne      | Baker
         14 | Jemima    | Farrell
         15 | Jack      | Smith
         16 | Florence  | Bader
         17 | Timothy   | Baker
         18 | David     | Pinker
         19 | Matthew   | Genting
         20 | Anna      | Mackenzie
         21 | Joan      | Coplin
         22 | Ramnaresh | Sarwin
         23 | Douglas   | Jones
         24 | Henrietta | Rumney
         25 | David     | Farrell
         26 | Henry     | Worthington-Smyth
         27 | Millicent | Purview
         28 | Hyacinth  | Tupperware
         29 | John      | Hunt
         30 | Erica     | Crumpet
(30 rows)

           Name           
--------------------------
 GUEST, GUEST
 Smith, Darren
 Smith, Tracy
 Rownam, Tim
 Joplette, Janice
 Butters, Gerald
 Tracy, Burton
 Dare, Nancy
 Boothe, Tim
 Stibbons, Ponder
 Owen, Charles
 Jones, David
 Baker, Anne
 Farrell, Jemima
 Smith, Jack
 Bader, Florence
 Baker, Timothy
 Pinker, David
 Genting, Matthew
 Mackenzie, Anna
 Coplin, Joan
 Sarwin, Ramnaresh
 Jones, Douglas
 Rumney, Henrietta
 Farrell, David
 Worthington-Smyth, Henry
 Purview, Millicent
 Tupperware, Hyacinth
 Hunt, John
 Crumpet, Erica
(30 rows)

 letter | count 
--------+-------
 B      |     5
 C      |     2
 D      |     1
 F      |     2
 G      |     2
 H      |     1
 J      |     3
 M      |     1
 O      |     1
 P      |     2
 R      |     2
 S      |     5
 T      |     2
 W      |     1
(14 rows)

