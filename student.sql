/*###CREATING STUDENT TABLE####/*/

create table student (rollNo int not null, firstName TEXT not null,lastName TEXT not null, emailId TEXT not null, CONSTRAINT pkc_stud Primary Key(rollNo));

/*/############################/*/


/*###CREATING LOG TABLE, for Log entries####/*/

create table log (rollNo int not null,entryDate TEXT not null);

/*/############################/*/


/*###CREATING validRollno TABLE, with valid roll no  entries####/*/

create table validRollNo ( rollNo int not null);
insert into validRollNo values(16101);
insert into validRollNo values(16102);
insert into validRollNo values(16103);
insert into validRollNo values(16104);
insert into validRollNo values(16105);
insert into validRollNo values(16106);
insert into validRollNo values(16107);
insert into validRollNo values(16108);
insert into validRollNo values(16109);
insert into validRollNo values(16110);

/*/############################/*/



/*/#### Problem [1] CREATING A TRIGGER WHICH  WILL MAKE A LOG ENTRY FOR EVERY RECORD BEING ADDED INTO STUDENT TABLE.  ROLLNO AND INSERTION DATETIME SHOULD BE ADDED INTO LOG TABLE###/*/

create trigger stud_log AFTER INSERT ON student
BEGIN
	insert into log values(New.rollNo,datetime('now'));
END;

/*/############################/*/



/*Conditional statements */
/* select case when (bool condition) then this_part_willbe_executed */


/*/#### Problem [2] CREATING A TRIGGER WHICH  WILL ENSURE THAT EVERY RECORD BEING ADDED INTO STUDENT TABLE, ROLLNO BEING ADDED SHOULD BE FROM validRollNo TABLE, OTHERWISE RAISE ERROR ###/*/

create trigger is_valid_rollno BEFORE INSERT ON student
BEGIN
	SELECT CASE 
	WHEN New.rollno not in (select rollNo from validRollNo where rollNo=New.rollNo)
	THEN RAISE(ABORT,'Invalid RollNo')
	END;
END;

/*/############################/*/


/*/#### Problem [3] CREATE A TRIGGER TO ENSURE THAT emailId SHOULD NOT REPEATED IN STUDENT TABLE ###/*/


