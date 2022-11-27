
create TRIGGER org_trigger
before insert on organization
for each row
 set new.branches=0;

create trigger branch_trigger
before insert on branches
for each row
update organization set branches=(select count(*) from branches where organization_id=new.organization_id)+1 where organization_id=new.organization_id;
