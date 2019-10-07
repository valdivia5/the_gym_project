--db name on the terminal: the_gym
DROP TABLE bookings;
DROP TABLE members;
DROP TABLE activities;


CREATE TABLE members
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE activities
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  date_and_time VARCHAR(255)
);

CREATE TABLE bookings
(
  id SERIAL8 PRIMARY KEY,
  member_id INT8 REFERENCES members(id),
  activity_id INT8 REFERENCES activities(id)
);


--
-- INSERT INTO activities (name, date_and_time) VALUES ('Leg hour', "29/10/2019 8:00AM");
--
-- INSERT INTO members (first_name, last_name) VALUES ('Ana', 'Pelana');
--
-- INSERT INTO bookings (member_id, activity_id) VALUES (1, 1);
