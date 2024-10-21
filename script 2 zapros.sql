
--запрос номер 2 , надо закинуть гит хаб


select r.runnerid , re.racetime , g."Gender" ,extract (year from age(e.startdatetime, r.dateofbirth)) as "AgeDuringEvent", e.eventname
from "Runner" r 
join "Registration" r2 on r.runnerid = r2.runnerid 
join "RegistrationEvent" re on r2.registrationid = re.registrationid 
join "Gender" g on r."GenderID" = g."GenderID" 
join "Event" e on re.eventid = e.eventid 
join "Marathon" m on e.marathonid = m.marathonid 
where m.marathonid < 5
order by r.runnerid, e.startdatetime;

