INSERT INTO users (name, email, password)
VALUES ('Eva Stanley', 'sebastianguerra@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Dominic Parks', 'victoriaBlackwell@outlook.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Louisa Meyer', 'jacksondjafnsd@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Sue Luna', 'jasonvincent@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Rosalie Garza', 'jacksondavid@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Etta West', 'charlielevy@yahoo.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Margaret Wong', 'makaylaweiss@icloud.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Leroy Jenkins', 'jaycerylonlds@inbox.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties 
(owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code)

VALUES (1, 'Blank corner', 'description', 'https://images.pexels.com/photos/2348723/pexels-photo-384739.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2398423/pexels-photo-3472934.jpeg', 93061, 6, 4, 8, 'Canada', '538 Namsub Highway', 'Sotboske', 'Quebec', '28193' ),
(2, 'Habit mix', 'description', 'https://images.pexels.com/photos/2348723/pexels-photo-384739.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2398423/pexels-photo-3472934.jpeg', 26873, 6, 6, 7, 'Canada', '651 Nami Road', 'Bohbatev', 'Alberta', '83680' ),
(1, 'Speed lamp', 'description', 'https://images.pexels.com/photos/2348723/pexels-photo-384739.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2398423/pexels-photo-3472934.jpeg', 75453, 0, 5, 6, 'Canada', '1650 Hejto Centre', 'Genwezhuj', 'Newfoundland', '44583' ),
(4, 'Headed know', 'description', 'https://images.pexels.com/photos/2348723/pexels-photo-384739.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2398423/pexels-photo-3472934.jpeg', 56324, 0, 5, 5, 'Canada', '513 Powov Grove', 'Jaebvap', 'Ontario', '38917' ),
(6, 'Port out', 'description', 'https://images.pexels.com/photos/2348723/pexels-photo-384739.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2398423/pexels-photo-3472934.jpeg', 76453, 2, 8, 0, 'Canada', '1392 Gaza Junction', 'Upatefpuv', 'Nova Scotia', '28462' ),
(6, 'Fun glad', 'description', 'https://images.pexels.com/photos/2348723/pexels-photo-384739.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2398423/pexels-photo-3472934.jpeg', 24373, 6, 6, 4, 'Canada', '169 Nuwug Circle', 'Vutgapha', 'Newfoundland', '2o4nd' ),
(7, 'Shine twenty', 'description', 'https://images.pexels.com/photos/2348723/pexels-photo-384739.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2398423/pexels-photo-3472934.jpeg', 12734, 1, 7, 8, 'Canada', '340 Dokto Park', 'Upfufa', 'Nova Scotia', '37d3j2' ),
(8, 'Game fill', 'description', 'https://images.pexels.com/photos/2348723/pexels-photo-384739.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2398423/pexels-photo-3472934.jpeg', 45789, 5, 6, 4, 'Canada', '834 Buwmi Road', 'Rotunif', 'Newfoundland', '8s8f93' );

INSERT INTO reservations (guest_id, property_id, start_date, end_date)
VALUES (2, 3, '2018-09-11', '2018-09-26'),
(2, 2, '2019-01-04', '2019-02-01'),
(1, 4, '2021-10-01', '2021-10-14'),
(3, 5, '2014-10-21', '2014-10-21'),
(3, 4, '2016-07-01', '2016-08-01'),
(4, 8, '2018-05-27', '2018-05-27'),
(5, 1, '2022-10-23', '2022-10-23'),
(6, 8, '2015-09-30', '2015-09-30'),
(4, 2, '2023-05-28', '2023-05-28'),
(8, 1, '2023-04-02', '2023-05-02');

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (2, 5, 10, 3, 'messages'),
(1, 4, 1, 4, 'messages'),
(8, 1, 2, 4, 'messages'),
(3, 8, 5, 4, 'messages'),
(4, 2, 7, 5, 'messages'),
(4, 3, 4, 4, 'messages'),
(5, 6, 3, 5, 'messages');
