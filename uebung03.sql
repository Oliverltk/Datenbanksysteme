-- Aufgabe 1

create view
    persons_with_freight as
select
    people.id as people_id,
    people.name as people_name,
    people.planet as people_planet,
    starship_journeys.journey_start as journey_start,
    starship_journeys.journey_end as journey_end,
    starships.name as starship_name
from
    people
    join starships_journeys