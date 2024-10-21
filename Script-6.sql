select distinct u.firstname, u.lastname, rnr.countrycode, rgs.registrationstatus, ev.eventtypeid
from "User" u
inner JOIN "Role" r on u.roleid = r.roleid
inner join "Runner" rnr on u.email = rnr.email
inner join "Registration" reg on rnr.runnerid = reg.runnerid
inner join "RegistrationEvent" rei on reg.registrationid = rei.registrationid
inner join "Event" ev on rei."eventid" = ev.eventid
inner join "RegistrationStatus" rgs on reg.registrationstatusid = rgs.registrationstatusid
where rgs.registrationstatusid = 1
order by eventtypeid asc;