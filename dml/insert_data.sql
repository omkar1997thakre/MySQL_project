INSERT INTO city VALUES (1, 'Pune', 'Maharashtra');

INSERT INTO transport_department VALUES (101, 1, 'Pune Transport');

INSERT INTO route VALUES (201, 101, 'Shivaji Nagar', 'Hinjewadi', 18.5);

INSERT INTO bus VALUES (301, 201, 'MH12-AB-1234', 50);

INSERT INTO driver VALUES (401, 301, 'Rajesh Patil', 'DL-987654', 8);

INSERT INTO schedule VALUES (501, 301, '08:00:00', '09:15:00');

INSERT INTO passenger VALUES (601, 'Amit Sharma', 'amit@gmail.com');

INSERT INTO ticket VALUES (701, 601, 301, '2026-01-10', 120.00);

INSERT INTO feedback VALUES (801, 701, 5, 'Comfortable journey');

INSERT INTO complaint VALUES (901, 601, 'Late Arrival', 'Resolved');
