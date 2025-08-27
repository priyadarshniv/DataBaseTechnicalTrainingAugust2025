--Qn.no 1
CREATE TABLE Member_1 (
    Member_Id NUMBER(5),
    Member_Name VARCHAR2(30),
    Member_Address VARCHAR2(50),
    Acc_Open_Date DATE,
    Membership_Type VARCHAR2(20),
    Fees_Paid NUMBER(4),
    Max_Books_Allowed NUMBER(2),
    Penalty_Amount NUMBER(7,2)
);

-- Create Books Table
CREATE TABLE Books_1 (
    Book_No NUMBER(6),
    Book_Name VARCHAR2(30),
    Author_Name VARCHAR2(30),
    Cost NUMBER(7,2),
    Category CHAR(10)
);

-- Create Issue Table
CREATE TABLE Issue_1 (
    Lib_Issue_Id NUMBER(10),
    Book_No NUMBER(6),
    Member_Id NUMBER(5),
    Issue_Date DATE,
    Return_Date DATE
);

--Qn no 2:
desc member_1;
desc books_1;
desc issue_1;

--Qn. no 3:
drop table member_1;

--Qn.no 4:
CREATE TABLE Member_1 (
    Member_Id NUMBER(5) Primary key,
    Member_Name VARCHAR2(30),
    Member_Address VARCHAR2(50),
    Acc_Open_Date DATE,
    Membership_Type VARCHAR2(20)
        CHECK (Membership_Type IN ('Lifetime','Annual','Half Yearly','Quarterly')),
    Fees_Paid NUMBER(4),
    Max_Books_Allowed NUMBER(2),
    Penalty_Amount NUMBER(7,2)
);

--Qn.no 5
alter table member_1 modify member_name varchar2(35);
desc member_1;

--Qn.no 6
alter table issue_1 add reference char(30);

--Qn.no 7
alter table issue_1 drop column reference;
desc member_1;

--Qn.no 8
rename issue_1 to lib_issue;

--Qn.no 9
alter table member_1 modify fees_paid number(10);
insert into member_1 values (1, 'Richa Sharma', 'Pune', to_date('DEC-10-05', 'MM-DD-YYYY'), 'Lifetime', 25000,5,50);
insert into member_1 values (2, 'Garima Sen', 'Pune', sysdate, 'Annual', 1000,3,null);

--Qn.no 10
INSERT INTO Member_1
(Member_Id, Member_Name, Member_Address, Acc_Open_Date, Membership_Type, Fees_Paid, Max_Books_Allowed, Penalty_Amount) 
VALUES 
(3, 'Arjun Mehta', 'Delhi', TO_DATE('15-03-2006','DD-MM-YYYY'), 'Half Yearly', 1500, 4, 75);


INSERT INTO Member_1
(Member_Id, Member_Name, Member_Address, Acc_Open_Date, Membership_Type, Fees_Paid, Max_Books_Allowed, Penalty_Amount) 
VALUES 
(4, 'Sneha Iyer', 'Bangalore', TO_DATE('01-07-2006','DD-MM-YYYY'), 'Quarterly', 500, 2, NULL);

INSERT INTO Member_1
(Member_Id, Member_Name, Member_Address, Acc_Open_Date, Membership_Type, Fees_Paid, Max_Books_Allowed, Penalty_Amount) 
VALUES 
(5, 'Ravi Kumar', 'Hyderabad', TO_DATE('22-11-2005','DD-MM-YYYY'), 'Lifetime', 30000, 6, 0);


INSERT INTO Member_1 VALUES 
(6, 'Geeta Nair', 'Chennai', TO_DATE('19-08-2006','DD-MM-YYYY'), 'Annual', 1200, 3, 50);


INSERT INTO Member_1 
(Member_Id, Member_Name, Member_Address, Acc_Open_Date, Membership_Type, Fees_Paid, Max_Books_Allowed, Penalty_Amount) 
VALUES 
(7, 'Karan Singh', 'Kolkata', TO_DATE('05-05-2006','DD-MM-YYYY'), 'Half Yearly', 1600, 4, 30);

INSERT INTO Books_1 (Book_No, Book_Name, Author_Name, Cost, Category) 
VALUES (1001, 'SQL Basics', 'Loni', 550, 'Database');

INSERT INTO Books_1 (Book_No, Book_Name, Author_Name, Cost, Category) 
VALUES (1002, 'Advanced SQL', 'Mehta', 700, 'Database');

INSERT INTO Books_1 (Book_No, Book_Name, Author_Name, Cost, Category) 
VALUES (1003, 'Modern Physics', 'Albert', 450, 'Science');

INSERT INTO Books_1 (Book_No, Book_Name, Author_Name, Cost, Category) 
VALUES (1004, 'Fictional Tales', 'Kiran', 600, 'Fiction');

INSERT INTO Books_1 (Book_No, Book_Name, Author_Name, Cost, Category) 
VALUES (1005, 'Management 101', 'Sharma', 800, 'Management');


INSERT INTO lib_issue (Lib_Issue_Id, Book_No, Member_Id, Issue_Date, Return_Date) 
VALUES (2001, 1001, 1, TO_DATE('01-07-2006','DD-MM-YYYY'), NULL);

INSERT INTO lib_issue (Lib_Issue_Id, Book_No, Member_Id, Issue_Date, Return_Date) 
VALUES (2002, 1003, 2, TO_DATE('15-07-2006','DD-MM-YYYY'), TO_DATE('05-08-2006','DD-MM-YYYY'));

INSERT INTO lib_issue (Lib_Issue_Id, Book_No, Member_Id, Issue_Date, Return_Date) 
VALUES (2003, 1002, 1, TO_DATE('10-06-2006','DD-MM-YYYY'), NULL);

INSERT INTO lib_issue (Lib_Issue_Id, Book_No, Member_Id, Issue_Date, Return_Date) 
VALUES (2004, 1004, 3, TO_DATE('20-05-2006','DD-MM-YYYY'), TO_DATE('30-06-2006','DD-MM-YYYY'));

INSERT INTO lib_issue (Lib_Issue_Id, Book_No, Member_Id, Issue_Date, Return_Date) 
VALUES (2005, 1005, 4, TO_DATE('25-06-2006','DD-MM-YYYY'), NULL);

select * from member_1;
select * from books_1;
select * from lib_issue;

--Qn.no 11
alter table member_1 modify member_name varchar2(20);

--Qn.no 12
insert into member_1 values (8, 'Hisingh', 'Chennai', to_date('DEC-10-05', 'MM-DD-YYYY'), 'Lifetime', 25000,110,50);

--Qn.no 13
create table member101 as select * from member_1;

--Qn.no 14
SELECT * from member_1;
alter  table member_1 add constraint maxbook_1 check (Max_Books_Allowed <100);
alter  table member_1 add constraint penalty_1 check (Penalty_Amount <=1000);

--Qn.no 15
drop table books_1;

--Qn.no 16
drop table books_1;
CREATE TABLE Books_1 (
    Book_No NUMBER(6) primary key,
    Book_Name VARCHAR2(30) not null,
    Author_Name VARCHAR2(30),
    Cost NUMBER(7,2),
    Category CHAR(10) check (category in ('Science', 'FIction', 'Database', 'RDBMS', 'Others'))
);

--Qn.no 17
INSERT INTO Books_1 VALUES (101, 'Let us C', 'Denis Ritchie', 450, 'System');
INSERT INTO Books_1 VALUES (102, 'Oracle Complete Ref', 'Loni', 550, 'Database');
INSERT INTO Books_1 VALUES (103, 'Mastering SQL', 'Loni', 250, 'Database');
INSERT INTO Books_1 VALUES (104, 'PL SQL-Ref', 'Scott Urman', 750, 'Database');
select * from books_1;

--Qn.no 18
insert into books_1 values (&book_no, '&book_name', '&author_name', '&cost', '&category');
--inserted the let us C book manually, changing the category from system to others.

--Qn.no 19
create table book101 as select * from books_1 where 1=0;

--Qn.no 20
insert into book101 select * from books_1;

--Qn.no 21
savepoint perfect;

--Qn.no 22
select * from member_1;
select * from books_1;
select * from LIB_ISSUE;

--Qn.no 23
insert into books_1 values(105, 'National geographic', 'Adis scott', 1000, 'Science');

--Qn.no 24
rollback;

--Qn.no 25
UPDATE books_1 SET cost = 300, category = 'RDBMS' WHERE book_no = 103;

--Qn.no 26
rename lib_issue to issue_1;

--Qn.no 27
drop table issue_1;

--Qn.no 28
CREATE TABLE Issue_1 (
    Lib_Issue_Id NUMBER(10) primary key,
    Book_No NUMBER(6) references books_1(book_no),
    Member_Id NUMBER(5) references member_1(member_id),
    Issue_Date DATE,
    Return_Date DATE,
    constraint id_lt_rt check (issue_date < return_date)
);


--Qn.no 29
INSERT INTO Issue_1 (Lib_Issue_Id, Book_No, Member_Id, Issue_Date)
VALUES (7001, 101, 1, TO_DATE('10-Dec-2006','DD-Mon-YYYY'));

INSERT INTO Issue_1 (Lib_Issue_Id, Book_No, Member_Id, Issue_Date)
VALUES (7002, 102, 2, TO_DATE('25-Dec-2006','DD-Mon-YYYY'));

INSERT INTO Issue_1 (Lib_Issue_Id, Book_No, Member_Id, Issue_Date)
VALUES (7003, 104, 1, TO_DATE('15-Jan-2006','DD-Mon-YYYY'));

INSERT INTO Issue_1 (Lib_Issue_Id, Book_No, Member_Id, Issue_Date)
VALUES (7004, 101, 1, TO_DATE('04-Jul-2006','DD-Mon-YYYY'));

INSERT INTO Issue_1 (Lib_Issue_Id, Book_No, Member_Id, Issue_Date)
VALUES (7005, 104, 2, TO_DATE('15-Nov-2006','DD-Mon-YYYY'));

INSERT INTO Issue_1 (Lib_Issue_Id, Book_No, Member_Id, Issue_Date)
VALUES (7006, 101, 3, TO_DATE('18-Feb-2006','DD-Mon-YYYY'));

--Qn.no 30
commit;

--Qn.no 31
alter table issue_1 disable primary key;
alter table issue_1 disable constraint SYS_C003234806;
alter table issue_1 disable constraint SYS_C003234807;
alter table issue_1 disable constraint id_lt_rt;
select constraint_type, CONSTRAINT_NAME, status from user_constraints where table_name = 'ISSUE_1';

--Qn.no 32
INSERT INTO Issue_1 (Lib_Issue_Id, Book_No, Member_Id, Issue_Date)
VALUES (7009, 104, 10, TO_DATE('15-Nov-2006','DD-Mon-YYYY'));


--Qn.no 33
alter table issue_1 enable primary key;
alter table issue_1 enable constraint SYS_C003234806;
alter table issue_1 enable constraint SYS_C003234807;
alter table issue_1 enable constraint id_lt_rt;
select constraint_type, CONSTRAINT_NAME, status from user_constraints where table_name = 'ISSUE_1';

--Qn.no 34
delete from issue_1 where member_id = 10;

--Qn.no 35 ( getting intergrity constraint violated error)
select * from member_1;
delete from member_1 where member_id=1;

--Qn.no 36
select * from issue_1;
update issue_1 set return_date = issue_date + 15 where lib_issue_id in (7004, 7005);

--Qn.no 37
select * from member_1;
update member_1 set penalty_amount = 100 where member_name = 'Garima Sen';

--Qn.no 38
savepoint till_here;

--Qn.no 39
delete from issue_1 where member_id = 1 and issue_date < to_date('Dec-10-06', 'MM-DD-YYYY');
select * from issue_1;

--Qn.no 40 (integrity constraint error)
delete from books_1 where category not in ('RDBMS', 'Database');
select * from books_1;

--Qn.no 41
rollback to till_here;

--Qn.no 42
commit;

--Qn.no 43
drop table member101;

--Qn.no 44
drop table book101;

--Qn.no 45
select * from member_1;
desc member_1;
select * from books_1;
desc book_1;
select * from issue_1;
desc issue_1;

--Qn.no 46
create sequence no_seq start with 100 increment by 2 maxvalue 200 nocycle;
select no_seq.nextval from dual;

--Qn.no 47
drop sequence no_seq;

--Qn.no 48
create sequence book_seq start with 101 increment by 1 maxvalue 1000 nocycle;

--Qn.no 49
create sequence member_seq start with 1 increment by 1 maxvalue 100 nocycle;

--Qn.no 50
drop sequence book_seq;
drop sequence member_seq;