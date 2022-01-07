CREATE DATABASE soundgood_db;
\c soundgood_db;
CREATE TABLE address(id SERIAL PRIMARY KEY, street VARCHAR(500) NOT NULL, zip VARCHAR(500) NOT NULL, city VARCHAR(500) NOT NULL);
CREATE TABLE student(id SERIAL PRIMARY KEY,personNumber VARCHAR(12) UNIQUE NOT NULL,firstName VarChar(500) NOT NULL,lastName VarChar(500) NOT NULL,age Integer NOT NULL,emailAddress VarChar(500) NOT NULL,phoneNumber VarChar(500) NOT NULL,address_id INT NOT NULL,CONSTRAINT FKADDRESS FOREIGN KEY(address_id)REFERENCES address(id) ON DELETE SET NULL);
CREATE TABLE sibling(student_id Integer NOT NULL, student_sibling_id Integer NOT NULL,CONSTRAINT STUDENTIDSIBLINGID PRIMARY KEY(student_id, student_sibling_id), CONSTRAINT FKSTUDENT FOREIGN KEY(student_id)REFERENCES student(id) ON DELETE CASCADE);
CREATE TABLE instrument_skill(student_id Integer NOT NULL, instrument VARCHAR(500) NOT NULL, level VARCHAR(500) NOT NULL,CONSTRAINT STUDENTIDINSTRUMENT PRIMARY KEY(student_id, instrument), CONSTRAINT FKSTUDENT FOREIGN KEY(student_id)REFERENCES student(id) ON DELETE CASCADE);
CREATE TABLE inventory_instrument(id SERIAL PRIMARY KEY, type VARCHAR(500) NOT NULL, brand VARCHAR(500) NOT NULL, available BOOLEAN NOT NULL, fee DECIMAL(5,2) NOT NULL);
CREATE TABLE instrument_rental(student_id Integer NOT NULL, inventory_instrument_id Integer NOT NULL, startDate Timestamp NOT NULL, endDate Timestamp NOT NULL, returnedDate Timestamp, fee DECIMAL(5,2) NOT NULL, returned BOOLEAN NOT NULL, CONSTRAINT STUDENTIDINVENTORYINSTRUMENTIDSTARTDATE PRIMARY KEY(student_id, inventory_instrument_id, startDate), CONSTRAINT FKSTUDENT FOREIGN KEY(student_id)REFERENCES student(id) ON DELETE CASCADE, CONSTRAINT FKINVENTORYINSTRUMENT FOREIGN KEY(inventory_instrument_id)REFERENCES inventory_instrument(id) ON DELETE CASCADE);
CREATE TABLE parent_contact_detail(id SERIAL PRIMARY KEY, parent1PhoneNumber VARCHAR(500) NOT NULL, parent2PhoneNumber VARCHAR(500) NOT NULL);
CREATE TABLE student_parent_contact_detail(student_id Integer NOT NULL, parent_contact_detail_id Integer NOT NULL,CONSTRAINT STUDENTIDPARENTCONTACTDETAILID PRIMARY KEY(student_id, parent_contact_detail_id), CONSTRAINT FKSTUDENT FOREIGN KEY(student_id)REFERENCES student(id) ON DELETE CASCADE, CONSTRAINT FKPARENTCONTACTDETAIL FOREIGN KEY(parent_contact_detail_id)REFERENCES parent_contact_detail(id) ON DELETE CASCADE);

CREATE TABLE instructor(id SERIAL PRIMARY KEY,personNumber VARCHAR(12) UNIQUE NOT NULL,firstName VarChar(500) NOT NULL,lastName VarChar(500) NOT NULL,age Integer NOT NULL,emailAddress VarChar(500) NOT NULL,phoneNumber VarChar(500) NOT NULL, teachesEnsemble BOOLEAN NOT NULL , address_id INT,CONSTRAINT FKADDRESS FOREIGN KEY(address_id)REFERENCES address(id) ON DELETE SET NULL);	
CREATE TABLE instructor_time_slot(instructor_id Integer NOT NULL, startTime Timestamp NOT NULL, endTime Timestamp NOT NULL, CONSTRAINT INSTRUCTORIDSTARTTIME PRIMARY KEY(instructor_id, startTime), CONSTRAINT FKINSTRUCTOR FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE CASCADE);
CREATE TABLE instructor_instrument(instructor_id Integer NOT NULL, instrument VARCHAR(500) NOT NULL,CONSTRAINT INSTRUCTORIDINSTRUMENT PRIMARY KEY(instructor_id, instrument), CONSTRAINT FKINSTRUCTOR FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE CASCADE);

CREATE TABLE pricing_scheme(id SERIAL PRIMARY KEY, beginnerPrice DECIMAL(5,2) NOT NULL, intermediatePrice DECIMAL(5,2) NOT NULL, advancedPrice DECIMAL(5,2) NOT NULL, individualLessonPrice DECIMAL(5,2) NOT NULL, groupLessonPrice DECIMAL(5,2) NOT NULL, siblingDiscountRate DECIMAL(5,2) NOT NULL);

CREATE TABLE individual_lesson(id SERIAL PRIMARY KEY, instrument VARCHAR(500) NOT NULL, skillLevel VARCHAR(500) NOT NULL, startTime Timestamp NOT NULL, endTime Timestamp NOT NULL, student_id Integer NOT NULL, pricing_scheme_id Integer NOT NULL, instructor_id Integer NOT NULL, CONSTRAINT FKSTUDENT FOREIGN KEY(student_id)REFERENCES student(id) ON DELETE CASCADE,CONSTRAINT FKINSTRUCTOR FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE CASCADE, CONSTRAINT FKPRICINGSCHEME FOREIGN KEY(pricing_scheme_id) REFERENCES pricing_scheme(id) ON DELETE CASCADE );

CREATE TABLE group_lesson(id SERIAL PRIMARY KEY, instrument VARCHAR(500) NOT NULL, skillLevel VARCHAR(500) NOT NULL, startTime Timestamp NOT NULL, endTime Timestamp NOT NULL, minStudents Integer NOT NULL, maxStudents Integer NOT NULL, pricing_scheme_id Integer NOT NULL, instructor_id Integer NOT NULL,CONSTRAINT FKINSTRUCTOR FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE CASCADE, CONSTRAINT FKPRICINGSCHEME FOREIGN KEY(pricing_scheme_id) REFERENCES pricing_scheme(id) ON DELETE CASCADE );
CREATE TABLE student_group_lesson(student_id Integer NOT NULL, group_lesson_id Integer NOT NULL,CONSTRAINT STUDENTIDGROUPLESSONID PRIMARY KEY(student_id, group_lesson_id), CONSTRAINT FKSTUDENT FOREIGN KEY(student_id) REFERENCES student(id) ON DELETE CASCADE, CONSTRAINT FKGROUPLESSON FOREIGN KEY(group_lesson_id)REFERENCES group_lesson(id) ON DELETE CASCADE);

CREATE TABLE ensemble(id SERIAL PRIMARY KEY, genre VARCHAR(500) NOT NULL, skillLevel VARCHAR(500) NOT NULL, startTime Timestamp NOT NULL, endTime Timestamp NOT NULL, minStudents Integer NOT NULL, maxStudents Integer NOT NULL, pricing_scheme_id Integer NOT NULL, instructor_id Integer NOT NULL,CONSTRAINT FKINSTRUCTOR FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE CASCADE, CONSTRAINT FKPRICINGSCHEME FOREIGN KEY(pricing_scheme_id) REFERENCES pricing_scheme(id) ON DELETE CASCADE );
CREATE TABLE student_ensemble(student_id Integer NOT NULL, ensemble_id Integer NOT NULL, CONSTRAINT STUDENTIDENSEMBLEID PRIMARY KEY(student_id, ensemble_id), CONSTRAINT FKSTUDENT FOREIGN KEY(student_id) REFERENCES student(id) ON DELETE CASCADE, CONSTRAINT FKENSEMBLE FOREIGN KEY(ensemble_id) REFERENCES ensemble(id) ON DELETE CASCADE);
CREATE TABLE lesson_instrument(ensemble_id Integer NOT NULL, instrument VARCHAR(500) NOT NULL, CONSTRAINT ENSEMBLEIDINSTRUMENT PRIMARY KEY(ensemble_id, instrument), CONSTRAINT FKENSEMBLE FOREIGN KEY(ensemble_id) REFERENCES ensemble(id) ON DELETE CASCADE);