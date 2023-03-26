SELECT JSON_AGG(JSON_BUILD_OBJECT(
      'ScheduleID', s.ScheduleID,
      'Date', s.ScheduledDate,
      'StartTime', s.StartTime,
      'EndTime', s.EndTime,
      'Room', (SELECT JSON_AGG(JSON_BUILD_OBJECT(
            'Room', r.RoomName,
            'ExpectedParticipant', ra.ExpectedParticipant,
            'Capacity', r.Capacity))
            FROM  RoomAssignment ra LEFT JOIN Room r
            ON ra.RoomID = r.RoomID
            WHERE ra.RoomAssignmentID = s.RoomAssignmentID
            ),
      'Event',(SELECT JSON_AGG(JSON_BUILD_OBJECT(
            'Event', e.EventName,
            'MainContact', s2.SatffFirstName||" "||s2.SatffLastName))
            FROM RoomAssignment ra LEFT JOIN Event e
            ON ra.EventID = e.EventID LEFT JOIN Staff s2
            ON e.MainContact = s2.StaffID
            WHERE ra.RoomAssignmentID = s.RoomAssignmentID
      )
))
FROM Schedule s