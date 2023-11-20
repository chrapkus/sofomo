-- Create Table A and insert values
DROP TABLE IF EXISTS table_a
;
CREATE TABLE IF NOT EXISTS table_a (
    dimension_1 varchar,
    dimension_2 varchar,
    dimension_3 varchar,
    measure_1 int
)
;
INSERT INTO table_a (dimension_1, dimension_2, dimension_3, measure_1)
VALUES
    ('a', 'I', 'K', 1),
    ('a', 'J', 'L', 7),
    ('b', 'I', 'M', 2),
    ('c', 'J', 'N', 5)
;

-- Create Table B and insert values
DROP TABLE IF EXISTS table_b
;
CREATE TABLE IF NOT EXISTS table_b (
    dimension_1 varchar,
    dimension_2 varchar,
    measure_2 int
)
;
INSERT INTO table_b (dimension_1, dimension_2, measure_2)
VALUES
    ('a', 'J', 7),
    ('b', 'J', 10),
    ('d', 'J', 4)
;

-- Create Table MAP and insert values
DROP TABLE IF EXISTS table_map
;
CREATE TABLE IF NOT EXISTS table_map (
    dimension_1 varchar,
    correct_dimension_2 varchar
)
;
INSERT INTO table_map (dimension_1, correct_dimension_2)
VALUES
    ('a', 'W'),
    ('a', 'W'),
    ('b', 'X'),
    ('c', 'Y'),
    ('b', 'X'),
    ('d', 'Z')
;
