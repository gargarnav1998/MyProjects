create table Roles( RoleId int primary key Identity(1,1),
					RoleName varchar(30) NOT NULL
				  );

create table Employee( EmployeeId int primary key Identity(1,1),
					   EmployeeName varchar(30) NOT NULL,
					   EmployeeEmail varchar(50) NOT NULL,
					   RoleId int NOT NULL,
					   RefreshToken varchar(100), 
					   FOREIGN KEY (RoleId) REFERENCES Roles(RoleId),
					   );

create table ExpenseType( ExpenseTypeId int primary key Identity(1,1),
						  ExpenseName varchar(30) NOT NULL,
						  ExpenseAmount decimal(6) NOT NULL,
						  IsIndividual bit NOT NULL
						  );

create table EmployeeBudget( EmployeeBudgetId int primary key Identity(1,1),
							 EmployeeId int NOT NULL,
							 ExpenseTypeId int NOT NULL,
							 AmountAllotted  decimal(6) NOT NULL,
							 FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
							 FOREIGN KEY (ExpenseTypeId) REFERENCES ExpenseType(ExpenseTypeId),
							 );


create table Expense( ExpenseId int primary key Identity(1,1),
					  ExpenseCreatorId int NOT NULL, 
					  ExpenseDate Date NOT NULL,
					  CreationDate Date NOT NULL,
					  ApproverId int NOT NULL,
					  ExpenseTypeId int NOT NULL,
					  ExpensePurpose varchar(60) NOT NULL,
					  BillImage image,
					  ImagePath varchar(100),
					  ModifiedDate date
					  FOREIGN KEY (ExpenseCreatorId) REFERENCES Employee(EmployeeId),
					  FOREIGN KEY (ApproverID) REFERENCES Employee(EmployeeId),
					  FOREIGN KEY (ExpenseTypeId) REFERENCES ExpenseType(ExpenseTypeId)
					  );

	create table ExpenseStatus( ExpenseStatusId int primary key Identity(1,1),
					ExpenseApproval varchar(15)
				  );

				  Insert into ExpenseStatus values ('Pending'),
							('Approved'),
							('Rejected')
						


create table ExpenseParticipant( ExpenseParticipantId int primary key Identity(1,1), 
								 EmployeeId int NOT NULL,
								 ExpenseId int NOT NULL,
								 AmountApproved decimal(5),
								 AmountClaimed decimal(5) NOT NULL,
								 ExpenseRemark varchar(60),
								 ExpenseStatusId  int not null,
								 FOREIGN KEY (ExpenseId) REFERENCES Expense(ExpenseId),
								 FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
								 FOREIGN KEY (ExpenseStatusId) REFERENCES ExpenseStatus(ExpenseStatusId),

								 );

Insert into Roles values ('Employee'),
						('Approver'),
						('Admin');

Insert into Employee(EmployeeName,EmployeeEmail,RoleId) values ('Nikhil Yadav', 'nikhil.yadav@optimusinfo.com', 3),
							('Arnav Garg', 'arnav.garg@optimusinfo.com', 2),
							('Ashutosh Tiwari', 'ashutosh.tiwari@optimusinfo.com', 2),
							('Nipun Jindal', 'nipun.jindal@optimusinfo.com', 1),
							('Somya Jain', 'somya.jain@optimusinfo.com', 1),
							('Deepshikha Gupta', 'deepshikha.gupta@optimusinfo.com', 1)

Insert into ExpenseType values ('Recreational', 12000, 0),
							   ('Travel', 5000, 1),
							   ('Certification', 10000, 1),
							   ('Recreational', 12000, 0)

Insert into EmployeeBudget values (1,1,6000),(1,2,7000),(1,3,13000),
								  (2,1,8000),(2,2,9000),(2,3,15000),
								  (3,1,5000),(3,2,6000),(3,3,11000),
								  (4,1,5000),(4,2,6000),(4,3,11000),
								  (5,1,5000),(5,2,6000),(5,3,11000),
								  (6,1,5000),(6,2,6000),(6,3,11000)

select * from Roles;
select * from Employee;
select * from ExpenseType;
select * from Expense;
select * from EmployeeBudget;
select * from ExpenseParticipant;
select * from ExpenseStatus;

drop table Roles;
drop table Employee;
drop table ExpenseType;
drop table Expense;
drop table ExpenseParticipant;
drop table EmployeeBudget;
drop table ExpenseStatus;
