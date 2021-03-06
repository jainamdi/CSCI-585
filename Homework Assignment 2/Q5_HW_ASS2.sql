/* DB software browser for SQLite is used for running SQL queries
* First create one table named qualifiedInstructor.
* Insert values into the table using insert command.
* Then go to qualifiedInstructor table and find the list of Instructors who can teach                         JavaScript.
* Then intersect with the list of Instructors who can teach Scratch.
* Then again intersect with the list of Instructors who can teach Python and output the corresponding list of chefs.
*/

CREATE TABLE qualifiedInstructor( 
    Instructor VARCHAR2(20) NOT NULL, 
    Subject VARCHAR2(20) NOT NULL 
);

insert into qualifiedInstructor values ('Aleph','Scratch');
insert into qualifiedInstructor values ('Aleph','Java');
insert into qualifiedInstructor values ('Aleph','Processing');
insert into qualifiedInstructor values ('Bit','Python');
insert into qualifiedInstructor values ('Bit','JavaScript');
insert into qualifiedInstructor values ('Bit','Java');
insert into qualifiedInstructor values ('CRC','Python');
insert into qualifiedInstructor values ('CRC','JavaScript');
insert into qualifiedInstructor values ('Dat','Scratch');
insert into qualifiedInstructor values ('Dat','Python');
insert into qualifiedInstructor values ('Dat','JavaScript');
insert into qualifiedInstructor values ('Emscr','Scratch');
insert into qualifiedInstructor values ('Emscr','Processing');
insert into qualifiedInstructor values ('Emscr','JavaScript');
insert into qualifiedInstructor values ('Emscr','Python');

SELECT Instructor FROM qualifiedInstructor qi 
WHERE qi.Subject = 'Scratch'  
INTERSECT  
SELECT Instructor FROM qualifiedInstructor qi 
WHERE qi.Subject = 'JavaScript'  
INTERSECT  
SELECT Instructor FROM qualifiedInstructor qi  
WHERE qi.Subject = 'Python'