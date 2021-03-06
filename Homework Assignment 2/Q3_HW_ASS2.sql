/* DB software browser for SQLite is used for running SQL queries
* First create one table named PROJECT.
* Insert values into the table using insert command.
* Then it searches for all the rows and checks whether the step is zero or not and if the step is zero then it checks whether it is completed or not.
* If the step zero is not completed then the project is not considered at all as the first statement of and operator is false.
* But if the first and second condition are both true then it goes for checking final condition where it checks two criteria.
* Then it checks for steps that are not zero because condition for step zero is already calculated. For steps other then zero it checks whether all are in waiting or not. If all further steps are in waiting for each different project ID then it return those project ID as a result of the query.
*/
CREATE TABLE PROJECT(  
    PID VARCHAR2(10) NOT NULL,  
    STEP INTEGER NOT NULL,  
    STATUS VARCHAR2(5) NOT NULL,  
    PRIMARY KEY(PID,STEP) 
);

INSERT INTO PROJECT_MONITOR  VALUES('P100', 0, 'C');
INSERT INTO PROJECT_MONITOR VALUES('P100', 1, 'W');
INSERT INTO PROJECT_MONITOR VALUES('P100', 2, 'W');
INSERT INTO PROJECT_MONITOR VALUES('P201', 0, 'C');
INSERT INTO PROJECT_MONITOR VALUES('P201', 1, 'C');
INSERT INTO PROJECT_MONITOR VALUES('P333', 0, 'W');
INSERT INTO PROJECT_MONITOR VALUES('P333', 1, 'W');
INSERT INTO PROJECT_MONITOR VALUES('P333', 2, 'W');
INSERT INTO PROJECT_MONITOR VALUES('P333', 3, 'W');

SELECT DISTINCT PID
FROM PROJECT_MONITOR P
WHERE Step = 0
AND Status = 'C'
AND 'W' = (SELECT ALL Status
FROM PROJECT_MONITOR Q
WHERE Step != 0
AND P.PID = Q.PID);