select u.firstname, u.lastname,
date_part('Year', age(rnr.dateofbirth)) as age, g.gender, m.marathonname, ev.eventname, c.countryname,
TO_CHAR((rei."racetime" || ' seconds')::interval, 'HH24:MI:SS') AS race_time,
ROW_NUMBER() OVER (PARTITION BY ev.eventname ORDER BY rei.racetime ASC) AS position
FROM "Event" ev
INNER JOIN "Marathon" m ON ev.marathonid = m.marathonid
inner join "Country" c on m."countrycode" = c.countrycode
INNER JOIN "RegistrationEvent" rei ON ev."eventid" = rei.eventid
inner join "Registration" reg on rei."registrationid" = reg.registrationid
inner join "Runner" rnr on reg.runnerid = rnr.runnerid
inner join "User" u on u.email = rnr.email
inner join "Gender" g on rnr."genderid" = g.genderid
WHERE ev."marathonid" = '3' AND rei.racetime != 0
ORDER BY ev."eventname" asc, g."gender" asc, race_time asc;