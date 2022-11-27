create or replace TRIGGER org_trigger
before insert on Organization
for each row
begin
:new.branches:=0;
end;
/
create or replace trigger branch_trigger
before insert on branches
for each row
declare 
begin
update organization set branches=(select count(*) from branches where organization_id=:new.organization_id)+1 where organization_id=:new.organization_id;
end;
/