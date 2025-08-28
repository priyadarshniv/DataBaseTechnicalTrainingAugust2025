--Qn.no 1
select * from books_1;
select category, count(category) as "Count_of_books" from books_1 group by category;

--Qn.no 2
select * from issue_1;
select book_no, count(book_no) as "No.of.Issues" from issue_1 group by book_no order by count(book_no) desc ;

--Qn.no 3
select * from member_1;
select min(penalty_amount) as "Minimum penalty", max(penalty_amount) as "Maximum penalty", avg(penalty_amount) as "Average Penalty", sum(penalty_amount) as "Total penalty" from member_1;

--Qn.no 4
select * from issue_1;
select member_id, count(member_id) as "No.of.Books.Issued" from issue_1 group by member_id having count(member_id) >2;

--Qn.no 5
select * from issue_1;
select member_id, book_no, count(book_no) as "No.of.times.Issued" from issue_1 group by member_id, book_no order by count(book_no) desc;

--Qn.no 6
select to_char(issue_date, 'MON') as "Month", count(to_char(issue_date, 'MON')) as "Count" from issue_1 group by to_char(issue_date, 'MON') order by count(to_char(issue_date, 'MON')) desc;

--Qn.no 7
select book_no from books_1 where book_no not in (select book_no from issue_1);

--Qn.no 8
select member_id from member_1 where member_id in (select member_id from issue_1);

--Qn.no 9
SELECT member_id, COUNT(member_id) AS total_issues
FROM issue_1
GROUP BY member_id
ORDER BY total_issues DESC
FETCH FIRST 1 ROW ONLY;

SELECT member_id, COUNT(member_id) AS total_issues
FROM issue_1
GROUP BY member_id
ORDER BY total_issues ASC
FETCH FIRST 1 ROW ONLY;

select * from issue_1;

--Q.no 10
select * from issue_1 where to_char(issue_date, 'MON') in ('DEC', 'JAN');

--Qn.no 11
select b.book_no, b.book_name, i.issue_date 
from books_1 b
join ISSUE_1 i
on b.book_no = i.book_no and to_char(i.issue_date,'MM') = 12 and upper(b.category)= 'DATABASE';

--Qn.no 12
select i.member_id, m.member_name, count(i.member_id) as total_issue
from issue_1 i 
join member_1 m
on i.member_id = m.MEMBER_ID
group by i.member_id, m.member_name
order by total_issue desc;

--Qn.no 13
select b.book_no, b.book_name, i.issue_date, i.return_date
from books_1 b
join issue_1 i on b.book_no = i.book_no
join member_1 m on i.member_id = m.member_id
where m.member_name = 'Richa Sharma';

--Qn.no 14
select distinct m.*
from member_1 m
join issue_1 i on m.member_id = i.member_id 
join books_1 b on b.book_no = i.book_no
where upper(b.category) = 'DATABASE'

--Qn.no 15
select * from books_1;
select book_no, book_name, author_name, cost, category from books_1 b
where cost=
(select max(cost) from books_1 where category = b.category);

--Qn.no 16
SELECT i.*
FROM issue_1 i
JOIN member_1 m ON i.member_id = m.member_id
WHERE i.issue_date NOT BETWEEN m.acc_open_date AND i.return_date;

--Qn.no 17
select m.* 
from member_1 m
where m.member_id not in (
    select i.member_id
    from issue_1 i
);

--Qn.no 18
SELECT m.member_id, m.member_name, COUNT(i.book_no) AS issued_books, m.max_books_allowed
FROM member_1 m
JOIN issue_1 i ON m.member_id = i.member_id
GROUP BY m.member_id, m.member_name, m.max_books_allowed
HAVING COUNT(i.book_no) > m.max_books_allowed;

--Qn.no 19
SELECT DISTINCT m.member_id, m.member_name
FROM member_1 m
JOIN issue_1 i ON m.member_id = i.member_id
WHERE i.book_no IN (
    SELECT book_no 
    FROM issue_1 i2
    JOIN member_1 m2 ON i2.member_id = m2.member_id
    WHERE m2.member_name = 'Garima'
);

--Qn.no 20
SELECT b.book_name, b.price
FROM books_1 b
JOIN issue_1 i ON b.book_no = i.book_no
WHERE i.return_date IS NULL 
   OR i.return_date - i.issue_date > 30;


--Qn.no 21
SELECT author, book_name
FROM books_1
WHERE author IN (
    SELECT author
    FROM books_1
    GROUP BY author
    HAVING COUNT(*) > 1
);

--Qn.no 22
SELECT * FROM (
    SELECT m.member_id, m.member_name, COUNT(i.book_no) AS total_issues
    FROM member_1 m
    JOIN issue_1 i ON m.member_id = i.member_id
    GROUP BY m.member_id, m.member_name
    ORDER BY total_issues DESC
)
WHERE ROWNUM = 1
UNION ALL
SELECT * FROM (
    SELECT m.member_id, m.member_name, COUNT(i.book_no) AS total_issues
    FROM member_1 m
    JOIN issue_1 i ON m.member_id = i.member_id
    GROUP BY m.member_id, m.member_name
    ORDER BY total_issues ASC
)
WHERE ROWNUM = 1;

--Qn.no 23
SELECT * 
FROM (
    SELECT * FROM books_1 ORDER BY price DESC
)
WHERE ROWNUM <= 3;

--Qn.no 24
SELECT SUM(b.price) AS total_cost
FROM books_1 b
JOIN issue_1 i ON b.book_no = i.book_no
WHERE i.return_date IS NULL;

--Qn.no 25
SELECT b.book_no, b.book_name, COUNT(i.book_no) AS total_issues
FROM books_1 b
JOIN issue_1 i ON b.book_no = i.book_no
GROUP BY b.book_no, b.book_name
ORDER BY total_issues DESC
FETCH FIRST 1 ROW ONLY;

--Qn.no 26
SELECT COUNT(*) AS lifetime_issues
FROM issue_1 i
JOIN member_1 m ON i.member_id = m.member_id
WHERE m.member_type = 'Lifetime';

--Qn.no 27
SELECT member_type, COUNT(*) AS total_members
FROM member_1
GROUP BY member_type;

--Qn.no 28
SELECT m.member_id, m.member_name, m.member_type, COUNT(i.book_no) AS total_issues
FROM member_1 m
JOIN issue_1 i ON m.member_id = i.member_id
GROUP BY m.member_id, m.member_name, m.member_type
ORDER BY total_issues DESC
FETCH FIRST 5 ROWS ONLY;

--Qn.no 29
SELECT * FROM (
    SELECT m.member_id, m.member_name, m.member_type, COUNT(i.book_no) AS total_issues,
           RANK() OVER (PARTITION BY m.member_type ORDER BY COUNT(i.book_no) DESC) rnk
    FROM member_1 m
    JOIN issue_1 i ON m.member_id = i.member_id
    GROUP BY m.member_id, m.member_name, m.member_type
)
WHERE rnk <= 3;

--Qn.no 30
SELECT * 
FROM member_1
ORDER BY acc_open_date
FETCH FIRST 5 ROWS ONLY;

--QN.no 31
SELECT DISTINCT m.member_id, m.member_name, m.member_type
FROM member_1 m
JOIN issue_1 i ON m.member_id = i.member_id
WHERE i.issue_date BETWEEN DATE 'YYYY-12-01' AND DATE 'YYYY-12-31';

--Qn.no 32
SELECT DISTINCT m.*
FROM member_1 m
JOIN issue_1 i ON m.member_id = i.member_id
WHERE i.return_date IS NULL;

