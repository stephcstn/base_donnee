SELECT USER FROM DUAL;

CREATE TABLE Ligue (
    ligueId NUMBER PRIMARY KEY,
    nom_ligue VARCHAR2(100),
    pays VARCHAR2(100)
);

CREATE TABLE Equipe (
    equipeId NUMBER PRIMARY KEY,
    nom_equipe VARCHAR2(100),
    nom_court VARCHAR2(100),
    ligueId NUMBER NOT NULL,

    CONSTRAINT fk_equipe_ligue
        FOREIGN KEY (ligueId) REFERENCES Ligue(ligueId)
);

CREATE TABLE Saison (
    saisonId NUMBER PRIMARY KEY,
    libelle VARCHAR2(100),
    dateDeb DATE,
    dateFin DATE
);

CREATE TABLE Joueur (
    joueurId NUMBER PRIMARY KEY,
    nom_joueur VARCHAR2(100),
    prenom_joueur VARCHAR2(100),
    dateNaissance DATE,
    taille NUMBER,
    poids NUMBER
);

CREATE TABLE Match(
    matchId NUMBER PRIMARY KEY,
    dateMatch DATE,
    scoreLocale NUMBER,
    scoreVisiteur NUMBER,

    equipeLocale NUMBER NOT NULL,
    equipeVisiteur NUMBER NOT NULL,

    CONSTRAINT fk_equipe_id_Locale
        FOREIGN KEY (equipeLocale) REFERENCES Equipe(equipeId),
    
    CONSTRAINT fk_equipe_id_Visiteur
        FOREIGN KEY (equipeVisiteur) REFERENCES Equipe(equipeId)
);

ALTER TABLE Marquer ADD seconde NUMBER;
ALTER TABLE Ligue MODIFY nom_ligue VARCHAR2(150) ;

CREATE TABLE Marquer(
    minute NUMBER PRIMARY KEY,

    matchId NUMBER NOT NULL,
    joueurId NUMBER NOT NULL,

    CONSTRAINT fk_marquer_match
        FOREIGN KEY (matchId) REFERENCES Match(matchId),
    
    CONSTRAINT fk_marquer_joueur
        FOREIGN KEY (joueurId) REFERENCES Joueur(joueurId)
);

CREATE TABLE Engager(
    saisonId NUMBER NOT NULL,
    joueurId NUMBER NOT NULL,
    equipeId NUMBER NOT NULL,

    CONSTRAINT fk_engager_saison
        FOREIGN KEY (saisonId) REFERENCES Saison(saisonId),

    CONSTRAINT fk_engager_joueur
        FOREIGN KEY (joueurId) REFERENCES Joueur(joueurId),
    
    CONSTRAINT fk_engager_equipe
        FOREIGN KEY (equipeId) REFERENCES Equipe(equipeId)
);

INSERT INTO ligue
SELECT l.id,
       l.name,
       c.name
FROM dataL3.league l, dataL3.country c
WHERE l.country_id = c.id;

INSERT INTO equipe
SELECT DISTINCT
       t.team_api_id,
       t.team_long_name,
       t.team_short_name,
       m.league_id
FROM dataL3.team t, dataL3.match m
WHERE m.home_team_api_id = t.team_api_id;

COMMIT;

CREATE SEQUENCE SEQ_SAISON ;

CREATE OR REPLACE TRIGGER TRIG_SAISON
BEFORE INSERT ON SAISON FOR EACH ROW
BEGIN
  SELECT SEQ_SAISON.NEXTVAL INTO :new.saisonId FROM 
    DUAL;
END;
/

INSERT INTO saison (libelle, dateDeb, dateFin)
SELECT DISTINCT
       m.season AS libelle,
       TO_DATE(SUBSTR(m.season, 1, 4), 'YYYY') AS dateDeb,
       TO_DATE(SUBSTR(m.season, 6, 4), 'YYYY') AS dateFin
FROM dataL3.match m;

COMMIT;

INSERT INTO joueur ( joueurId , nom_joueur , prenom_joueur ,dateNaissance , taille , poids )
SELECT 
    p.player_api_id,
    SUBSTR(p.player_name, 1, INSTR(p.player_name, ' ') - 1) AS PRENOM_JOUEUR,
    SUBSTR(p.player_name, INSTR(p.player_name, ' ') + 1) AS NOM_JOUEUR,
    TO_DATE(p.birthday,'YYYY-MM-DD HH24:MI:SS') AS DATENAISSANCE,
    p.height AS TAILLE,
    p.weight / 2.2046 AS POIDS
FROM dataL3.player p;

COMMIT;

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
and m.away_player_11 is not null;

COMMIT;


INSERT INTO MARQUER (matchId, joueurId, MINUTE)
SELECT m.matchId, j.joueurId, 25
FROM Match m, Equipe el, Equipe ev, Joueur j
WHERE m.EQUIPELOCALE = el.equipeId
  AND m.EQUIPEVISITEUR = ev.equipeId
  AND m.dateMatch = TO_DATE('07/02/2016','DD/MM/YYYY')
  AND el.NOM_EQUIPE = 'Olympique de Marseille'
  AND ev.NOM_EQUIPE = 'Paris Saint-Germain'
  AND UPPER(j.PRENOM_JOUEUR) = 'CABELLA' 
  AND UPPER(j.NOM_JOUEUR) = 'REMY';

COMMIT;

INSERT INTO MARQUER (matchId, joueurId, MINUTE)
SELECT m.matchId, j.joueurId, 2
FROM Match m, Equipe el, Equipe ev, Joueur j
WHERE m.EQUIPELOCALE = el.equipeId
  AND m.EQUIPEVISITEUR = ev.equipeId
  AND m.dateMatch = TO_DATE('07/02/2016','DD/MM/YYYY')
  AND el.NOM_EQUIPE = 'Olympique de Marseille'
  AND ev.NOM_EQUIPE = 'Paris Saint-Germain'
  AND UPPER(j.PRENOM_JOUEUR) = 'IBRAHIMOVIC' 
  AND UPPER(j.NOM_JOUEUR) = 'ZLATAN';

COMMIT;

INSERT INTO MARQUER (matchId, joueurId, MINUTE)
SELECT m.matchId, j.joueurId, 71
FROM Match m, Equipe el, Equipe ev, Joueur j
WHERE m.EQUIPELOCALE = el.equipeId
  AND m.EQUIPEVISITEUR = ev.equipeId
  AND m.dateMatch = TO_DATE('07/02/2016','DD/MM/YYYY')
  AND el.NOM_EQUIPE = 'Olympique de Marseille'
  AND ev.NOM_EQUIPE = 'Paris Saint-Germain'
  AND UPPER(j.PRENOM_JOUEUR) = 'DI MARIA' 
  AND UPPER(j.NOM_JOUEUR) = 'ANGEL';

COMMIT;

UPDATE LIGUE SET PAYS = UPPER(PAYS);

COMMIT;

DELETE FROM MATCH
WHERE EQUIPELOCALE = (
    SELECT e.EQUIPEID
    FROM Equipe e
    WHERE e.NOM_EQUIPE = 'ES Troyes AC'
)
AND (SCOREVISITEUR - SCORELOCALE) = (
    SELECT MAX(SCOREVISITEUR - SCORELOCALE)
    FROM MATCH
    WHERE EQUIPELOCALE = (
        SELECT EQUIPEID
        FROM Equipe
        WHERE NOM_EQUIPE = 'ES Troyes AC'
    )
);

COMMIT;

ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE ;

COMMIT;

CREATE ROLE L3IT24_ADMINISTRATEUR;
CREATE ROLE L3IT24_COMMENTATEUR;
CREATE ROLE L3IT24_INTERNAUTE;

COMMIT;

GRANT SELECT,INSERT ON MARQUER TO L3IT24_COMMENTATEUR;
GRANT SELECT,UPDATE ON MATCH TO L3IT24_COMMENTATEUR;

COMMIT;

GRANT SELECT ON EQUIPE TO L3IT24_INTERNAUTE;
GRANT SELECT ON JOUEUR TO L3IT24_INTERNAUTE;
GRANT SELECT ON SAISON TO L3IT24_INTERNAUTE;
GRANT SELECT ON LIGUE TO L3IT24_INTERNAUTE;
GRANT SELECT ON MATCH TO L3IT24_INTERNAUTE;
GRANT SELECT ON MARQUER TO L3IT24_INTERNAUTE;

COMMIT;

GRANT SELECT, UPDATE, INSERT, DELETE ON EQUIPE TO L3IT24_INTERNAUTE;
GRANT SELECT, UPDATE, INSERT, DELETE ON JOUEUR TO L3IT24_INTERNAUTE;
GRANT SELECT, UPDATE, INSERT, DELETE ON SAISON TO L3IT24_INTERNAUTE;
GRANT SELECT, UPDATE, INSERT, DELETE ON LIGUE TO L3IT24_INTERNAUTE;
GRANT SELECT, UPDATE, INSERT, DELETE ON MATCH TO L3IT24_INTERNAUTE;
GRANT SELECT, UPDATE, INSERT, DELETE ON MARQUER TO L3IT24_INTERNAUTE;

COMMIT;

GRANT L3IT24_ADMINISTRATEUR TO ADMIN;
GRANT L3IT24_COMMENTATEUR TO COMMENTATEUR;
GRANT L3IT24_INTERNAUTE TO INTERNAUTE;

COMMIT;













