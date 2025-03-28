

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('TODO', 'IN_PROGRESS', 'DONE')),
    due_date DATE NOT NULL
);


INSERT INTO tasks (title, status, due_date) VALUES
('Complete project report', 'TODO', '2025-04-01'),
('Fix bug in app', 'IN_PROGRESS', '2025-03-30'),
('Team meeting', 'DONE', '2025-03-25'),
('Submit assignment', 'TODO', '2025-03-28');


SELECT * FROM tasks 
WHERE due_date < NOW() and status = 'TODO';


SELECT * FROM tasks 
ORDER BY due_date ASC;















