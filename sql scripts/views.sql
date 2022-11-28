Create view TotalDonations
AS 
select organization.organization_id,organization.name,SUM(donations.amount) 
from organization,bank_accounts,donations 
where bank_accounts.organization_id=organization.organization_id and bank_accounts.account_no=donations.account_no 
group by organization.organization_id;

Create view AmbulanceServies
AS
select organization.name,branches.location 
from branches,organization 
where organization.organization_id=branches.organization_id and  branches.branch_id in 
    (select branch_id   
    from offer
    where offer.service_id in 
        (select service_id 
        from services 
        where UPPER(name) like UPPER('%ambulance%')) );
select c.name as column_name,
from sys.columns c
join sys.views v 
     on v.object_id = c.object_id