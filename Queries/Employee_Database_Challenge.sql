-- retirement_titles table
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
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (to_date = '9999-01-01');
SELECT * FROM retirement_titles;

-- unique_titles table
DROP TABLE unique_titles;
SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles 
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;
SELECT * FROM unique_titles;

-- retiring_titles table
SELECT title,
	COUNT (title) 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
SELECT * FROM retiring_titles;

-- mentorship_eligibility table 
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
    	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN titles as t 
ON (e.emp_no = t.emp_no)
LEFT JOIN dept_emp as de
ON (de.emp_no = e.emp_no)
WHERE (de.to_date = '9999-01-01') AND
(birth_date BETWEEN '1965-01-01' AND '1965-12-31');
SELECT * FROM mentorship_eligibility;

-- mentorship_eligibility_extended table 
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
    	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility_extended
FROM employees as e
INNER JOIN titles as t 
ON (e.emp_no = t.emp_no)
LEFT JOIN dept_emp as de
ON (de.emp_no = e.emp_no)
WHERE (de.to_date = '9999-01-01') AND
(birth_date BETWEEN '1965-01-01' AND '1975-12-31');
SELECT * FROM mentorship_eligibility_extended;