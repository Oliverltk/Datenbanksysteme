-- Aufgabe 1

Create view
    persons_with_freight as
select
    people.id as people_id,
    people.name as people_name,
    people.planet as people_planet,
    starship_journeys.journey_start as journey_start,
    starship_journeys.journey_end as journey_end,
    starships.name as starship_name,
    starship_journeys.freight_content as freight_content
from
    people
    join starships_journeys ON (people.id = starship_journeys.people_id)
    join starships ON (starships.id = starship_journeys.starship_id) WHERE freight = true;

-- Aufgabe 2
