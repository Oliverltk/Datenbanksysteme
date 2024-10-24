-- Aufgabe 1
CREATE TABLE factions(
    id serial primary key,
    name text,
    description text,
    headquarters text,
    membership integer,
    seat text,
    founding_year integer
);

INSERT INTO factions (name, description, headquarters, membership, seat, founding_year) VALUES
('Galactic Republic', 'The democracy governing the galaxy before the formation of the Galactic Empire.', 'Coruscant', 1500000, 'Senate Building', -25000),
('Jedi Order', 'Protectors of the Galactic Republic and practitioners of the light side of the Force.', 'Coruscant', 10000, 'Jedi Temple', -25000),
('Sith', 'Practitioners of the dark side of the Force and adversaries of the Jedi Order.', 'Moraband', 100, 'Sith Shrine', -7000),
('Galactic Empire', 'Autocracy formed from the Galactic Republic, led by the Emperor.', 'Coruscant', 2500000, 'Imperial Palace', -19),
('Rebel Alliance', 'Rebellion against the Galactic Empire aiming to restore the Galactic Republic.', 'Yavin IV', 80000, 'Great Temple', -2),
('Mandalorians', 'A warrior culture known for their armor.', 'Mandalore', 100000, 'Keldabe', -7000),
('First Order', 'Military dictatorship, inspired by the Galactic Empire, seeking galaxy control.', 'Starkiller Base', 500000, 'Command Center', 21),
('Resistance', 'Military force fighting against the First Order, backed by remnants of the New Republic.', 'D’Qar', 4000, 'Resistance Base', 28),
('Trade Federation', 'Powerful trading corporation, known for its blockade of Naboo.', 'Cato Neimoidia', 1500, 'Trade Federation Palace', -350),
('Bounty Hunters Guild', 'Organization of bounty hunters offering services to the highest bidder.', 'Tatooine', 2000, 'Guild Hall', -1000),
('New Republic', 'Democratic government formed after the fall of the Galactic Empire.', 'Chandrila', 500000, 'Senate Building', 5),
('Knights of Ren', 'Dark side practitioners under the leadership of Kylo Ren.', 'Unknown', 12, 'Unknown', 21),
('Tusken Raiders', 'Indigenous inhabitants of Tatooine, known as Sand People.', 'Tatooine', 20000, 'Various Encampments', -4500);

-- Aufgabe 2
Alter table people add column factions_id integer;

Alter table people add constraint fk_factions foreign key (faction_id) references factions(id) on delete set null;

Select people.name, faction.name FROM people JOIN factions;

-- Aufgabe 3
Alter table people add column faction_id integer;

Update people set faction_id = faction.id;

-- Aufgabe 4


