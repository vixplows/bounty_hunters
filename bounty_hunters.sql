DROP TABLE IF EXISTS bounties;

CREATE TABLE bounties(
id SERIAL2 PRIMARY KEY,
name VARCHAR(255),
species VARCHAR(255),
homeworld VARCHAR(255),
bounty_value INT2

);