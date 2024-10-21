select distinct u."firstname", u."lastname", rnr."countrycode"
from "User" u
inner JOIN "Role" r on u."roleid" = r."roleid"
inner join "Runner" rnr on u."email" = rnr."email"
inner join "Registration" reg on rnr."runnerid" = reg."runnerid"
inner join "RegistrationEvent" rei on reg."registrationid" = rei."registrationid"
inner join "Event" ev on rei."eventid" = ev."eventid" 
where r."roleid" = 'R' and ev."marathonid" = 5;