-- Aufgabe 1
CREATE TABLE
    factions (
        id serial primary key,
        name text,
        description text,
        headquarters text,
        membership integer,
        seat text,
        founding_year integer
    );

INSERT INTO
    factions (
        name,
        description,
        headquarters,
        membership,
        seat,
        founding_year
    )
VALUES
    (
        'Galactic Republic',
        'The democracy governing the galaxy before the formation of the Galactic Empire.',
        'Coruscant',
        1500000,
        'Senate Building',
        -25000
    ),
    (
        'Jedi Order',
        'Protectors of the Galactic Republic and practitioners of the light side of the Force.',
        'Coruscant',
        10000,
        'Jedi Temple',
        -25000
    ),
    (
        'Sith',
        'Practitioners of the dark side of the Force and adversaries of the Jedi Order.',
        'Moraband',
        100,
        'Sith Shrine',
        -7000
    ),
    (
        'Galactic Empire',
        'Autocracy formed from the Galactic Republic, led by the Emperor.',
        'Coruscant',
        2500000,
        'Imperial Palace',
        -19
    ),
    (
        'Rebel Alliance',
        'Rebellion against the Galactic Empire aiming to restore the Galactic Republic.',
        'Yavin IV',
        80000,
        'Great Temple',
        -2
    ),
    (
        'Mandalorians',
        'A warrior culture known for their armor.',
        'Mandalore',
        100000,
        'Keldabe',
        -7000
    ),
    (
        'First Order',
        'Military dictatorship, inspired by the Galactic Empire, seeking galaxy control.',
        'Starkiller Base',
        500000,
        'Command Center',
        21
    ),
    (
        'Resistance',
        'Military force fighting against the First Order, backed by remnants of the New Republic.',
        'D’Qar',
        4000,
        'Resistance Base',
        28
    ),
    (
        'Trade Federation',
        'Powerful trading corporation, known for its blockade of Naboo.',
        'Cato Neimoidia',
        1500,
        'Trade Federation Palace',
        -350
    ),
    (
        'Bounty Hunters Guild',
        'Organization of bounty hunters offering services to the highest bidder.',
        'Tatooine',
        2000,
        'Guild Hall',
        -1000
    ),
    (
        'New Republic',
        'Democratic government formed after the fall of the Galactic Empire.',
        'Chandrila',
        500000,
        'Senate Building',
        5
    ),
    (
        'Knights of Ren',
        'Dark side practitioners under the leadership of Kylo Ren.',
        'Unknown',
        12,
        'Unknown',
        21
    ),
    (
        'Tusken Raiders',
        'Indigenous inhabitants of Tatooine, known as Sand People.',
        'Tatooine',
        20000,
        'Various Encampments',
        -4500
    );

-- Aufgabe 2
Alter table people
add column factions_id integer;

Alter table people add constraint fk_factions foreign key (faction_id) references factions (id) on delete set null;

Select
    people.name,
    faction.name
FROM
    people
    JOIN factions;

-- Aufgabe 3
CREATE TABLE
    starships (
        id SERIAL PRIMARY KEY,
        name TEXT,
        model TEXT,
        manufacturer TEXT,
        cost_in_credits DECIMAL,
        length DECIMAL,
        max_atmosphering_speed INT,
        crew TEXT,
        passengers INT,
        cargo_capacity BIGINT,
        consumables TEXT,
        hyperdrive_rating DECIMAL,
        MGLT INT,
        starship_class TEXT,
        url TEXT
    );

-- Prüfung durch Eintrag
INSERT INTO
    starships (
        name,
        model,
        manufacturer,
        cost_in_credits,
        length,
        max_atmosphering_speed,
        crew,
        passengers,
        cargo_capacity,
        consumables,
        hyperdrive_rating,
        MGLT,
        starship_class,
        url
    )
VALUES
    (
        'Rogue Shadow',
        'SX-3 Stealth Ship',
        'Sienar Fleet Systems',
        240000,
        21.5,
        1150,
        '1',
        2,
        15000,
        '5 days',
        1.5,
        95,
        'Stealth ship',
        'http://swapi.dev/api/starships/100/'
    );

-- Terminal: cd Downloads; cp starships.csv /tmp/
COPY starships (
    name,
    model,
    manufacturer,
    cost_in_credits,
    length,
    max_atmosphering_speed,
    crew,
    passengers,
    cargo_capacity,
    consumables,
    hyperdrive_rating,
    MGLT,
    starship_class,
    url
)
FROM
    '/tmp/starships.csv' DELIMITER ';' CSV HEADER;

-- Aufgabe 4
CREATE TABLE
    starship_journeys (
        id SERIAL PRIMARY KEY,
        people_id INTEGER,
        starship_id INTEGER,
        journey_start DATE,
        journey_end DATE,
        role TEXT,
        freight boolean,
        freight_content TEXT,
        FOREIGN KEY (people_id) references people (id),
        FOREIGN KEY (starship_id) references starships (id)
    );

-- Testdaten
INSERT INTO
    starship_journeys (
        people_id,
        starship_id,
        journey_start,
        journey_end,
        role,
        freight,
        freight_content
    )
VALUES
    (
        1,
        18,
        '2023-01-05',
        '2023-01-25',
        'pilot',
        true,
        'Kyber crystals'
    ),
    (
        2,
        22,
        '2023-01-15',
        '2023-01-30',
        'pilot',
        false,
        NULL
    ),
    (
        4,
        15,
        '2023-02-10',
        '2023-02-27',
        'passenger',
        true,
        'Rebel documents'
    ),
    (
        6,
        9,
        '2023-03-08',
        '2023-03-25',
        'pilot',
        false,
        NULL
    ),
    (
        7,
        31,
        '2023-04-02',
        '2023-04-19',
        'passenger',
        true,
        'Medical supplies'
    ),
    (
        8,
        5,
        '2023-04-23',
        '2023-05-15',
        'pilot',
        true,
        'Droid parts'
    ),
    (
        11,
        12,
        '2023-06-01',
        '2023-06-22',
        'pilot',
        false,
        NULL
    ),
    (
        13,
        2,
        '2023-07-18',
        '2023-08-09',
        'passenger',
        true,
        'Alien artifacts'
    ),
    (
        14,
        6,
        '2023-08-13',
        '2023-08-28',
        'pilot',
        false,
        NULL
    ),
    (
        15,
        29,
        '2023-09-03',
        '2023-09-20',
        'passenger',
        true,
        'Exotic spices'
    ),
    (
        18,
        21,
        '2023-11-06',
        '2023-11-30',
        'pilot',
        false,
        NULL
    ),
    (
        19,
        33,
        '2023-12-12',
        '2023-12-26',
        'passenger',
        true,
        'Confidential reports'
    ),
    (
        20,
        3,
        '2024-01-14',
        '2024-01-29',
        'pilot',
        false,
        NULL
    ),
    (
        21,
        8,
        '2024-02-04',
        '2024-02-25',
        'passenger',
        true,
        'Rare minerals'
    ),
    (
        24,
        27,
        '2024-03-07',
        '2024-03-22',
        'pilot',
        true,
        'Smuggled goods'
    ),
    (
        25,
        11,
        '2024-04-01',
        '2024-04-11',
        'pilot',
        false,
        NULL
    ),
    (
        26,
        16,
        '2024-05-08',
        '2024-05-23',
        'passenger',
        true,
        'Stolen paintings'
    ),
    (
        28,
        4,
        '2024-06-03',
        '2024-06-17',
        'pilot',
        true,
        'Imperial uniforms'
    ),
    (
        29,
        14,
        '2024-06-30',
        '2024-07-15',
        'passenger',
        false,
        NULL
    ),
    (
        30,
        23,
        '2024-08-08',
        '2024-08-23',
        'pilot',
        true,
        'Historical texts'
    ),
    (
        31,
        10,
        '2024-09-12',
        '2024-09-27',
        'pilot',
        false,
        NULL
    ),
    (
        32,
        36,
        '2024-10-05',
        '2024-10-19',
        'passenger',
        true,
        'Luxury foodstuff'
    ),
    (
        34,
        7,
        '2024-11-03',
        '2024-11-18',
        'pilot',
        true,
        'Engine parts'
    ),
    (
        35,
        20,
        '2024-12-09',
        '2024-12-24',
        'pilot',
        false,
        NULL
    ),
    (
        36,
        25,
        '2025-01-06',
        '2025-01-21',
        'passenger',
        true,
        'Endangered species'
    ),
    (
        37,
        13,
        '2025-02-11',
        '2025-02-26',
        'pilot',
        true,
        'Holographic sculptures'
    ),
    (
        38,
        17,
        '2025-03-10',
        '2025-03-20',
        'pilot',
        false,
        NULL
    ),
    (
        39,
        1,
        '2025-04-02',
        '2025-04-17',
        'passenger',
        true,
        'Prohibited literature'
    ),
    (
        40,
        34,
        '2025-05-07',
        '2025-05-22',
        'pilot',
        true,
        'Reactor fuel rods'
    ),
    (
        41,
        24,
        '2025-06-06',
        '2025-06-21',
        'pilot',
        false,
        NULL
    ),
    (
        42,
        28,
        '2025-07-03',
        '2025-07-18',
        'passenger',
        true,
        'Vaccines'
    ),
    (
        43,
        26,
        '2025-08-14',
        '2025-08-29',
        'pilot',
        true,
        'Agricultural machinery'
    ),
    (
        44,
        30,
        '2025-09-08',
        '2025-09-23',
        'pilot',
        false,
        NULL
    ),
    (
        45,
        32,
        '2025-10-03',
        '2025-10-18',
        'passenger',
        true,
        'Aged wines'
    ),
    (
        46,
        35,
        '2025-11-02',
        '2025-11-17',
        'pilot',
        true,
        'Robot companions'
    ),
    (
        47,
        18,
        '2025-12-05',
        '2025-12-20',
        'pilot',
        false,
        NULL
    ),
    (
        48,
        15,
        '2026-01-10',
        '2026-01-25',
        'passenger',
        true,
        'Cryogenic capsules'
    ),
    (
        49,
        9,
        '2026-02-14',
        '2026-02-28',
        'pilot',
        true,
        'Meteorite samples'
    ),
    (
        50,
        5,
        '2026-03-07',
        '2026-03-22',
        'pilot',
        false,
        NULL
    );