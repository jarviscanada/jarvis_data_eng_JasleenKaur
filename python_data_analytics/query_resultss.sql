                                                Table "public.retail"
    Column    |            Type             | Collation | Nullable | Default | Storage  | Stats target | Description 
--------------+-----------------------------+-----------+----------+---------+----------+--------------+-------------
 invoice_no   | text                        |           |          |         | extended |              | 
 stock_code   | text                        |           |          |         | extended |              | 
 description  | text                        |           |          |         | extended |              | 
 quantity     | integer                     |           |          |         | plain    |              | 
 invoice_date | timestamp without time zone |           |          |         | plain    |              | 
 unit_price   | real                        |           |          |         | plain    |              | 
 customer_id  | real                        |           |          |         | plain    |              | 
 country      | text                        |           |          |         | extended |              | 

 invoice_no | stock_code |             description             | quantity |    invoice_date     | unit_price | customer_id |    country     
------------+------------+-------------------------------------+----------+---------------------+------------+-------------+----------------
 489434     | 85048      | 15CM CHRISTMAS GLASS BALL 20 LIGHTS |       12 | 2009-12-01 07:45:00 |       6.95 |       13085 | United Kingdom
 489434     | 79323P     | PINK CHERRY LIGHTS                  |       12 | 2009-12-01 07:45:00 |       6.75 |       13085 | United Kingdom
 489434     | 79323W     |  WHITE CHERRY LIGHTS                |       12 | 2009-12-01 07:45:00 |       6.75 |       13085 | United Kingdom
 489434     | 22041      | RECORD FRAME 7" SINGLE SIZE         |       48 | 2009-12-01 07:45:00 |        2.1 |       13085 | United Kingdom
 489434     | 21232      | STRAWBERRY CERAMIC TRINKET BOX      |       24 | 2009-12-01 07:45:00 |       1.25 |       13085 | United Kingdom
 489434     | 22064      | PINK DOUGHNUT TRINKET POT           |       24 | 2009-12-01 07:45:00 |       1.65 |       13085 | United Kingdom
 489434     | 21871      | SAVE THE PLANET MUG                 |       24 | 2009-12-01 07:45:00 |       1.25 |       13085 | United Kingdom
 489434     | 21523      | FANCY FONT HOME SWEET HOME DOORMAT  |       10 | 2009-12-01 07:45:00 |       5.95 |       13085 | United Kingdom
 489435     | 22350      | CAT BOWL                            |       12 | 2009-12-01 07:46:00 |       2.55 |       13085 | United Kingdom
 489435     | 22349      | DOG BOWL , CHASING BALL DESIGN      |       12 | 2009-12-01 07:46:00 |       3.75 |       13085 | United Kingdom
(10 rows)

  count  
---------
 1067371
(1 row)

 count 
-------
  5942
(1 row)

         max         |         min         
---------------------+---------------------
 2011-12-09 12:50:00 | 2009-12-01 07:45:00
(1 row)

 count 
-------
  5305
(1 row)

       avg       
-----------------
 523.30375861254
(1 row)

       sum        
------------------
 19287250.4815679
(1 row)

 invoice_month |  total_revenue   
---------------+------------------
 200912        |  799847.10702483
 201001        |  624032.88899884
 201002        | 533091.423987399
 201003        | 765848.757352209
 201004        |  590580.42922299
 201005        | 615322.827583108
 201006        |  679786.60663899
 201007        | 575236.358301353
 201008        | 656776.337579533
 201009        | 853650.428091871
 201010        | 1045168.34560464
 201011        | 1422654.63578795
 201012        | 1126445.46600707
 201101        | 560000.257261246
 201102        | 498062.648327291
 201103        | 683267.077526025
 201104        | 493207.118820665
 201105        | 723333.506302901
 201106        | 691123.115991857
 201107        | 681300.107372692
 201108        | 682680.507384315
 201109        | 1019687.61652123
 201110        | 1070704.66378935
 201111        | 1461756.24248293
 201112        |  433686.00760667
(25 rows)

