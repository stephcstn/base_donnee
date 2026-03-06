insert into engager (equipeid, joueurid, saisonid)
select distinct m.home_team_api_id, m.home_player_1, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_1 is not null
union
select distinct m.away_team_api_id, m.away_player_1, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.away_player_1 is not null
union
select distinct m.home_team_api_id, m.home_player_2, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_2 is not null
union
select distinct m.away_team_api_id, m.away_player_2, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.away_player_2 is not null
union
select distinct m.home_team_api_id, m.home_player_3, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_3 is not null
union
select distinct m.away_team_api_id, m.away_player_3, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.away_player_3 is not null
union
select distinct m.home_team_api_id, m.home_player_4, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_4 is not null
union
select distinct m.away_team_api_id, m.away_player_4, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.away_player_4 is not null
union
select distinct m.home_team_api_id, m.home_player_5, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_5 is not null
union
select distinct m.away_team_api_id, m.away_player_5, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.away_player_5 is not null
union
select distinct m.home_team_api_id, m.home_player_6, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_6 is not null
union
select distinct m.away_team_api_id, m.away_player_6, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.away_player_6 is not null
union
select distinct m.home_team_api_id, m.home_player_7, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_7 is not null
union
select distinct m.away_team_api_id, m.away_player_7, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.away_player_7 is not null
union
select distinct m.home_team_api_id, m.home_player_8, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_8 is not null
union
select distinct m.away_team_api_id, m.away_player_8, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.away_player_8 is not null
union
select distinct m.home_team_api_id, m.home_player_9, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_9 is not null
union
select distinct m.away_team_api_id, m.away_player_9, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.away_player_9 is not null
union
select distinct m.home_team_api_id, m.home_player_10, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_10 is not null
union
select distinct m.away_team_api_id, m.away_player_10, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.away_player_10 is not null
union
select distinct m.home_team_api_id, m.home_player_11, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_11 is not null
union
select distinct m.away_team_api_id, m.away_player_11, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.away_player_11 is not null


Procédure PL/SQL terminée.

