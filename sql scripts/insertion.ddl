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
insert into bank_accounts(account_no,organization_id)
values
(1111122222222222,1),
(1113322222222222,2);
insert into donations(account_no,donation_date,donor,amount)
values
(1111122222222222,'2022-07-22','MR.SHAMIKH',2000000),
(1111122222222222,'2022-06-20','MR.HAMDAN',4500000),
(1113322222222222,'2022-08-09','MR.ZAEEM',15000);
insert into services(service_id,name,avg_cost)
values
(200,'AMBULANCES',1500000),
(201,'ORPHANAGE',2500000),
(202,'MORGUE',500000),
(203,'OLD AGE HOME',350000);
insert into offer(branch_id,service_id) 
values
(1,200),
(1,202),
(2,200),
(2,201),
(2,202),
(1,203);
insert into volunteers(volunteer_cnic,name,age,phone_no) 
values
(4220181823405546,'ANAS',20,0301822895),
(4220181824444892,'YAHYA',19,03003471216),
(4220181812345789,'SHEHZIL',21,03459978808);
insert into participation(participation_date,volunteer_cnic,branch_id,service_id) 
values
('2022-06-20',4220181824444,1,200),
('2022-09-20',4220181823405,2,201),
('2021-12-13',4220181812345,2,203);