--Deliverable 1
-- retirement_titles table for employees who are born between January 1, 1952 and December 31, 1955
select e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
into retirement_titles
from titles as t
join employees as e on t.emp_no=e.emp_no 
where birth_date BETWEEN '1952-01-01' AND '1955-12-31' 
order by e.emp_no; 

-- unique_titles table  
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
into unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--retiring_titles table for retrieving the number of employees by their most recent job title and are about to retire 
select count(title),title
into retiring_titles
from unique_titles group by title 
order by count(title) desc;

-- Deliverable 2
-- A query is written and executed to create a Mentorship Eligibility table for 
-- current employees who were born between January 1, 1965 and December 31, 1965
select DISTINCT ON (e.emp_no) e.emp_no,e.first_name,e.last_name,e.birth_date,
de.from_date,de.to_date,t.title
into mentorship_eligibilty
from employees as e join dept_emp as de on e.emp_no=de.emp_no join
titles as t on e.emp_no=t.emp_no WHERE (de.to_date = '9999-01-01') 
and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
order by e.emp_no,de.to_date Desc