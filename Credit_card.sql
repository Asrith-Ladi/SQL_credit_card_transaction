Select * from credit_card_transcations

--1- write a query to print top 5 cities with highest spends and their percentage contribution of total credit card spends 

select top 5 city,sum(amount) total_spend, 
round(sum(amount)*1.0/(select sum(cast(amount as bigint)) from credit_card_transcations)*100,2) percentage_contribution
from credit_card_transcations cct 
group by city
order by 2 desc

--2- write a query to print highest spend month and amount spent in that month for each card type
select * from(
Select card_type,month(transaction_date) mon,year(transaction_date) yy,sum(amount) sales, rank() over(partition by card_type order by sum(amount) desc) rn
from credit_card_transcations
group by card_type,month(transaction_date),year(transaction_date)
) a
where rn=1

--3- write a query to print the transaction details(all columns from the table) for each card type when
--it reaches a cumulative of  1,000,000 total spends(We should have 4 rows in the o/p one for each card type)
with cte as ( 
select *, sum(amount) over(partition by card_type order by transaction_date,transaction_id) total_spend from credit_card_transcations)
--order by 4,3

select * from (
select *,rank() over(partition by card_type order by transaction_date,transaction_id) rn from cte
where total_spend >=1000000) b
where rn=1

--4- write a query to find city which had lowest percentage spend for gold card type

select top 1 city,sum(amount)*100.0/(select sum(cast(amount as bigint)) from credit_card_transcations) percentage_spend
from credit_card_transcations
where card_type='Gold'
group by city, card_type
order by 2 


--5- write a query to print 3 columns:  city, highest_expense_type , lowest_expense_type (example format : Delhi , bills, Fuel)

with cte as (select city,exp_type,sum(amount) sales,rank() over(partition by city order by sum(amount) desc) het,
rank() over(partition by city order by sum(amount) asc) let
from credit_card_transcations
group by city,exp_type
)
 -- sum function will not help us for case statements
select city, min(case when het=1 then exp_type end) as highest_expense_type,
min(case when let=1 then exp_type end) as lowest_expense_type
from cte
group by city

--6- write a query to find percentage contribution of spends by females for each expense type


select exp_type, sum(case when gender='F' then amount end)*1.0 /sum(amount) percentage_female_contribution --to convert to float we need multipy the numerator with 1.0
from credit_card_transcations
group by exp_type
order by 2 desc

--7- which card and expense type combination saw highest month over month growth in Jan-2014

with cte as (select card_type,exp_type,month(transaction_date) mon,year(transaction_date) yy,sum(amount) pres_amount
from credit_card_transcations
group by card_type,exp_type,year(transaction_date),month(transaction_date))

select top 1*, pres_amount-prev_amount mom_growth from(
select *, lag(pres_amount,1) over(partition by card_type,exp_type order by yy,mon) prev_amount
from cte) a
where yy=2014 and mon=1
order by mom_growth desc

--8- during weekends which city has highest total spend to total no of transcations ratio 

select top 1 city,sum(amount)*1.0/count(1) Spend_transaction_ratio
from credit_card_transcations
where datepart(weekday,transaction_date) in (1,7)
group by city
order by 2 desc

--9- which city took least number of days to reach its 500th transaction after the first transaction in that city
 with cte as (
select *
,row_number() over(partition by city order by transaction_date,transaction_id) as rn
from credit_card_transcations)

select top 1 city,datediff(day,min(transaction_date),max(transaction_date)) as datediff1
from cte
where rn=1 or rn=500
group by city
having count(1)=2
order by datediff1 