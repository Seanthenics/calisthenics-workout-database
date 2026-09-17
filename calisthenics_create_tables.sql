PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS workout_logs;
DROP TABLE IF EXISTS user_progress;
DROP TABLE IF EXISTS user_enrollments;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS schedule_exercises;
DROP TABLE IF EXISTS program_schedule;
DROP TABLE IF EXISTS programs;
DROP TABLE IF EXISTS progression_exercises;
DROP TABLE IF EXISTS exercises;
DROP TABLE IF EXISTS skill_progressions;
DROP TABLE IF EXISTS skills;

PRAGMA foreign_keys = ON;


-- 1. SKILLS
CREATE TABLE skills (
    skill_id INTEGER PRIMARY KEY,
    skill_name TEXT NOT NULL,
    difficulty_level TEXT NOT NULL,
    description TEXT
);


-- 2. SKILL PROGRESSIONS
CREATE TABLE skill_progressions (
    progression_id INTEGER PRIMARY KEY,
    skill_id INTEGER NOT NULL,
    progression_name TEXT NOT NULL,
    level_order INTEGER NOT NULL,
    description TEXT,
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);


-- 3. EXERCISES
CREATE TABLE exercises (
    exercise_id INTEGER PRIMARY KEY,
    exercise_name TEXT NOT NULL,
    muscle_group TEXT,
    difficulty_level TEXT,
    description TEXT
);


-- 4. PROGRESSION EXERCISES
CREATE TABLE progression_exercises (
    progression_id INTEGER NOT NULL,
    exercise_id INTEGER NOT NULL,
    sets INTEGER,
    reps INTEGER,
    rest_seconds INTEGER,
    PRIMARY KEY (progression_id, exercise_id),
    FOREIGN KEY (progression_id) REFERENCES skill_progressions(progression_id),
    FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id)
);


-- 5. PROGRAMS
CREATE TABLE programs (
    program_id INTEGER PRIMARY KEY,
    program_name TEXT NOT NULL,
    skill_id INTEGER NOT NULL,
    difficulty_level TEXT,
    duration_weeks INTEGER,
    description TEXT,
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);


-- 6. PROGRAM SCHEDULE
CREATE TABLE program_schedule (
    schedule_id INTEGER PRIMARY KEY,
    program_id INTEGER NOT NULL,
    week_number INTEGER NOT NULL,
    day_number INTEGER NOT NULL,
    workout_name TEXT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES programs(program_id)
);


-- 7. SCHEDULE EXERCISES
CREATE TABLE schedule_exercises (
    schedule_id INTEGER NOT NULL,
    exercise_id INTEGER NOT NULL,
    order_in_workout INTEGER NOT NULL,
    sets INTEGER,
    reps INTEGER,
    rest_seconds INTEGER,
    PRIMARY KEY (schedule_id, exercise_id),
    FOREIGN KEY (schedule_id) REFERENCES program_schedule(schedule_id),
    FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id)
);


-- 8. USERS
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    experience_level TEXT,
    join_date TEXT
);


-- 9. USER ENROLLMENTS
CREATE TABLE user_enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    program_id INTEGER NOT NULL,
    start_date TEXT,
    status TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (program_id) REFERENCES programs(program_id)
);


-- 10. USER PROGRESS
CREATE TABLE user_progress (
    progress_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    progression_id INTEGER NOT NULL,
    date_achieved TEXT,
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (progression_id) REFERENCES skill_progressions(progression_id)
);


-- 11. WORKOUT LOGS
CREATE TABLE workout_logs (
    log_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    schedule_id INTEGER NOT NULL,
    workout_date TEXT,
    duration_minutes INTEGER,
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (schedule_id) REFERENCES program_schedule(schedule_id)
);