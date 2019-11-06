#1.
use publications;
select 
a.au_id,
a.au_lname,
a.au_fname,
t.title,
p.pub_name,

from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles as t on ta.title_id = t.title_id
join publishers p on p.pub_id = t.pub_id
order by au_id

;

select count(*) from titleauthor;


select 
count(*) as table_count
from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles as t on ta.title_id = t.title_id
join publishers p on p.pub_id = t.pub_id
order by a.au_id
;

#2.

select 
a.au_id,
a.au_lname,
a.au_fname,
p.pub_name,
count(t.title)
from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles as t on ta.title_id = t.title_id
join publishers p on p.pub_id = t.pub_id
group by a.au_id,a.au_lname,a.au_fname,p.pub_name
;

#3.

select 
a.au_id,
a.au_lname,
a.au_fname, sum(qty) 
from authors a
join titleauthor ta on a.au_id = ta.au_id
join sales as s on ta.title_id = s.title_id
group by a.au_id,a.au_lname,a.au_fname
order by sum(qty) desc
limit 3;

#4.

use publications;
select 
a.au_id,
a.au_lname,
a.au_fname, sum(COALESCE(qty, 0)) 
from authors a
left join titleauthor ta on a.au_id = ta.au_id
left join sales as s on ta.title_id = s.title_id
group by a.au_id,a.au_lname,a.au_fname
order by sum(COALESCE(qty, 0))  desc
;

