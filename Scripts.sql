--- Channel with the most Orders
select Channel, count(account_id) from 
accounts a 
join web_events b 
on a.id = b.account_id
group by  channel
order by count(account_id) desc

--- Accounts with the highestr order ----
select name, sum(total_amt_usd) Total_Amount from orders o
join accounts a
on o.account_id = a.id
group by name
order by Total_Amount desc

----- Account with the highest order for each year ---
select name, date(date_trunc('year', o.occurred_at)) occured_at, sum(total_amt_usd) Total_Amount from orders o
join accounts a
on o.account_id = a.id
group by name, date(date_trunc('year', o.occurred_at))
order by date(date_trunc('year', o.occurred_at)), total_amount

---- Highest accont rep ------
select s.name as sales_name, count(sales_rep_id) number_of_accounts from accounts a
join sales_reps s 
on a.sales_rep_id = s.id
group by s.name
order by number_of_accounts desc


--region with the top accounts 

select r.name , sum(total_amt_usd) top_region from region r 
join sales_reps s on r.id = s.region_id
join accounts a on s.id = a.sales_rep_id
join orders o on a.id = o.account_id
group by r.name
order by top_region desc