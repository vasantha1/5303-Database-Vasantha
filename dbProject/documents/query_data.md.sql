### Title:Online Resume System Test Queries
### Names:Vasantha Gundeti,Sahaja Reddy Naredla

#### Question 1:
Show all Job seekers.

SQL:
'''
SELECT FIRST , last
FROM user
JOIN Roles ON Roles.User_ID = user.User_ID
WHERE Role =  'jobseeker'
LIMIT 0 , 30
'''

#### Answer:
'''
first	      last	
serah	      van doorne
oktay	      pauw
necmettin     coppes
nataÅ¡a	      grob
mischa	      voorhorst
meine	      van eert
mariella      van aart
kenan	      mikkers
gerharda      visch
faouzi	      kee
ashana	      obdam
armaan	      balfoort
abdÃkadir     mast
'''

#### Question 2:
Show all employees.

SQL:
'''
SELECT FIRST , last
FROM user
JOIN Roles ON Roles.User_ID = user.User_ID
WHERE Role =  'Employee'
LIMIT 0 , 30
'''

#### Answer:
'''
FIRST	last	
sumaya	helderman
paolo	davelaar
milouda	haase
florijn	van venrooij
donato	vreugdenhil
'''

#### Question 3:
Calculate the charge for job seeker X.

SQL:
'''
SELECT FIRST , last, SUM( Amount ) 
FROM user
JOIN Charge_Users ON Charge_Users.User_ID = user.User_ID
JOIN Applied_for ON Applied_for.User_ID = user.User_ID
WHERE Applied_for.User_ID =  'M02'
LIMIT 0 , 30
'''

#### Answer:
'''
FIRST	last	    Amount	
serah	van doorne    20
'''

#### Question 4:
Calculate the charge for company X

SQL:
'''
SELECT Company_Name, SUM( Amount ) 
FROM Company
JOIN Charge_Company ON Charge_Company.Company_Id = Company.Company_Id
JOIN Interviews ON Interviews.Company_Id = Company.Company_Id
WHERE Interviews.Company_Id =  '301'
LIMIT 0 , 30
'''

#### Answer:
'''
Company_Name	SUM( Amount )	
infosys	         30
'''

#### Question 5:
Find the company with the most jobs

SQL:
'''
SELECT Company_Id, COUNT( Company_Id ) n
FROM Posted_Jobs
GROUP BY Company_Id
ORDER BY n DESC 
LIMIT 1
'''

#### Answer:
'''
Company_Id	n	
301	        3
'''

#### Question 6:
Find the average # of interviews for all active users

SQL:
'''
SELECT (
COUNT( Company_ID ) / COUNT( DISTINCT (
User_ID
) )
) AS avg
FROM Interviews
LIMIT 0 , 30

'''
####Answer:
'''
avg	
1.4615
'''

#### Question 7:
Add a new administrator(worker)

SQL:
'''
INSERT INTO USER( user_id, last, 
FIRST , street, city, state, zip, phone, email, 
PASSWORD , picture, SSN, Credit_Card_no, Expiration_Month, Expiration_Year, CVC ) 
VALUES (
 'M20',  'jackson',  'amy',  '4700 taft',  'wichitafalls',  'texas', 76308, 9406134856,  'amyjackson@gmail.com', 12345,  'null', 4582163795, 347055608812334, 7, 2016, 714
)
'''

#### Question 8:
Find the customer representative with most interviews

SQL:
'''
SELECT customer, COUNT( customer ) n
FROM Interviews
GROUP BY customer
ORDER BY n DESC 
LIMIT 1
'''

#### Answer:
'''
customer	    n	
develaar paolo	7
'''

#### Question 10:
Find the company that generated the most interviews this month.

SQL:
'''
SELECT Company_Name, COUNT( Company_Name ) AS interviews
FROM Company
JOIN Interviews ON Interviews.Company_Id = Company.Company_Id
GROUP BY Company_Name
ORDER BY interviews DESC 
LIMIT 0 , 
'''

#### Answer:
'''
Company_Name  interviews
Infosys         6
'''

#### Question:11
Find all interviews that were done last year.

SQL:
'''
SELECT * 
FROM Interviews
WHERE YEAR( DATE ) =2014
LIMIT 0 , 30
'''

#### Answer:
'''
Job_Category_ID	 Company_Id  User_ID    Date	    Completed	
402	              305	        M11   2014-11-24	 Yes
407	              301	        M09   2014-12-17	 No
407	              304	        M06   2014-12-01	 Yes
'''

#### Question 12:
Add a new job seeker

SQL:
'''
INSERT INTO USER( User_ID, last, 
FIRST , street, city, state, zip, phone, email, 
PASSWORD , picture, SSN, Credit_Card_no, Expiration_Month, Expiration_Year, CVC, Document, Date_Posted, Desired_Job_Categories ) 
VALUES (
'M19',  'carter',  'julia',  '1386 wycliff ave',  'bathurst',  'tasmania',  '89584',  '07-4814-7839',  'julia.carter@example.com',  '7grout',  '',  '1333455676',  '312040608872034', 12, 2019, 910,  'null',  '2015-05-01',  'Dentist'
)
'''


#### Question 14:
Find the jobseeker with most scheduled interviews(meaning they are scheduled, but not completed)

SQL:
'''
SELECT FIRST , last, user.User_ID, COUNT( Interviews.User_ID ) c
FROM Interviews
JOIN user ON user.User_ID = Interviews.User_ID
WHERE Completed =  'No'
GROUP BY Interviews.User_ID
ORDER BY c DESC 
LIMIT 1
'''

#### Answer:
'''
FIRST	last	User_ID	  c	
oktay	pauw	M04	      2
'''

#### Question 15:
Find all jobs within category X.

SQL:
'''
SELECT Sub_Categories
FROM Job_Categories
WHERE Parent_Category =  'IT'
LIMIT 0 , 30
'''

#### Answer:
'''
Sub_Categories	
Database administrator
Tester
Developer
'''

#### Question 16:
Find all jobs within category X and subcategory 'Y'

SQL:
'''
SELECT DISTINCT Parent_Category, Sub_Categories, Job_Category_Name
FROM Job_Categories
WHERE Job_Category_Name
IN (
 'Computers',  'Business'
)
LIMIT 0 , 30
'''

#### Answer:
'''
Parent_Category	    Sub_Categories	       Job_Category_Name	
IT	             Database administrator	      Computers
Marketing	     Sales manager	              Business
IT	             Tester	                      Computers
IT	             Developer	                  Computers
'''


#### Question 17:
Find the count of currently posted jobs in each category and list from most to least.

SQL:
'''
SELECT Job_Category_Name, Parent_Category, Sub_Categories, COUNT( Sub_Categories ) AS n
FROM Job_Categories
JOIN Posted_Jobs ON Job_Categories.Job_Category_ID = Posted_Jobs.Job_Category_ID
WHERE Date_Posted = current_date
GROUP BY Sub_Categories
ORDER BY n DESC 
LIMIT 0 , 30
'''

#### Answer:
'''
Job_Category_Name	Parent_Category	  Sub_Categories	     n	
Computers	           IT	           Developer	         2
Finance	             Banking	       Cashier	             1
Computers	           IT	         Database administrator
'''

#### Question 18:
Find the count of past posted jobs in each category and list from most to least.

SQL:
'''
SELECT Job_Category_Name, Parent_Category, Sub_Categories, COUNT( Sub_Categories ) AS n
FROM Job_Categories
JOIN Posted_Jobs ON Job_Categories.Job_Category_ID = Posted_Jobs.Job_Category_ID
WHERE Date_Posted < current_date
GROUP BY Sub_Categories
ORDER BY n DESC 
LIMIT 0 , 30
'''

#### Answer:
'''
Job_Category_Name	Parent_Category	  Sub_Categories	      n	
Computers	          IT	           Tester	              4
Computers	          IT	          Database administrator  1
Food Service	      Restaurant	  Manager	              1
Health Science	      Medical	      Dentist	              1
Business	          Marketing	      Sales manager	          1
Computers	          IT	          Developer	              1
'''

#### Question 19:
Find the count of all posted jobs in each category and list by month.

SQL:
'''
SELECT Job_Category_Name, Parent_Category, Sub_Categories, Date_Posted, COUNT( Sub_Categories ) AS n
FROM Job_Categories
JOIN Posted_Jobs ON Job_Categories.Job_Category_ID = Posted_Jobs.Job_Category_ID
GROUP BY Sub_Categories
ORDER BY MONTH( Date_posted ) 
LIMIT 0 , 30
'''

#### Answer:
'''
Job_Category_Name	 Parent_Category	Sub_Categories	          Date_Posted	n	
Health Science	     Medical	          Dentist	               2015-05-20	1
Business	         Marketing	          Sales manager	           2015-06-18	1
Food Service	     Restaurant	          Manager	               2015-08-26	1
Computers	          IT	              Tester	               2015-11-03	4
Finance	             Banking	          Cashier	               2015-12-04	1
Computers	         IT	                  Database administrator   2015-12-04	2
Computers	         IT	                  Developer	               2015-12-04	3
'''

#### Question 20:
Add a job seeker

SQL:
'''
INSERT INTO USER( User_ID, last, 
FIRST , street, city, state, zip, phone, email, 
PASSWORD , picture, SSN, Credit_Card_no, Expiration_Month, Expiration_Year, CVC, Document, Date_Posted, Desired_Job_Categories ) 
VALUES (
'M19',  'carter',  'julia',  '1386 wycliff ave',  'bathurst',  'tasmania',  '89584',  '07-4814-7839',  'julia.carter@example.com',  '7grout',  '',  '1333455676',  '312040608872034', 12, 2019, 910,  'null',  '2015-05-01',  'Dentist'
)
'''


#### Question 21:
Alter a posted job.

SQL:
'''
ALTER TABLE Posted_Jobs ADD Job_Description TEXT
'''

