create table Faculty (
	FacultyID serial primary key,
	FacultyFirstName VARCHAR(20) not null,
	FacultyLastName VARCHAR(20) not null,
	FacultyEmail VARCHAR(50) not null
);

create table Course(
	CourseID serial primary key,
	CourseName VARCHAR(50) not null,
	InstructorID int references Faculty (FacultyID) ON DELETE SET NULL ON UPDATE CASCADE,
	AcademicYear numeric(4) not null,
	AcademicSemester VARCHAR(20) not null
);

CREATE TABLE Building(
    BuildingID serial primary key,
    BuildingName VARCHAR(10) NOT NULL,
    BuildingAddress VARCHAR(50) NOT NUll
);

create table Room (
	RoomID serial primary key,
	RoomName VARCHAR(15) not null,
	BuildingID int references Building (BuildingID) ON DELETE CASCADE ON UPDATE CASCADE,
	Capacity int not null
);

create table Department (
	DepartmentID serial primary key,
	DepartmentName VARCHAR(20)
);

create table Staff (
	StaffID serial primary key,
	DepartmentID int references Department (DepartmentID) ON DELETE SET NULL ON UPDATE CASCADE,
	StaffFirstName VARCHAR(20) not null,
	StaffLastName VARCHAR(20) not null,
	StaffEmail VARCHAR(50) not null
);

create table Event (
	EventID serial primary key,
	EventName VARCHAR(50) not null,
	MainContact int references Staff (StaffID) ON DELETE SET NULL ON UPDATE CASCADE,
	SecondContact int references Staff (StaffID) ON DELETE SET NULL ON UPDATE CASCADE
);

create table RoomAssignment (
	RoomAssignmentID serial primary key,
	EventID int references Event (EventID) ON DELETE CASCADE ON UPDATE CASCADE,
	CourseID int references Course (CourseID) ON DELETE CASCADE ON UPDATE CASCADE,
	RoomID int not null references Room (RoomID) ON DELETE CASCADE ON UPDATE CASCADE,
	ExpectedParticipant int NOT NULL,
    Detail VARCHAR(200)
);

create table Schedule (
	ScheduleID serial primary key,
	RoomAssignmentID int references RoomAssignment (RoomAssignmentID) ON DELETE SET NULL ON UPDATE CASCADE,
    ScheduledDate date,
	StartTime time with time zone not null,
	EndTime time with time zone not null,
	Recurring Boolean not null,
	DayOfWeek text,
	RecurringStartDate date,
	RecurringEndDate date,
	CHECK (StartTime < EndTime)
);