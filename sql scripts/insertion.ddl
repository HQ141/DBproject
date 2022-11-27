insert into organization
select 1,'Edhi Foundation','22-Nov-1990',10,'Saddar,Karachi',42201878954621 from dual union all
select 2,'JDC','22-Jul-1999',10,'New Town,Karachi',42201878954622 from dual;
insert into EMPLOYEES
select 42201878954621,'Sattar Edhi','896554669','Head',56,1 from dual union all
select 42201878954622,'Zafar Abbas','89687669','Head',56,2 from dual union all
select 42201878954623,'P3','84855569','Branch Manager',56,2 from dual union all
select 42201878954624,'P4','898989869','Branch Manager',56,1 from dual;
insert into BRANCHES values(1,2,42201878954623,'Landhi,Karachi');
insert into BRANCHES values(2,1,42201878954624,'shah Faisal,Karachi');