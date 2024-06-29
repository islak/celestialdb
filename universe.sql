-- Drop the existing universe database if it exists
DROP DATABASE IF EXISTS universe;

-- Create the database
CREATE DATABASE universe;

-- Connect to the new database
\c universe

-- Create the galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    distance INTEGER NOT NULL,
    has_life BOOLEAN,
    galaxy_type TEXT NOT NULL
);

-- Create the star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INTEGER REFERENCES galaxy(galaxy_id),
    type VARCHAR(50) NOT NULL,
    age_in_millions_of_years NUMERIC NOT NULL,
    has_planets BOOLEAN
);

-- Create the planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INTEGER REFERENCES star(star_id),
    is_spherical BOOLEAN NOT NULL,
    distance_from_star INTEGER NOT NULL,
    has_life BOOLEAN,
    planet_type TEXT NOT NULL
);

-- Create the moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INTEGER REFERENCES planet(planet_id),
    diameter INTEGER NOT NULL,
    has_life BOOLEAN
);

-- Create the space_station table
CREATE TABLE space_station (
    space_station_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INTEGER REFERENCES galaxy(galaxy_id),
    capacity INTEGER NOT NULL,
    operational BOOLEAN NOT NULL
);

-- Insert data into galaxy
INSERT INTO galaxy (name, distance, has_life, galaxy_type)
VALUES 
('Milky Way', 0, TRUE, 'Spiral'),
('Andromeda', 2500000, FALSE, 'Spiral'),
('Triangulum', 3000000, FALSE, 'Spiral'),
('Whirlpool', 23000000, FALSE, 'Spiral'),
('Sombrero', 29000000, FALSE, 'Elliptical'),
('Black Eye', 17000000, FALSE, 'Spiral');

-- Insert data into star
INSERT INTO star (name, galaxy_id, type, age_in_millions_of_years, has_planets)
VALUES 
('Sun', 1, 'G-Type', 4600, TRUE),
('Proxima Centauri', 2, 'M-Type', 4500, TRUE),
('Betelgeuse', 1, 'M-Type', 8500, FALSE),
('Sirius', 3, 'A-Type', 300, TRUE),
('Vega', 4, 'A-Type', 455, TRUE),
('Aldebaran', 5, 'K-Type', 6500, TRUE);

-- Insert data into planet
INSERT INTO planet (name, star_id, is_spherical, distance_from_star, has_life, planet_type)
VALUES 
('Earth', 1, TRUE, 1, TRUE, 'Terrestrial'),
('Mars', 1, TRUE, 1.5, FALSE, 'Terrestrial'),
('Venus', 1, TRUE, 0.7, FALSE, 'Terrestrial'),
('Proxima b', 2, TRUE, 0.05, FALSE, 'Exoplanet'),
('Sirius b', 4, TRUE, 1.2, FALSE, 'Exoplanet'),
('Alpha Centauri B', 2, TRUE, 0.3, FALSE, 'Exoplanet'),
('Gliese 581 d', 2, TRUE, 0.22, FALSE, 'Exoplanet'),
('Kepler-452b', 1, TRUE, 1.05, FALSE, 'Exoplanet'),
('Kepler-22b', 1, TRUE, 0.85, FALSE, 'Exoplanet'),
('Wolf 1061c', 2, TRUE, 0.14, FALSE, 'Exoplanet'),
('HD 40307 g', 1, TRUE, 0.61, FALSE, 'Exoplanet'),
('TRAPPIST-1d', 2, TRUE, 0.08, FALSE, 'Exoplanet');

-- Insert data into moon
INSERT INTO moon (name, planet_id, diameter, has_life)
VALUES 
('Moon', 1, 3474, FALSE),
('Phobos', 2, 22, FALSE),
('Deimos', 2, 12, FALSE),
('Io', 3, 3643, FALSE),
('Europa', 3, 3122, FALSE),
('Ganymede', 3, 5268, FALSE),
('Callisto', 3, 4820, FALSE),
('Titan', 6, 5150, FALSE),
('Rhea', 6, 1528, FALSE),
('Iapetus', 6, 1469, FALSE),
('Dione', 6, 1122, FALSE),
('Tethys', 6, 1062, FALSE),
('Enceladus', 6, 504, FALSE),
('Mimas', 6, 396, FALSE),
('Oberon', 7, 1523, FALSE),
('Titania', 7, 1578, FALSE),
('Umbriel', 7, 1169, FALSE),
('Ariel', 7, 1158, FALSE),
('Miranda', 7, 471, FALSE),
('Triton', 8, 2706, FALSE);

-- Insert data into space_station
INSERT INTO space_station (name, galaxy_id, capacity, operational)
VALUES 
('ISS', 1, 10, TRUE),
('Voyager Station', 1, 400, TRUE),
('Andromeda Station', 2, 150, FALSE),
('Triangulum Base', 3, 75, TRUE),
('Whirlpool Outpost', 4, 50, TRUE);
