-- =========================================================
-- CALISTHENICS WORKOUT PROGRESSION - CREATE + INSERT SCRIPT
-- Upload this file to a GitHub repo (or Gist) and paste the link.
-- Written in standard MySQL syntax.
-- =========================================================

DROP TABLE IF EXISTS workout_logs;
DROP TABLE IF EXISTS user_progress;
DROP TABLE IF EXISTS user_enrollments;
DROP TABLE IF EXISTS schedule_exercises;
DROP TABLE IF EXISTS program_schedule;
DROP TABLE IF EXISTS programs;
DROP TABLE IF EXISTS progression_exercises;
DROP TABLE IF EXISTS exercises;
DROP TABLE IF EXISTS skill_progressions;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS users;

-- =========================================================
-- TABLE CREATION
-- =========================================================

CREATE TABLE skills (
    skill_id        INT AUTO_INCREMENT PRIMARY KEY,
    skill_name      VARCHAR(100) NOT NULL UNIQUE,
    category        VARCHAR(50),
    difficulty_level VARCHAR(20),
    description     TEXT
);

CREATE TABLE skill_progressions (
    progression_id  INT AUTO_INCREMENT PRIMARY KEY,
    skill_id        INT NOT NULL,
    progression_name VARCHAR(100) NOT NULL,
    level_order     INT NOT NULL,
    description     TEXT,
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);

CREATE TABLE exercises (
    exercise_id     INT AUTO_INCREMENT PRIMARY KEY,
    exercise_name   VARCHAR(100) NOT NULL,
    muscle_group    VARCHAR(50),
    equipment_needed VARCHAR(100),
    description     TEXT
);

CREATE TABLE progression_exercises (
    progression_exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    progression_id  INT NOT NULL,
    exercise_id     INT NOT NULL,
    sets            INT,
    reps            VARCHAR(30),
    FOREIGN KEY (progression_id) REFERENCES skill_progressions(progression_id),
    FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id)
);

CREATE TABLE programs (
    program_id      INT AUTO_INCREMENT PRIMARY KEY,
    program_name    VARCHAR(100) NOT NULL,
    target_skill_id INT NOT NULL,
    duration_weeks  INT,
    difficulty_level VARCHAR(20),
    description     TEXT,
    FOREIGN KEY (target_skill_id) REFERENCES skills(skill_id)
);

CREATE TABLE program_schedule (
    schedule_id     INT AUTO_INCREMENT PRIMARY KEY,
    program_id      INT NOT NULL,
    week_number     INT NOT NULL,
    day_number      INT NOT NULL,
    workout_name    VARCHAR(100),
    FOREIGN KEY (program_id) REFERENCES programs(program_id)
);

CREATE TABLE schedule_exercises (
    schedule_exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    schedule_id     INT NOT NULL,
    exercise_id     INT NOT NULL,
    sets            INT,
    reps            VARCHAR(30),
    rest_seconds    INT,
    order_in_workout INT,
    FOREIGN KEY (schedule_id) REFERENCES program_schedule(schedule_id),
    FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id)
);

CREATE TABLE users (
    user_id         INT AUTO_INCREMENT PRIMARY KEY,
    full_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    age             INT,
    weight_kg       DECIMAL(5,2),
    height_cm       DECIMAL(5,2),
    date_joined     DATE
);

CREATE TABLE user_enrollments (
    enrollment_id   INT AUTO_INCREMENT PRIMARY KEY,
    user_id         INT NOT NULL,
    program_id      INT NOT NULL,
    start_date      DATE,
    status          VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (program_id) REFERENCES programs(program_id)
);

CREATE TABLE user_progress (
    progress_id     INT AUTO_INCREMENT PRIMARY KEY,
    user_id         INT NOT NULL,
    progression_id  INT NOT NULL,
    date_achieved   DATE,
    notes           TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (progression_id) REFERENCES skill_progressions(progression_id)
);

CREATE TABLE workout_logs (
    log_id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id         INT NOT NULL,
    schedule_id     INT NOT NULL,
    date_completed  DATE,
    notes           TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (schedule_id) REFERENCES program_schedule(schedule_id)
);

-- =========================================================
-- SAMPLE DATA (INSERT)
-- =========================================================

INSERT INTO skills (skill_name, category, difficulty_level, description) VALUES
('Front Lever', 'Pull', 'Advanced', 'Horizontal back-lever hold showing extreme lat and core strength'),
('Muscle-Up', 'Pull', 'Intermediate', 'Explosive pull-up transitioning into a dip above the bar'),
('Handstand', 'Balance', 'Intermediate', 'Freestanding vertical balance on the hands'),
('Planche', 'Push', 'Advanced', 'Horizontal push hold with the body parallel to the ground');

INSERT INTO skill_progressions (skill_id, progression_name, level_order, description) VALUES
(1, 'Tuck Front Lever', 1, 'Knees tucked to chest, hips near bar'),
(1, 'Advanced Tuck Front Lever', 2, 'Hips extended, knees still bent'),
(1, 'Straddle Front Lever', 3, 'Legs straight and spread wide'),
(1, 'Full Front Lever', 4, 'Legs straight and together, full hold'),
(2, 'Strict Pull-Up', 1, 'Full range dead-hang pull-up'),
(2, 'Explosive/High Pull-Up', 2, 'Pull-up with chest reaching the bar fast'),
(2, 'Muscle-Up Transition', 3, 'Bar transition drill from pull to dip'),
(2, 'Full Muscle-Up', 4, 'Complete strict muscle-up'),
(3, 'Wall Handstand', 1, 'Handstand hold against a wall for support'),
(3, 'Chest-to-Wall Handstand', 2, 'Facing wall, hollow body alignment'),
(3, 'Freestanding Handstand Hold', 3, 'Balanced hold, no wall, 10-30 sec'),
(3, 'Handstand Push-Up', 4, 'Full pressing strength in handstand position');

INSERT INTO exercises (exercise_name, muscle_group, equipment_needed, description) VALUES
('Tuck Front Lever Hold', 'Back/Core', 'Pull-up bar', 'Static hold with knees tucked'),
('Straddle Front Lever Hold', 'Back/Core', 'Pull-up bar', 'Static hold with legs straddled'),
('Strict Pull-Up', 'Back/Biceps', 'Pull-up bar', 'Dead-hang to chin-over-bar pull'),
('Explosive Pull-Up', 'Back/Biceps', 'Pull-up bar', 'Fast pull-up aiming chest to bar'),
('Muscle-Up Transition Drill', 'Back/Chest/Triceps', 'Pull-up bar/rings', 'Low ring or bar transition practice'),
('Wall Handstand Hold', 'Shoulders/Core', 'Wall', 'Handstand facing away from wall'),
('Chest-to-Wall Handstand Hold', 'Shoulders/Core', 'Wall', 'Handstand facing the wall'),
('Pike Push-Up', 'Shoulders/Triceps', 'None', 'Push-up in a pike position to build pressing strength'),
('Core Hollow Body Hold', 'Core', 'None', 'Full-body tension hold on the floor'),
('Planche Lean', 'Shoulders/Chest/Core', 'Parallettes', 'Weight shifted forward onto the hands');

INSERT INTO progression_exercises (progression_id, exercise_id, sets, reps) VALUES
(1, 1, 4, '10-15 sec hold'),
(1, 9, 3, '20-30 sec hold'),
(3, 2, 4, '8-12 sec hold'),
(5, 3, 5, '5-8 reps'),
(6, 4, 5, '3-5 reps'),
(7, 5, 4, '5-8 reps'),
(9, 6, 4, '20-40 sec hold'),
(10, 7, 4, '20-40 sec hold'),
(11, 7, 5, '10-20 sec hold'),
(12, 8, 4, '6-10 reps');

INSERT INTO programs (program_name, target_skill_id, duration_weeks, difficulty_level, description) VALUES
('Front Lever Mastery Program', 1, 12, 'Advanced', '12-week program to unlock the full front lever'),
('Muscle-Up Builder Program', 2, 8, 'Intermediate', '8-week program to achieve the first strict muscle-up'),
('Handstand Foundations Program', 3, 6, 'Beginner', '6-week program to build a freestanding handstand');

INSERT INTO program_schedule (program_id, week_number, day_number, workout_name) VALUES
(1, 1, 1, 'Front Lever Pull Day A'),
(1, 1, 3, 'Front Lever Core Day B'),
(2, 1, 1, 'Muscle-Up Pull Strength'),
(2, 1, 3, 'Muscle-Up Transition Practice'),
(3, 1, 1, 'Handstand Balance Day A'),
(3, 1, 3, 'Handstand Pressing Day B');

INSERT INTO schedule_exercises (schedule_id, exercise_id, sets, reps, rest_seconds, order_in_workout) VALUES
(1, 1, 4, '10-15 sec hold', 90, 1),
(1, 9, 3, '20-30 sec hold', 60, 2),
(2, 2, 4, '8-12 sec hold', 90, 1),
(3, 3, 5, '5-8 reps', 90, 1),
(4, 5, 4, '5-8 reps', 90, 1),
(5, 6, 4, '20-40 sec hold', 60, 1),
(6, 8, 4, '6-10 reps', 60, 1);

INSERT INTO users (full_name, email, age, weight_kg, height_cm, date_joined) VALUES
('Juan Dela Cruz', 'juan.delacruz@email.com', 22, 68.5, 172.0, '2026-01-10'),
('Maria Santos', 'maria.santos@email.com', 25, 55.0, 160.0, '2026-02-15'),
('Mark Reyes', 'mark.reyes@email.com', 28, 74.2, 178.0, '2026-03-01');

INSERT INTO user_enrollments (user_id, program_id, start_date, status) VALUES
(1, 1, '2026-01-12', 'Active'),
(2, 3, '2026-02-16', 'Active'),
(3, 2, '2026-03-02', 'Completed');

INSERT INTO user_progress (user_id, progression_id, date_achieved, notes) VALUES
(1, 1, '2026-02-01', 'First clean tuck front lever hold for 12 sec'),
(2, 9, '2026-02-20', 'Wall handstand hold reaching 30 sec'),
(3, 5, '2026-03-05', 'Strict pull-up strength confirmed'),
(3, 8, '2026-04-20', 'Achieved first full muscle-up');

INSERT INTO workout_logs (user_id, schedule_id, date_completed, notes) VALUES
(1, 1, '2026-01-13', 'Felt strong, held tuck for 12 sec'),
(1, 2, '2026-01-15', 'Core fatigued fast'),
(2, 5, '2026-02-17', 'Wall handstand steady'),
(3, 3, '2026-03-03', 'Completed 5x8 pull-ups'),
(3, 4, '2026-03-05', 'Transition drill improving');
