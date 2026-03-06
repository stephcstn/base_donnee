create or replace view match_aller as 
select nom_equipe as equipe,
        CASE 
         WHEN scorelocale > scorevisiteur then 3
         WHEN scorelocale = scorevisiteur then 1
         ELSE 0
        END as Pts
from match, equipe, ligue, saison
where match.datematch between saison.datedeb and saison.datefin
 and match.equipelocale = equipe.equipeid
 and equipe.ligueid = ligue.ligueid
 and saison.libelle = '2014/2015'
 and ligue.nom_ligue = 'France Ligue 1';

 create or replace view match_retour as 
select nom_equipe as equipe,
        CASE 
         WHEN scorelocale < scorevisiteur then 3
         WHEN scorelocale = scorevisiteur then 1
         ELSE 0
        END as Pts
from match, equipe, ligue, saison
where match.datematch between saison.datedeb and saison.datefin
 and match.equipevisiteur = equipe.equipeid
 and equipe.ligueid = ligue.ligueid
 and saison.libelle = '2014/2015'
 and ligue.nom_ligue = 'France Ligue 1';

 create or replace view equipe_point as
(select * from match_aller)
union all
(select * from match_retour);

