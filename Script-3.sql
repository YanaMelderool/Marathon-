select 
r.runnerid, g."Gender" , e.eventid , e.startdatetime , to_char((re.racetime || ' second')::interval, 'HH24:MI:SS') as racetime,  age(e.startdatetime, r.dateofbirth) as "AgeDuringEvent"
from "Runner" r 
join "Gender" g on r."GenderID" = g."GenderID" 
join "Registration" r2 on r.runnerid = r2.runnerid 
join "RegistrationEvent" re on r2.registrationid = re.registrationid 
join "Event" e on re.eventid = e.eventid 
where e.startdatetime < now()
order by r.runnerid , e.startdatetime 
--правильно закончено (это запрос 3) надо закинуть в гитхаб




