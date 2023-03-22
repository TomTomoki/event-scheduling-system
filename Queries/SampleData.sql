insert into Faculty (FacultyID, FacultyFirstName, FacultyLastName, FacultyEmail) values 
(1, 'Tom', 'Peter', 'tom.p@example.com'),
(2, 'John', 'Smith', 'john.s@example.com'),
(3, 'Mike', 'Yamada', 'mike.y@example.com'),
(4, 'Kaz', 'Johnson', 'kaz.j@example.com'),
(5, 'Luis', 'Peter', 'luis.p@example.com');


insert into Course (CourseID, CourseName, InstructorID, AcademicYear, AcademicSemester) values
(1, 'DAMG7275', 1, 2023, 'Fall'),
(2, 'IE6800', 3, 2023, 'Fall'),
(3, 'CS5800', 5, 2023, 'Fall');


insert into Building (BuildingID, BuildingName, BuildingAddress) values
(1, '401', '401 Terry Ave N #103, Seattle, WA 98109'),
(2, '225', '225 Terry Ave N, Seattle, WA 98109');


insert into Room (RoomID, RoomName, BuildingID, Capacity) values
(1, '202', 2, 50),
(2, '301', 2, 50),
(3, '102', 1, 100);


insert into Department (DepartmentID, DepartmentName) values
(1, 'IT Services'),
(2, 'Campus Operations'),
(3, 'Career Development');


insert into Staff (StaffID, DepartmentID, StaffFirstName, StaffLastName, StaffEmail) values
(1, 1, 'Thomas', 'John', 'thomas@example.com'),
(2, 2, 'Aya', 'Ishida', 'aya@example.com'),
(3, 3, 'Bill', 'Jassy', 'bill@example.com');


insert into Event (EventID, EventName, MainContact, SecondContact) values
(1, 'Career Fair', 3, 2),
(2, 'Alumni Networking', 3, 2),
(3, 'IT Support Weekly Session', 1, 2);


-- Event
insert into RoomAssignment (RoomAssignmentID, EventID, RoomID, ExpectedParticipant, Detail) values
(1, 1, 3, 95, '2023 Spring STEM Career Fair'),
(2, 2, 1, 40, '2023 Fall CPS Alumni Gathering');

-- Course
insert into RoomAssignment (RoomAssignmentID, CourseID, RoomID, ExpectedParticipant, Detail) values
(3, 1, 2, 40, 'Seattle campus - session A'), 
(4, 2, 2, 30, 'Seattle campus - session A'), 
(5, 3, 1, 25, 'Seattle campus - session C');


insert into Schedule (ScheduleID, RoomAssignmentID, ScheduledDate, StartTime, EndTime, Recurring, DayOfWeek, RecurringStartDate, RecurringEndDate) values
(1, 1, '2023-05-05', '10:00:00 PST', '17:00:00 PST', FALSE, null, null, null),
(2, 2, '2023-04-21', '18:00:00 PST', '20:00:00 PST', FALSE, null, null, null),
(3, 3, null, '13:00:00 PST', '15:00:00 PST', TRUE, 'Wed', '2023-09-10', '2023-12-15'),
(4, 4, null, '10:00:00 PST', '12:00:00 PST', TRUE, 'Mon', '2023-09-10', '2023-12-15'),
(5, 4, null, '10:00:00 PST', '12:00:00 PST', TRUE, 'Thu', '2023-09-10', '2023-12-15');
