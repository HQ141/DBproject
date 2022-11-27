insert into organization(organization_id,name,date_established,branches,headquaters,head_cnic) 
values
(1,'Edhi Foudation','1990-07-07',10,'Karachi,Landhi',1111111111111111),
(2,'JDC','1999-06-08',10,'New Town,Karachi',1111111111111112);
insert into employees (cnic,name,phone_no,position,age,organization_id)
values
(1111111111111111,'Sattar Edhi','896554669','Head',56,1),
(1111111111111112,'Zafar Abbas','89687669','Head',56,2),
(1111111111111113,'P3','84855569','Branch Manager',56,2),
(1111111111111114,'P4','898989869','Branch Manager',56,1);
insert into branches values(1,2,1111111111111113,'Landhi,Karachi');
insert into branches values(2,1,1111111111111114,'shah Faisal,Karachi');