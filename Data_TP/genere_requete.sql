spool charger_engager.sql;

set serveroutput on;
declare 
 i integer := 1;
 query varchar2(5000) := 'select distinct m.home_team_api_id, m.home_player_1, s.saisonid
from datal3.match m, saison s
where m.season = s.libelle
and m.home_player_1 is not null';
begin
  dbms_output.put_line('insert into engager (equipeid, joueurid, saisonid)');
  loop
    dbms_output.put_line(replace(query, 'player_1', 'player_' || i));
    dbms_output.put_line('union');
    dbms_output.put_line(
      replace(replace(query, 'player_1', 'player_' || i),'home', 'away')
    );
    exit when i = 11;
    dbms_output.put_line('union');
    i := i + 1;
  end loop;
end;
/

spool off