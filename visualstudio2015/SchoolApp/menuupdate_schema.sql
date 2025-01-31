

drop table menus;

CREATE TABLE menus1 (
    menu_id INT IDENTITY(1,1) PRIMARY KEY,
    menuname NVARCHAR(100) NOT NULL UNIQUE,
    parent_id INT NULL,  -- New column for parent-child relationships
    FOREIGN KEY (parent_id) REFERENCES menus1(menu_id) 
);



-- Insert Parent Menu (Main Menus)
INSERT INTO menus1 (menuname, parent_id) VALUES ('Dashboard', NULL);
INSERT INTO menus1 (menuname, parent_id) VALUES ('Students', NULL);
INSERT INTO menus1 (menuname, parent_id) VALUES ('Teachers', NULL);
INSERT INTO menus1 (menuname, parent_id) VALUES ('Courses', NULL);
INSERT INTO menus1 (menuname, parent_id) VALUES ('Settings', NULL);

-- Insert Submenus (Child Menus for Courses)
INSERT INTO menus1 (menuname, parent_id) VALUES ('AI', (SELECT menu_id FROM menus1 WHERE menuname='Courses'));
INSERT INTO menus1 (menuname, parent_id) VALUES ('Fullstack', (SELECT menu_id FROM menus1 WHERE menuname='Courses'));
INSERT INTO menus1 (menuname, parent_id) VALUES ('Data Science', (SELECT menu_id FROM menus1 WHERE menuname='Courses'));















-- Create the Countries table
CREATE TABLE countries (
    id INT PRIMARY KEY identity,  -- Automatically incrementing primary key
    name VARCHAR(255) NOT NULL           -- Name of the country
);



select * from  tbl_users;


-- Insert sample data into the Countries table
INSERT INTO countries (name) VALUES
('USA'),
('Canada'),
('UK');

-- Create the States table
CREATE TABLE states (
    id INT PRIMARY KEY identity,   -- Automatically incrementing primary key
    name VARCHAR(255) NOT NULL,           -- Name of the state
    country_id INT,                       -- Foreign key linking to the countries table
    FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE   -- Foreign key constraint
);

-- Insert sample data into the States table
INSERT INTO states (name, country_id) VALUES
('California', 1),
('Texas', 1),
('Ontario', 2),
('Alberta', 2),
('England', 3),
('Scotland', 3);

-- Create the Cities table
CREATE TABLE cities (
    id INT PRIMARY KEY identity,   -- Automatically incrementing primary key
    name VARCHAR(255) NOT NULL,           -- Name of the city
    state_id INT,                         -- Foreign key linking to the states table
    FOREIGN KEY (state_id) REFERENCES states(id) ON DELETE CASCADE  -- Foreign key constraint
);

-- Insert sample data into the Cities table
INSERT INTO cities (name, state_id) VALUES
('Los Angeles', 1),
('Houston', 2),
('Toronto', 3),
('Calgary', 4),
('London', 5),
('Edinburgh', 6);

-- Query to get country, state, and city information for cascading dropdowns
SELECT 
    c.name AS country_name,
    s.name AS state_name,
    ci.name AS city_name
FROM 
    countries c
LEFT JOIN 
    states s ON c.id = s.country_id
LEFT JOIN 
    cities ci ON s.id = ci.state_id
ORDER BY 
    c.name, s.name, ci.name;
