-- Aufgabe 1
Create view
    persons_with_freight as
select
    people.id as people_id,
    people.name as people_name,
    planet.name as planet_name,
    starship_journeys.journey_start as journey_start,
    starship_journeys.journey_end as journey_end,
    starships.name as starship_name,
    starship_journeys.freight_content as freight_content
from
    people
    join starship_journeys ON (people.id = starship_journeys.people_id)
    join starships ON (starships.id = starship_journeys.starship_id)
    join planet ON (people.planet_id = planet.id)
WHERE
    starship_journeys.freight = true;

SELECT
    *
from
    persons_with_freight
where
    planet_name = 'Tatooine';

SELECT
    person_name,
    COUNT(person_name)
FROM
    persons_with_freight
group by
    person_name;

SELECT
    *
FROM
    detailed_starship_journeys_with_freight
WHERE
    planet_name = 'Tatooine';

SELECT
    person_name,
    COUNT(*)
FROM
    detailed_starship_journeys_with_freight
GROUP BY
    person_name
ORDER BY
    COUNT(*) DESC;

-- Aufgabe 2
CREATE unique index on factions(name);

INSERT INTO
    factions (name, description)
VALUES
    ('Sith', 'The really bad guys');


-- Aufgabe 3
ALTER Table people drop constraint planet_id;

DELETE from planet where planet.name='Tatooine';

BEGIN;
ALTER TABLE people drop constraint people_planet_id_fkey;
ALTER TABLE people alter column planet_id DROP NOT NULL;
ALTER TABLE people add constraint people_planet_id_fkey FOREIGN KEY (planet_id) references planet(id) on delete set null;
COMMIT;

-- Aufgabe 5
SELECT people.name, factions.name from people left join factions on (people.faction_id = factions.id);
SELECT people.name, factions.name from factions right join people on (people.faction_id = factions.id);


