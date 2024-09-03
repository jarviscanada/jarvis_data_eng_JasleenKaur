\c postgres; 
 ~~~sql

-- Inspect the table schema

\d+ retail; 

-- Q1: Show first 10 rows

select * from retail 
limit 10; 

-- Q2: Check # of records

select count(*) from retail; 

-- Q3: number of clients (e.g. unique client ID)

select count(distinct(customer_id)) from retail; 

-- Q4: invoice date range (e.g. max/min dates)

select max(invoice_date), 
       min(invoice_date)
from retail; 

-- Q5: number of SKU/merchants (e.g. unique stock code)

select count(distinct(stock_code))
from retail; 

-- Q6: Calculate average invoice amount excluding invoices with a negative amount (e.g. canceled orders have negative amount)

select avg(invoice_total) 
from( select sum(unit_price * quantity) as invoice_total 
        from retail 
        group by invoice_no
        having sum(unit_price * quantity) > 0 ) as subquery; 

-- Q7: Calculate total revenue (e.g. sum of unit_price * quantity)

select sum( unit_price * quantity ) from retail; 

-- Q8: Calculate total revenue by YYYYMM 

select to_char( invoice_date, 'YYYYMM') as invoice_month, 
    sum(unit_price * quantity) as total_revenue 
from retail 
group by to_char( invoice_date, 'YYYYMM')
order by invoice_month; 

