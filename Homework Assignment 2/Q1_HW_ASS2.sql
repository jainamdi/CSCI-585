/* DB software browser for SQLite is used for running SQL queries
* First create one table named COURSE_COUNT.
* Insert values into the table using insert command used.
* Then it searches for all the rows and checks the count of number of students that have taken a particular course.
* We get the count for all different subjects student have taken and also the count for each and every subject by grouping all same classname from all records.
* After obtaining the count arrange the record in decreasing order by Total attribute which contains count of each and every course.
* Selected records are returned.
*/
CREATE TABLE COURSE_COUNT ( 
    SID INTEGER NOT NULL, 
    ClassName VARCHAR2(25) NOT NULL, 
    GRADE VARCHAR2(2),
    PRIMARY KEY (SID, ClassName));

Insert into COURSE_COUNT values
  (123,'Processing','A'),
  (123,'Python','B'),
  (123,'Scratch','B'),
  (662,'Java','B'),
  (662,'Python','A'),
  (662,'JavaScript','A'),
  (662,'Scratch','B'),
  (345,'Scratch','A'),
  (345,'JavaScript','B'),
  (345,'Python','A'),
  (555,'Python','B'),
  (555,'JavaScript','B');

SELECT DISTINCT ClassName, COUNT(*) AS Total
FROM COURSE_COUNT
GROUP BY ClassName
ORDER BY Total DESC;
