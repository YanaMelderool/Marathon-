select r.runnerid, r3.racetime, g.gender, extract (year from age(e.startdatetime, r.dateofbirth)) as "AgeDuringEvent", e."eventname" 
from "Runner" r4 r
join registration r2 on r.runnerid = r2.runnerid
join registrationevent r3 on r2.registrationid = r3.registrationid 
join "gender" g on r.genderid = g.genderid
join "event" e on r3.eventid = e.eventid 
join marathon m on e.marathonid = m.marathonid 
where m.marathonid < 5
--тоже в гит хаб. недочеты скоректированы 