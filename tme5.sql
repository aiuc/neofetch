Select distinct a.nomath, a.prenomath, s1.nomsp as Sport1, s2.nomsp as Sport2
From Rangindividuel r1, Rangindividuel r2, Athlete a, Epreuve e1, Epreuve e2, sport s1, sport s2
Where r1.aid = a.aid and r2.aid = a.aid and r1.epid = e1.epid and r2.epid = e2.epid and e1.sid > e2.sid 
and s1.sid = e1.sid and s2.sid=e2.sid  ;


