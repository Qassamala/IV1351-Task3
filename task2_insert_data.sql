INSERT INTO address (street, zip, city) VALUES ('Kistagangen 16', '16440', 'Kista'), ('Borgarfjordsgatan  7', '16440', 'Kista'), ('Forumvagen 14', '13153', 'Nacka');
INSERT INTO student (personNumber, firstName, lastName, age, emailaddress, phoneNumber, address_id) VALUES ('198501010000', 'Mats', 'Larsson', 36, 'mlarson@gmail.com', '0705331221', 1), ('198601010000', 'Peter', 'Larsson', 35, 'plarson@gmail.com', '0705331222', 1), ('199701010000', 'Per', 'Persson', 24, 'ppersson@gmail.com', '0706331111', 2), ('199301010000', 'Fia', 'Karlsson', 28, 'fkarlsson@gmail.com', '0706331444', 3), ('199101010000', 'Linda', 'Eriksson', 30, 'fkarlsson@gmail.com', '0706331488', 3);
INSERT INTO sibling VALUES (1,2), (2,1);
INSERT INTO instrument_skill VALUES (1, 'guitar', 'beginner'), (1, 'piano', 'advanced'), (2, 'guitar', 'beginner'), (2, 'piano', 'intermediate'), (3, 'guitar', 'beginner'), (3, 'piano', 'advanced'), (4, 'piano', 'intermediate'), (4, 'guitar', 'intermediate'), (5, 'guitar', 'beginner');

INSERT INTO parent_contact_detail (parent1phonenumber, parent2phonenumber) VALUES (0709998877, 0708887799), (0704445566, 0706665544), (0706668833, 0702223344), (0701112233, 0734567788);
INSERT INTO student_parent_contact_detail (student_id, parent_contact_detail_id) VALUES (1, 1), (2, 1), (3, 2), (4, 3), (5, 4);

INSERT INTO inventory_instrument (type, brand, available, fee) VALUES ('guitar', 'Carlsberg', true, 5.5), ('guitar', 'Carlsberg', true, 5.5), ('guitar', 'Mozart', true, 10), ('flute', 'Bach', true, 8), ('flute', 'Bach', true, 8), ('flute', 'Heineken', true, 3);


INSERT INTO instructor (personNumber, firstName, lastName, age, emailaddress, phoneNumber, teachesEnsemble, address_id) VALUES ('198501020000', 'Mats', 'Instructorsson', 36, 'minstructorsson@gmail.com', '0705331111', true, 1), ('198301010000', 'Peter', 'Helgessonn', 37, 'phelgesson@gmail.com', '0705334444', false, 1), ('199701010000', 'Stig', 'Persson', 24, 'spersson@gmail.com', '0706331111', true, 3);
INSERT INTO instructor (personNumber, firstName, lastName, age, emailaddress, phoneNumber, teachesEnsemble, address_id) VALUES ('198001020000', 'Lars', 'Johansson', 41, 'ljohansson@gmail.com', '070533000', true, 2);
INSERT INTO instructor_instrument (instructor_id, instrument) VALUES (1, 'guitar'), (1, 'piano'), (2, 'guitar'), (2, 'piano'), (3, 'guitar'), (3, 'piano'), (4, 'guitar'), (4, 'flute');

INSERT INTO instructor_time_slot (instructor_id, startTime, endTime) VALUES (1, '2021-12-10 09:30:00', '2021-12-10 10:30:00'), (1, '2021-12-10 11:30:00', '2021-12-10 16:00:00'), (2, '2021-12-10 11:30:00', '2021-12-10 16:00:00');

INSERT INTO pricing_scheme (beginnerPrice, intermediatePrice, advancedPrice, individualLessonPrice, groupLessonPrice, siblingDiscountRate) VALUES (4.5, 4.5, 6, 3, 2, 0.1);

INSERT INTO individual_lesson (instrument, skillLevel, startTime, endTime, student_id, pricing_scheme_id, instructor_id) VALUES ('guitar', 'beginner', '2021-12-10 09:30:00', '2021-12-10 10:30:00', 1, 1, 1), ('guitar', 'beginner', '2021-12-17 09:30:00', '2021-12-17 10:30:00', 1, 1, 1), ('guitar', 'beginner', '2021-12-23 09:30:00', '2021-12-23 10:30:00', 1, 1, 2), ('guitar', 'beginner', '2021-12-16 09:30:00', '2021-12-16 10:30:00', 2, 1, 2), ('piano', 'advanced', '2021-12-16 09:30:00', '2021-12-16 10:30:00', 1, 1, 3), ('piano', 'advanced', '2021-12-18 09:30:00', '2021-12-18 10:30:00', 3, 1, 2);

INSERT INTO group_lesson (instrument, skillLevel, startTime, endTime, minStudents, maxStudents, pricing_scheme_id, instructor_id) VALUES ('guitar', 'beginner', '2021-11-10 09:30:00', '2021-11-10 10:30:00', 2, 5, 1, 1), ('guitar', 'beginner', '2021-11-11 09:30:00', '2021-11-11 10:30:00', 2, 5, 1, 1), ('guitar', 'beginner', '2021-12-06 09:30:00', '2021-12-06 10:30:00', 2, 5, 1, 1), ('guitar', 'advanced', '2021-12-05 09:30:00', '2021-12-05 10:30:00', 3, 10, 1, 3), ('guitar', 'advanced', '2021-10-05 09:30:00', '2021-10-05 10:30:00', 3, 10, 1, 3);

INSERT INTO ensemble (genre, skillLevel, startTime, endTime, minStudents, maxStudents, pricing_scheme_id, instructor_id) VALUES ('gospel band', 'beginner', '2021-11-09 09:30:00', '2021-11-09 10:30:00', 2, 5, 1, 1), ('gospel', 'beginner', '2021-11-18 09:30:00', '2021-11-18 10:30:00', 2, 5, 1, 3), ('punk', 'beginner', '2021-12-06 09:30:00', '2021-12-06 10:30:00', 2, 5, 1, 4), ('punk', 'advanced', '2021-10-05 09:30:00', '2021-10-05 10:30:00', 3, 10, 1, 4);
INSERT INTO ensemble (genre, skillLevel, startTime, endTime, minStudents, maxStudents, pricing_scheme_id, instructor_id) VALUES ('gospel band', 'beginner', '2022-01-10 09:30:00', '2022-01-10 10:30:00', 2, 5, 1, 1), ('gospel', 'beginner', '2022-01-11 09:30:00', '2022-01-11 10:30:00', 2, 5, 1, 3), ('punk', 'beginner', '2022-01-12 09:30:00', '2022-01-12 10:30:00', 2, 5, 1, 4), ('punk', 'advanced', '2022-01-13 09:30:00', '2022-01-13 10:30:00', 3, 10, 1, 4);

INSERT INTO lesson_instrument (ensemble_id, instrument) VALUES (1, 'guitar'), (1, 'piano'), (2, 'piano'), (2, 'guitar'), (3, 'guitar'), (3, 'flute'), (4, 'flute'), (4, 'guitar');

INSERT INTO student_ensemble (student_id, ensemble_id) VALUES (1, 1), (1, 2), (2,1), (3, 1), (3,2), (1,3), (5,3);
INSERT INTO student_ensemble (student_id, ensemble_id) VALUES (1, 5), (1, 6), (2,5), (3, 5), (3,6), (1,7), (5,7);

INSERT INTO student_group_lesson (student_id, group_lesson_id) VALUES (1, 1), (2, 1), (3,1), (1, 2), (3,2), (5,2), (5,3);

