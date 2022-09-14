-- Deliverable 1a
-- Retirement Titles Table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
	INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' and '1955-12-31')
ORDER BY e.emp_no, t.emp_no DESC
SELECT * FROM retirement_titles


-- Deliverable 1b
-- Number of Retiring Employees without Duplicates
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date ASC, 
	to_date DESC;
SELECT * FROM unique_titles


-- Deliverable 1c
-- Count of Retiring Employees by Title
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;
SELECT * FROM retiring_titles